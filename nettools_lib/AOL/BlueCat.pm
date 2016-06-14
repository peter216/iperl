############################################################################
# $Id$
#
# $Revision$
############################################################################

package AOL::BlueCat;

use strict;
use warnings;
use English qw( -no_match_vars );
use Time::HiRes qw(gettimeofday tv_interval);
use Net::IP;

use SOAP::Lite
#  trace => 'all'
;
use SOAP::Data::Builder;

# @@@
use Data::Dumper;
$Data::Dumper::Indent = 1;

use AOL::UserInfo;
use AOL::IPUtils qw(valid_ip valid_mask get_dotted_decimal
                    get_cidr_mask get_network_range);
use AOL::OrbIP;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw( find_by_name
                     find_by_cname
                     find_by_ip
                     find_by_subnet
                     find_unused_by_subnet
                     find_all_by_subnet
                     add_host
                     add_ip_to_host
                     remove_host
                     remove_ip_from_host
                     add_cname
                     remove_cname
                     set_ttl
                     dump_timers

                     BLUECAT_STATUS_ERROR
                     BLUECAT_STATUS_OK
                     BLUECAT_STATUS_FOUND
                     BLUECAT_STATUS_NOT_FOUND

                     BLUECAT_ERR_AUTH_ERROR
                     BLUECAT_ERR_INVALID_REQUEST
                     BLUECAT_ERR_NOT_LOGGED_IN
                     BLUECAT_ERR_UNKNOWN_ERR

                     BLUECAT_ERR_INVALID_IP
                     BLUECAT_ERR_INVALID_NETMASK
                     BLUECAT_ERR_INVALID_HOSTNAME
                     BLUECAT_ERR_IP_IN_USE
                     BLUECAT_ERR_HOSTNAME_IN_USE
                     BLUECAT_ERR_HOSTNAME_IP_MISMATCH
                     BLUECAT_ERR_HOSTNAME_NOT_FOUND
                     BLUECAT_ERR_IP_NOT_FOUND
                     BLUECAT_ERR_SOAP_ERROR
                     BLUECAT_ERR_CONNECT_ERROR
                     BLUECAT_ERR_ID_DOES_NOT_EXIST
                     BLUECAT_ERR_INVALID_TYPE
                     BLUECAT_ERR_INVALID_TTL
                     BLUECAT_ERR_ZONE_DOES_NOT_EXIST
                     BLUECAT_ERR_LICENSE_MISSING
                     BLUECAT_ERR_TIMEOUT
                     BLUECAT_ERR_CNAME_NOT_FOUND
                     BLUECAT_ERR_NETWORK_DOES_NOT_EXIST

                     BLUECAT_OPTION_IGNORE_DUP_IP
                   );

use constant BLUECAT_STATUS_ERROR               => 0;
use constant BLUECAT_STATUS_OK                  => 1;
use constant BLUECAT_STATUS_FOUND               => 1;
use constant BLUECAT_STATUS_NOT_FOUND           => 2;

use constant BLUECAT_ERR_AUTH_ERROR             => 1001;
use constant BLUECAT_ERR_INVALID_REQUEST        => 1002;
use constant BLUECAT_ERR_NOT_LOGGED_IN          => 1003;
use constant BLUECAT_ERR_UNKNOWN_ERR            => 1004;

use constant BLUECAT_ERR_INVALID_IP             => 1005;
use constant BLUECAT_ERR_INVALID_NETMASK        => 1006;
use constant BLUECAT_ERR_INVALID_HOSTNAME       => 1007;
use constant BLUECAT_ERR_IP_IN_USE              => 1008;
use constant BLUECAT_ERR_HOSTNAME_IN_USE        => 1009;
use constant BLUECAT_ERR_HOSTNAME_IP_MISMATCH   => 1010;
use constant BLUECAT_ERR_HOSTNAME_NOT_FOUND     => 1011;
use constant BLUECAT_ERR_IP_NOT_FOUND           => 1012;
use constant BLUECAT_ERR_SOAP_ERROR             => 1013;
use constant BLUECAT_ERR_CONNECT_ERROR          => 1014;
use constant BLUECAT_ERR_ID_DOES_NOT_EXIST      => 1015;
use constant BLUECAT_ERR_INVALID_TYPE           => 1016;
use constant BLUECAT_ERR_INVALID_TTL            => 1017;
use constant BLUECAT_ERR_ZONE_DOES_NOT_EXIST    => 1018;
use constant BLUECAT_ERR_LICENSE_MISSING        => 1019;
use constant BLUECAT_ERR_TIMEOUT                => 1020;
use constant BLUECAT_ERR_CNAME_NOT_FOUND        => 1021;
use constant BLUECAT_ERR_NETWORK_DOES_NOT_EXIST => 1022;


use constant BLUECAT_OPTION_IGNORE_DUP_IP     => 'IGNORE_DUP_IP';


my $_DEFAULT_VERSION = 'prod';

my %_bluecat_api_uri      = (
  dev  => 'http://oasisws-dev.ops.aol.com:8100/proteus/service/latest/?wsdl',
  prod => 'http://ws.oasis.aol.com:8100/proteus/service/latest/?wsdl',
);

my $_bluecat_ns = 'http://services.proteus.ws.oasis.aol.com/';
my $_alt_bluecat_ns = 'http://api.proteus.bluecatnetworks.com';

my $_config               = 'AOL';
my $_view                 = 'default';
my $_default_ttl          = -1;

sub new {
  my ($class, %args) = @_;

  my $self = {};
  bless($self, $class);

  $self->{version} = $args{version} || $_DEFAULT_VERSION;
  my $version = substr($self->{version}, 0, 1);
  if (lc($version) eq 'p') {
    $self->{version} = 'prod';
  }
  elsif (lc($version) eq 'd') {
    $self->{version} = 'dev';
  }
  else {
    print "VERSION value '$self->{version}' is invalid\n";
    return undef;
  }

  $self->{license} = $args{license} || '';

  unless ($self->{license}) {
    print "License key must be provided when instantiating an " .
      "AOL::BlueCat object\n";
    return undef;
  }

  $self->{uri} = $args{uri} || $_bluecat_api_uri{$self->{version}};
  $self->{ns} = $args{ns} || $_bluecat_ns;
  $self->{alt_ns} = $args{alt_ns} || $_alt_bluecat_ns;

  $self->{config} = $args{config} || $_config;
  $self->{view} = $args{view} || $_view;
  $self->{ttl} = $args{ttl} || $_default_ttl;

  $self->{config_id} = undef;
  $self->{view_id} = undef;

  $self->{dry_run} = ($args{dry_run}) ? 1: 0;

  $self->{kerb_user} = $args{kerb_user} || undef;

  $self->{soap_error} = undef;
  $self->{soap_error_detail} = undef;
  $self->{login_time} = 0;

  $self->{valid_entity_types} = {
    'Configuration' => 1,
    'View'          => 1,
    'Zone'          => 1,
    'HostRecord'    => 1,
    'AliasRecord'   => 1,
  };

  if ($args{user_cdid}) {
    $self->{user_cdid} = $args{user_cdid};
  }
  else {
    my $ui = AOL::UserInfo->new();
    my $info = $ui->get_user_info($self->{kerb_user});

    if ($info) {
      $self->{user_cdid} = $info->{employee_cdid};
      $self->{user_cdid} = ' ' unless ($self->{user_cdid});
    }
  }

  eval {
    $self->{soap} = SOAP::Lite->autotype(0)
                              ->readable(1)
                              ->proxy($self->{uri})
                              ->ns($self->{ns})
                              ->on_fault(sub { $self->soap_fault(@_); });
  };

  if ($@) {
    $self->{soap_error} = $@;
    $self->{soap} = undef;
  }
  else {
    $self->{soap}->transport->timeout(30);
  }

  $self->_get_config_id();
  $self->_get_view_id();

  %{$self->{timer}} = ();
  $self->{dump_timers} = $args{dump_timers} || undef;
  $self->{full_times} = $args{full_times} || 0;

  $self->{zone_id_cache} = {};

  return $self;
}


sub DESTROY {
  my $self = shift;

  if ($self->{dump_timers}) {
    $self->dump_timers();
  }

  $self->{soap} = undef;
  $self->{soap_error} = undef;
  $self->{soap_error_detail} = undef;
}


sub soap_fault {
  my ($self, $soap, $res) = @_;

  if (ref($res)) {
    $self->{soap_error} = $res->faultstring();
    my $detail = $res->faultdetail();
    $self->{soap_error_detail} .= "\n" . $detail->{stacktrace}
      if (defined($detail) && defined($detail->{stacktrace}));
  }
  else {
    $self->{soap_error} = $soap->transport->status;
  }

  return 0;
}


sub _check_login {
  my ($self) = @_;

  my $ret_val = { status => BLUECAT_STATUS_OK };

  $self->{soap_error} = undef;
  $self->{soap_error_detail} = undef;

  unless ($self->{license}) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_LICENSE_MISSING;
    $ret_val->{error_msg} = 'No webservice license specified';
  }

  unless ($self->{soap}) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_SOAP_ERROR;
    $ret_val->{error_msg} = 'No valid soap object';
  }

  return $ret_val;
}


sub _get_config_id {
  my ($self) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = { status => BLUECAT_STATUS_OK };

  my $start_time = [ gettimeofday() ];

  my $rv = $self->_get_entity_by_name($self->{config}, '00', 'Configuration');

  if ($rv->{status} == BLUECAT_STATUS_OK) {
# @@ if no id
    $self->{config_id} = $rv->{data}{id};
  }

  else {
    $ret_val = $rv;
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time('getEntityByName', "config_id",
                      tv_interval($start_time, $end_time));

  return $ret_val;
}


sub _get_view_id {
  my ($self) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = { status => BLUECAT_STATUS_OK };

  my $start_time = [ gettimeofday() ];

  my $rv = $self->_get_entity_by_name($self->{view}, $self->{config_id},
    'View');

  if ($rv->{status} == BLUECAT_STATUS_OK) {
# @@ if no id
    $self->{view_id} = $rv->{data}{id};
  }

  else {
    $ret_val = $rv;
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time('getEntityByName', "view_id",
                      tv_interval($start_time, $end_time));

  return $ret_val;
}


sub get_zone_info {
  my ($self, $hostname) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = {};

  my $parent_id = $self->{view_id};
  my $full_zone_name = '';

  my @zones = split(/\./, $hostname);
  @zones = reverse(@zones);
  my @zone_data = ();

  foreach my $zone (@zones) {
    my $new_full_zone_name = ($full_zone_name)
      ? $zone . '.' . $full_zone_name : $zone;

    if (defined($self->{zone_id_cache}{$new_full_zone_name})) {
      $full_zone_name = $new_full_zone_name;
      $parent_id = $self->{zone_id_cache}{$full_zone_name}{id};

      my $host = $hostname;
      $host =~ s/\.$full_zone_name$//;
      $host = '' if ($hostname eq $full_zone_name);

      unshift(@zone_data, {
        host       => $host,
        zone_id    => $parent_id,
        deployable => $self->{zone_id_cache}{$full_zone_name}{deployable},
        zone_name  => $full_zone_name });
      next;
    }

    my $start_time = [ gettimeofday() ];

    my $rv = $self->_get_entity_by_name($zone, $parent_id, 'Zone');

    if ($rv->{status} == BLUECAT_STATUS_OK) {
      if ($rv->{data}) {
        $parent_id = $rv->{data}{id};

        my $properties = $self->_get_properties($rv->{data}{properties});
        my $deployable = $properties->{deployable} || 'true';
        $deployable = ($deployable eq 'false') ? 0 : 1;

        $full_zone_name = $new_full_zone_name;
        $self->{zone_id_cache}{$full_zone_name}{id} = $parent_id;
        $self->{zone_id_cache}{$full_zone_name}{deployable} = $deployable;

        my $host = $hostname;
        $host =~ s/\.$full_zone_name$//;
        $host = '' if ($hostname eq $full_zone_name);

        unshift(@zone_data, {
          host       => $host,
          zone_id    => $parent_id,
          deployable => $deployable,
          zone_name  => $full_zone_name });
      }
      else {
        last;
      }
    }

    else {
      return $rv;
    }

    my $end_time = [ gettimeofday() ];

    $self->_record_time('getEntityByName', "Zone: $zone",
                        tv_interval($start_time, $end_time));
  }

  $ret_val->{status} = BLUECAT_STATUS_OK;
  $ret_val->{zone_list} = \@zone_data;

  return $ret_val;
}


# The best deployable zone in a list is the most specific zone (i.e.,
# longest zone, shortest hostname) that is marked as deployable.  The
# zones in the list should already be in order from most specific to
# least specific.
#
sub _find_best_deployable_zone {
  my ($self, $zone_list, $hostname) = @_;

  my $ret_val = {};

  foreach my $zone (@$zone_list) {
    if ($zone->{deployable}) {
      $ret_val->{status} = BLUECAT_STATUS_OK;
      $ret_val->{zone_name} = $zone->{zone_name};
      $ret_val->{zone_id} = $zone->{zone_id};
      $ret_val->{host} = $zone->{host};

      return $ret_val;
    }
  }

  # Could't find any deployable zone.
  #
  $ret_val->{status} = BLUECAT_STATUS_ERROR;
  $ret_val->{error_code} = BLUECAT_ERR_ZONE_DOES_NOT_EXIST;
  $ret_val->{error_msg} = "No deployable zone matching '$hostname' found";

  return $ret_val;
}


sub find_by_name {
  my ($self, $hostname, $find_related) = @_;

  $find_related = 1 unless (defined($find_related));
  return $self->_find_by_name($hostname, 'HostRecord', $find_related);
}


sub find_by_cname {
  my ($self, $cname, $find_related) = @_;

  $find_related = 1 unless (defined($find_related));
  return $self->_find_by_name($cname, 'AliasRecord', $find_related);
}


sub _find_by_name {
  my ($self, $hostname, $type, $find_related) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = {};

  unless ($self->_valid_hostname($hostname)) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_HOSTNAME;
    $ret_val->{error_msg} = sprintf("Specified hostname '%s' is invalid",
                                    $hostname || 'undef');
    return $ret_val;
  }

  my $zone_info = $self->get_zone_info($hostname);

  if ($zone_info->{status} != BLUECAT_STATUS_OK) {
    $ret_val->{status} = $zone_info->{status};
    $ret_val->{error_code} = $zone_info->{error_code} ||
      BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = $zone_info->{error_msg} ||
      "Error retrieving zone info for host '$hostname'";

    return $ret_val;
  }

  my $start_time = [ gettimeofday() ];

  # For each zone in the zone list returned above look for the hostname
  # specified.
  #
  my $record_found = 0;
  foreach my $zone (@{$zone_info->{zone_list}}) {

    my $rv = $self->_get_entity_by_name($zone->{host}, $zone->{zone_id}, $type);

    if ($rv->{status} == BLUECAT_STATUS_OK) {

      if ($rv->{data} && scalar(keys(%{$rv->{data}})) > 0) {
        my $properties = $self->_get_properties($rv->{data}{properties});

        $ret_val->{status} = BLUECAT_STATUS_FOUND;

        if ($type eq 'HostRecord') {
          $ret_val->{id} = $rv->{data}{id};
          $ret_val->{hostname} = $properties->{absoluteName} || 'UNKNOWN';
          $record_found = 1;

          if ($find_related) {
            my $cname = $self->_find_related_record(
              $properties->{absoluteName},
              $rv->{data}{id},
              'AliasRecord');

            unless ($cname->{status} == BLUECAT_STATUS_NOT_FOUND) {
              foreach my $cn (@{$cname->{data}}) {
                push(@{$ret_val->{cnames}}, {
                  target => $properties->{absoluteName},
                  cname  => $cn->{cname},
                  id     => $cn->{id},
                });
              }
            }
          }

          my @ips = (defined($properties->{addresses}))
            ? split(',', $properties->{addresses})
            : ();

          push(@{$ret_val->{host}}, {
            id         => $rv->{data}{id},
            hostname   => $properties->{absoluteName} || 'UNKNOWN',
            ip         => \@ips,
            ttl        => $properties->{ttl} || '',
            comments   => $properties->{comments} || '',
            reverse    => $properties->{reverseRecord} || '',
            zone       => $zone->{zone_name},
            zone_id    => $zone->{zone_id},
            deployable => $zone->{deployable},
          });
        }

        elsif ($type eq 'AliasRecord') {
          $ret_val->{cname_id} = $rv->{data}{id};
          $ret_val->{cname} = $properties->{absoluteName} || 'UNKNOWN';
          $ret_val->{hostname} = $properties->{linkedRecordName} || 'UNKNOWN';
          $ret_val->{comments} = $properties->{comments}
            if (defined($properties->{comments}));
          $record_found = 1;

          if ($find_related) {
# @@@ It looks like this method won't find AliasRecords that
# @@@ point to ExternalHostRecord objects (like for the cname 
# @@@ aws-idp.ops.aol.com.  Might need to get rid of find_related_records
# @@@ in lieu of calls to find CNAME/A records for the target name
# @@@ ($properties->{linkedRecordName}).
            my $cname = $self->_find_related_record($properties->{absoluteName},
              $rv->{data}{id},
              'AliasRecord');

            unless ($cname->{status} == BLUECAT_STATUS_NOT_FOUND) {
              foreach my $cn (@{$cname->{data}}) {
                push(@{$ret_val->{cnames}}, {
                  target => $properties->{absoluteName},
                  cname  => $cn->{cname},
                  id     => $cn->{id},
                });
              }
            }
          }
        }
      }
      else {
        # Nothing found for this hostname/zone/type
      }
    }
    else {
      # @@@ should we finish looking in all of the zones before failing?
      return $rv;
    }
  }

  $ret_val->{zone_list} = $zone_info->{zone_list};

  unless ($record_found) {
    $ret_val->{status} = BLUECAT_STATUS_NOT_FOUND;
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time('getEntityByName', "Host: $hostname",
                      tv_interval($start_time, $end_time));

  return $ret_val;
}


sub _get_entity_by_name {
  my ($self, $name, $parent, $type) = @_;

  my $ret_val = { status => BLUECAT_STATUS_OK };

  unless (defined($name)) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_HOSTNAME;
    $ret_val->{error_msg} = "Entity name must be specified";

    return $ret_val;
  }

  unless ($parent) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_REQUEST;
    $ret_val->{error_msg} = "Entity parent id must be specified";

    return $ret_val;
  }

  unless (defined($self->{valid_entity_types}{$type})) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_TYPE;
    $ret_val->{error_msg} = sprintf("Entity type '%s' is invalid", $type);

    return $ret_val;
  }

  my $soap_data = SOAP::Data::Builder->new;
  $soap_data->add_elem(name   => 'license_key');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => 'license_key');
  $soap_data->add_elem(name   => 'cdid',
                       value  => $self->{user_cdid});
  $soap_data->add_elem(name   => 'parentId',
                       value  => $parent);
  $soap_data->add_elem(name   => 'name',
                       value  => $name);
  $soap_data->add_elem(name   => 'type',
                       value  => $type);

  my $result;

  eval {
    $result = $self->{soap}->getEntityByName($soap_data->to_soap_data);
  };

  if ($@) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = "Webservice call failed: $@";
  }

  elsif ($self->{soap_error}) {
    $self->_set_error($ret_val);
  }

  elsif ($result) {
    if ($result->match(SOAP::SOM::envelope)) {
      my $data = $result->valueof('//getEntityByNameResponse/return');

      $ret_val->{data} = $data;
    }
    else {
      $self->_set_error($ret_val,
        'Did not receive a SOAP Envelope (SOM object)');
    }
  }
  else {
    $self->_set_error($ret_val, 'Webservice call returned no result.');
  }

  return $ret_val;
}


sub _get_properties {
  my ($self, $property_string) = @_;

  my %properties = ();

  return \%properties unless ($property_string);

  foreach my $property (split(/\|/, $property_string)) {
    if ($property =~ /([^=]+)=(.*)/) {
      $properties{$1} = $2;
    }
  }

  return \%properties;
}


sub find_by_ip {
  my ($self, $ip) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = {};

  my $net_ip = Net::IP->new($ip) or
    do {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
      $ret_val->{error_msg} = "Specified IP address '$ip' is not properly " .
                              "formatted";
      return $ret_val;
    };

  my $ip_version = $net_ip->version();
  unless ($ip_version) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
    $ret_val->{error_msg} = "Error cannot determine IP protocol version " .
      "for '$ip': " . Net::IP::Error();
    return $ret_val;
  }

  my $start_time = [ gettimeofday() ];

  my $soap_data = SOAP::Data::Builder->new;
  $soap_data->add_elem(name   => 'license_key');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => 'license_key');
  $soap_data->add_elem(name   => 'cdid',
                       value  => $self->{user_cdid});
  $soap_data->add_elem(name   => 'containerId',
                       value  => $self->{config_id});
  $soap_data->add_elem(name   => 'address',
                       value  => $ip);

  my $result;
  my $api_call;

  eval {
    if ($ip_version eq '4') {
      $api_call = 'getIP4Address';
      $result = $self->{soap}->getIP4Address($soap_data->to_soap_data);
    }
    elsif ($ip_version eq '6') {
      $api_call = 'getIP6Address';
      $result = $self->{soap}->getIP6Address($soap_data->to_soap_data);
    }
  };

  if ($@) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = "Webservice call failed: $@";
  }

  elsif ($self->{soap_error}) {
    $self->_set_error($ret_val);
  }
  
  elsif ($result) {
    if ($result->match(SOAP::SOM::envelope)) {
      my @r;
      if ($ip_version eq '4') {
        @r = $result->valueof('//getIP4AddressResponse/return');
      }
      elsif ($ip_version eq '6') {
        @r = $result->valueof('//getIP6AddressResponse/return');
      }

      my $cnt = 0;
      foreach my $entry (@r) {
        if ($entry) {
          my $property = $self->_get_properties($entry->{properties});

          my $host = $self->_find_related_record($property->{address},
            $entry->{id}, 'HostRecord');

          if ($host->{status} == BLUECAT_STATUS_OK) {

# @@ if we want to return the comments field, then we'll 
# @@ need to look up the hostname that we've found here because
# @@ the comments are not part of the data returned by related_record.

            $ret_val->{status}      = BLUECAT_STATUS_FOUND;
            $ret_val->{ip}          = $property->{address};
            $ret_val->{id}          = $entry->{id};

            foreach my $h (@{$host->{data}}) {
              push(@{$ret_val->{host}}, {
                ip          => $h->{ip},
                hostname    => $h->{name},
                ttl         => $h->{ttl},
                id          => $h->{id},
                reverse     => $h->{reverse},
              });

              my $cname = $self->_find_related_record($h->{name},
                                                      $h->{id},
                                                      'AliasRecord');

              unless ($cname->{status} == BLUECAT_STATUS_NOT_FOUND) {
                foreach my $cn (@{$cname->{data}}) {
                  push(@{$ret_val->{cnames}}, {
                    target => $h->{name},
                    cname  => $cn->{cname},
                    id     => $cn->{id},
                  });
                }
              }
            }

            $cnt++;
          }
        }
      }

      if ($cnt == 0) {
        $ret_val->{status} = BLUECAT_STATUS_NOT_FOUND;
      }
    }
    else {
      $self->_set_error($ret_val,
        'Did not receive a SOAP Envelope (SOM object)');
    }
  }
  else {
    $self->_set_error($ret_val, 'Webservice call returned no result.');
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time($api_call, "$ip", tv_interval($start_time, $end_time));

  return $ret_val;
}


sub find_by_subnet {
  my ($self, $ip, $mask) = @_;

  my $subnet_result = $self->_get_subnet_information($ip, $mask);

  unless ($subnet_result->{status} == BLUECAT_STATUS_OK) {
    return $subnet_result;
  }

  my @ips = grep { $_->{in_use} == 1 } @{$subnet_result->{data}};

  my $ret_val = { status => BLUECAT_STATUS_OK,
                  data   => \@ips,
                };

  return $ret_val;
}


sub find_unused_by_subnet {
  my ($self, $ip, $mask, $first_only) = @_;

  $first_only = 0 unless (defined($first_only));

  my $subnet_result = $self->_get_subnet_information($ip, $mask,
                                                     $first_only);

  unless ($subnet_result->{status} == BLUECAT_STATUS_OK) {
    return $subnet_result;
  }

  my @unused_ips = grep { $_->{in_use} == 0 } @{$subnet_result->{data}};

  my $ret_val = { status => BLUECAT_STATUS_OK,
                  data   => \@unused_ips,
                };

  return $ret_val;
}


sub find_all_by_subnet {
  my ($self, $ip, $mask) = @_;

  my $subnet_result = $self->_get_subnet_information($ip, $mask);

  unless ($subnet_result->{status} == BLUECAT_STATUS_OK) {
    return $subnet_result;
  }

  my @used_ips = grep { $_->{in_use} == 1 } @{$subnet_result->{data}};
  my @unused_ips = grep { $_->{in_use} == 0 } @{$subnet_result->{data}};

  my $ret_val = { status     => BLUECAT_STATUS_OK,
                  used_ips   => \@used_ips,
                  unused_ips => \@unused_ips,
                };

  return $ret_val;
}


sub add_host {
  my $self = shift;
  my $hostname = shift;
  my $ip = shift;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  my $comment = '';
  my $ignore_dup_ip = 0;

  my $parameter = shift || '';
  if ($parameter eq BLUECAT_OPTION_IGNORE_DUP_IP) {
    $ignore_dup_ip = 1;
    $comment = shift;
  }
  else {
    $comment = $parameter;
  }

  $comment = $self->_build_comment() unless ($comment);

  my $ttl = $self->{ttl};
  my $properties = 'addresses=' . $ip .
                   '|absoluteName=' . $hostname .
                   '|ttl=' . $ttl .
                   '|comments=' . $comment . '|';

  $ret_val = { hostname => $hostname,
               ip       => $ip,
               comment  => $comment,
             };

  my $net_ip = Net::IP->new($ip) or
    do {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
      $ret_val->{error_msg} = "Specified IP address '$ip' is not properly " .
                              "formatted";
      return $ret_val;
    };

  my $ip_version = $net_ip->version();
  unless ($ip_version) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
    $ret_val->{error_msg} = "Error cannot determine IP protocol version " .
      "for '$ip': " . Net::IP::Error();
    return $ret_val;
  }

  unless ($self->_valid_hostname($hostname, 1)) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_HOSTNAME;
    $ret_val->{error_msg} = sprintf("Specified hostname '%s' is invalid",
                                    $hostname || 'undef');

    return $ret_val;
  }

  my $result = $self->_find_by_name($hostname, 'HostRecord', 0);

  if ($result->{status} == BLUECAT_STATUS_FOUND) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_HOSTNAME_IN_USE;
    $ret_val->{error_msg} = sprintf("Specified hostname '%s' is in use",
                                    $hostname || 'undef');
    $ret_val->{data}{comments} = $result->{host}[0]{comments};
    $ret_val->{data}{ip} = $result->{host}[0]{ip};
    $ret_val->{data}{hostname} = $result->{hostname};
    return $ret_val;
  }

  # Now see if hostname already exists as cname
  #
  $result = $self->_find_by_name($hostname, 'AliasRecord', 0);

  if ($result->{status} == BLUECAT_STATUS_FOUND) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_HOSTNAME_IN_USE;
    $ret_val->{error_msg} = sprintf("Specified hostname '%s' is in use",
                                    $hostname || 'undef');
    $ret_val->{data}{comments} = $result->{comments};
    $ret_val->{data}{cname} = $result->{cname};
    $ret_val->{data}{hostname} = $result->{hostname};
    return $ret_val;
  }

  unless ($ignore_dup_ip) {
    $result = $self->find_by_ip($ip);

    if ($result->{status} == BLUECAT_STATUS_FOUND) {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_IP_IN_USE;
      $ret_val->{error_msg} = sprintf("Specified IP '%s' is in use",
                                      $ip || 'undef');
      $ret_val->{data}{ip} = $result->{ip};
      $ret_val->{data}{hostname} = $result->{host}[0]{hostname};
      return $ret_val;
    }

    elsif ($result->{status} != BLUECAT_STATUS_NOT_FOUND) {
      $ret_val->{status} = $result->{status};
      $ret_val->{error_code} = $result->{error_code} || BLUECAT_ERR_UNKNOWN_ERR;
      $ret_val->{error_msg} = $result->{error_msg} || 'Unknown error';
      return $ret_val;
    }
  }

  $ret_val->{status} = BLUECAT_STATUS_OK;

  my $start_time = [ gettimeofday() ];

  my $zone_list = $self->get_zone_info($hostname);

  if ($zone_list->{status} != BLUECAT_STATUS_OK) {
    $ret_val->{status} = $zone_list->{status};
    $ret_val->{error_code} = $zone_list->{error_code} ||
      BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = $zone_list->{error_msg} ||
      "Error retrieving zone info for host '$hostname'";

    return $ret_val;
  }

  # Find the zone that we want to deploy this record to.
  #
  my $zone_info = $self->_find_best_deployable_zone($zone_list->{zone_list},
    $hostname);

  if ($zone_info->{status} != BLUECAT_STATUS_OK) {
    $ret_val->{status} = $zone_info->{status};
    $ret_val->{error_code} = $zone_info->{error_code} ||
      BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = $zone_info->{error_msg} ||
      "Error retrieving zone info for host '$hostname'";

    return $ret_val;
  }

  unless ($self->{dry_run}) {
    my $name = $zone_info->{host} || ' ';
    my $soap_data = SOAP::Data::Builder->new;
    $soap_data->add_elem(name   => 'license_key');
    $soap_data->add_elem(name   => 'license',
                         value  => $self->{license},
                         parent => 'license_key');
    $soap_data->add_elem(name   => 'cdid',
                         value  => $self->{user_cdid});
    $soap_data->add_elem(name   => 'parentId',
                         value  => $zone_info->{zone_id});
    $soap_data->add_elem(name   => 'entity');
    $soap_data->add_elem(name   => 'id',
                         value  => '00',
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');
    $soap_data->add_elem(name   => 'name',
                         value  => $name,
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');
    $soap_data->add_elem(name   => 'properties',
                         value  => $properties,
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');
    $soap_data->add_elem(name   => 'type',
                         value  => 'HostRecord',
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');

    eval {
      $result = $self->{soap}->addEntity($soap_data->to_soap_data);
    };

    if ($self->{soap_error}) {
      $self->_set_error($ret_val);
    }

    else {
      if ($@) {
        $self->_set_error($ret_val, "SOAP Error: $@");
      }

      else {
        if ($result) {
          if ($result->match(SOAP::SOM::envelope)) {
            my $result_id = $result->valueof('//addEntityResponse/return');

            if ($result_id) {
              $ret_val->{host_id} = $result_id;

              my $orbip = AOL::OrbIP->new(db => $self->{version});
              $orbip->update_or_create_ip($ip, 'In Use');
            }
            else {
              $ret_val->{status} = BLUECAT_STATUS_ERROR;
              $ret_val->{error_code} = BLUECAT_ERR_UNKNOWN_ERR;
              $ret_val->{error_msg} = $result_id;
            }
          }
          else {
            $self->_set_error($ret_val,
              'Did not receive a SOAP Envelope (SOM object)');
          }
        }
        else {
          $self->_set_error($ret_val, 'Webservice call returned no result.');
        }
      }
    }
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time('addEntity (HostRecord)', "$hostname/$ip",
                      tv_interval($start_time, $end_time));

  return $ret_val;
}


sub add_ip_to_host {
  my $self = shift;
  my $hostname = shift;
  my $ip = shift;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  my $comment = '';
  my $ignore_dup_ip = 0;

  my $parameter = shift || '';
  if ($parameter eq BLUECAT_OPTION_IGNORE_DUP_IP) {
    $ignore_dup_ip = 1;
    $comment = shift;
  }
  else {
    $comment = $parameter;
  }

  $comment = $self->_build_comment() unless ($comment);

  $ret_val = { hostname => $hostname,
               ip       => $ip,
               comment  => $comment,
             };

  my $net_ip = Net::IP->new($ip) or
    do {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
      $ret_val->{error_msg} = "Specified IP address '$ip' is not properly " .
                              "formatted";
      return $ret_val;
    };

  my $ip_version = $net_ip->version();
  unless ($ip_version) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
    $ret_val->{error_msg} = "Error cannot determine IP protocol version " .
      "for '$ip': " . Net::IP::Error();
    return $ret_val;
  }

  unless ($self->_valid_hostname($hostname)) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_HOSTNAME;
    $ret_val->{error_msg} = sprintf("Specified hostname '%s' is invalid",
                                    $hostname || 'undef');

    return $ret_val;
  }

  my $host_result = $self->_find_by_name($hostname, 'HostRecord', 0);

  if ($host_result->{status} == BLUECAT_STATUS_ERROR) {
    return $host_result;
  }

  elsif ($host_result->{status} == BLUECAT_STATUS_NOT_FOUND) {
    return $self->add_host($hostname, $ip, BLUECAT_OPTION_IGNORE_DUP_IP,
      $comment) if ($ignore_dup_ip);

    return $self->add_host($hostname, $ip, $comment);
  }

  # Now see if hostname already exists as cname
  #
  my $result = $self->_find_by_name($hostname, 'AliasRecord', 0);

  if ($result->{status} == BLUECAT_STATUS_FOUND) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_HOSTNAME_IN_USE;
    $ret_val->{error_msg} =
      sprintf("Specified hostname '%s' is in use as cname",
              $hostname || 'undef');
    $ret_val->{data}{comments} = $result->{comments};
    $ret_val->{data}{cname} = $result->{cname};
    $ret_val->{data}{hostname} = $result->{hostname};
    return $ret_val;
  }

  unless ($ignore_dup_ip) {
    $result = $self->find_by_ip($ip);

    if ($result->{status} == BLUECAT_STATUS_FOUND) {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_IP_IN_USE;
      $ret_val->{error_msg} = sprintf("Specified IP '%s' is in use",
                                      $ip || 'undef');
      $ret_val->{data}{ip} = $result->{ip};
      $ret_val->{data}{hostname} = $result->{host}[0]{hostname};
      return $ret_val;
    }

    elsif ($result->{status} != BLUECAT_STATUS_NOT_FOUND) {
      $ret_val->{status} = $result->{status};
      $ret_val->{error_code} = $result->{error_code} || BLUECAT_ERR_UNKNOWN_ERR;
      $ret_val->{error_msg} = $result->{error_msg} || 'Unknown error';
      return $ret_val;
    }
  }

  $ret_val->{status} = BLUECAT_STATUS_OK;

  my $start_time = [ gettimeofday() ];

  # Build the new properties string - this is the important part
  #
  my $properties = '';

  # Replace old comment with new one
  $properties .= 'comments=' . $comment . '|';

  # The name hasn't changed
  $properties .= 'absoluteName=' . $hostname . '|';

  # Merge the new IP in with the existing ones
  my $new_ips = join(',', @{$host_result->{host}[0]{ip}}) . ',' . $ip;
  $properties .= 'addresses=' . $new_ips . '|';

  # Set the ttl field only if there was one already
  my $ttl = $host_result->{host}[0]{ttl};
  $properties .= 'ttl=' . $ttl . '|' if ($ttl);

  # Use the same reverseRecord value
  $properties .= 'reverseRecord=' . $host_result->{host}[0]{reverse} . '|';

  # Need to call get_zone_info for the host name
  # (as opposed to the absoluteName).
  #
  my $zone_list = $self->get_zone_info($hostname);

  if ($zone_list->{status} != BLUECAT_STATUS_OK) {
    $ret_val->{status} = $zone_list->{status};
    $ret_val->{error_code} = $zone_list->{error_code} ||
      BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = $zone_list->{error_msg} ||
      "Error retrieving zone list for host '$hostname'";

    return $ret_val;
  }

  # Find the zone that we want to deploy this record to.
  # @@@ What if this isn't the zone that the existing hostname is part of???
  #
  my $zone_info = $self->_find_best_deployable_zone($zone_list->{zone_list},
    $hostname);

  unless ($self->{dry_run}) {
    my $name = $zone_info->{host} || ' ';
    my $soap_data = SOAP::Data::Builder->new;
    $soap_data->add_elem(name   => 'license_key');
    $soap_data->add_elem(name   => 'license',
                         value  => $self->{license},
                         parent => 'license_key');
    $soap_data->add_elem(name   => 'cdid',
                         value  => $self->{user_cdid});
    $soap_data->add_elem(name   => 'entity');
    $soap_data->add_elem(name   => 'id',
                         value  => $host_result->{id},
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');
    $soap_data->add_elem(name   => 'name',
                         value  => $name,
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');
    $soap_data->add_elem(name   => 'properties',
                         value  => $properties,
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');
    $soap_data->add_elem(name   => 'type',
                         value  => 'HostRecord',
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');

    eval {
      $result = $self->{soap}->update($soap_data->to_soap_data);
    };

    if ($self->{soap_error}) {
      $self->_set_error($ret_val);
    }

    else {
      if ($@) {
        $self->_set_error($ret_val, "SOAP Error: $@");
      }

      else {
        if ($result) {
          if ($result->match(SOAP::SOM::envelope)) {
            # No return value from the update call, so if we get here
            # the update worked.

            my $orbip = AOL::OrbIP->new(db => $self->{version});
            $orbip->update_or_create_ip($ip, 'In Use');
          }
          else {
            $self->_set_error($ret_val,
              'Did not receive a SOAP Envelope (SOM object)');
          }
        }
        else {
          $self->_set_error($ret_val, 'Webservice call returned no result.');
        }
      }
    }
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time('update (HostRecord)', "add IP $hostname/$ip",
                      tv_interval($start_time, $end_time));

  return $ret_val;
}


sub remove_host {
  my ($self, $hostname, $ip) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = { hostname => $hostname,
               ip       => $ip,
             };

  my $net_ip = Net::IP->new($ip) or
    do {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
      $ret_val->{error_msg} = "Specified IP address '$ip' is not properly " .
                              "formatted";
      return $ret_val;
    };

  my $ip_version = $net_ip->version();
  unless ($ip_version) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
    $ret_val->{error_msg} = "Error cannot determine IP protocol version " .
      "for '$ip': " . Net::IP::Error();
    return $ret_val;
  }

  unless ($self->_valid_hostname($hostname)) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_HOSTNAME;
    $ret_val->{error_msg} = sprintf("Specified hostname '%s' is invalid",
                                    $hostname || 'undef');
    return $ret_val;
  }

  my $result = $self->_find_by_name($hostname, 'HostRecord', 0);

  if ($result->{status} == BLUECAT_STATUS_FOUND) {
    my $found = 0;

    foreach my $ip_entry (@{$result->{host}[0]{ip}}) {
      if ($ip eq $ip_entry) {
        $found = 1;
        last;
      }
    }

    # If hostname is in use but specified IP is not, it will return mismatch
    #
    unless ($found) {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_HOSTNAME_IP_MISMATCH;
      $ret_val->{error_msg} =
        sprintf("Specified hostname '%s' does not match specified ip '%s'",
                $hostname || 'undef', $ip || 'undef');
      return $ret_val;
    }
  }
  else {
    if ($result->{status} == BLUECAT_STATUS_NOT_FOUND) {
      $ret_val->{status} = BLUECAT_STATUS_NOT_FOUND;
      $ret_val->{error_code} = BLUECAT_ERR_INVALID_REQUEST;
      $ret_val->{error_msg} =
        sprintf("Specified hostname '%s' not found in BlueCat",
                $hostname || 'undef');
      return $ret_val;
    }

    else {
      $ret_val->{status} = $result->{status};
      $ret_val->{error_code} = $result->{error_code} || BLUECAT_ERR_UNKNOWN_ERR;
      $ret_val->{error_msg} = $result->{error_msg} || 'Unknown error';
      return $ret_val;
    }
  }

  $result = $self->_delete_object($result->{host}[0]{id});

  if ($result->{status} != BLUECAT_STATUS_OK) {
    $ret_val->{status} = $result->{status};
    $ret_val->{error_code} = $result->{error_code};
    $ret_val->{error_msg} = $result->{error_msg};
  }

  else {
    $ret_val->{status} = BLUECAT_STATUS_OK;

    $result = $self->find_by_ip($ip);

    # If the ip is no longer in use, set it as
    # available in Orb
    #
    if ($result->{status} ==  BLUECAT_STATUS_NOT_FOUND) {
      my $orbip = AOL::OrbIP->new();
      my $orb_rc = $orbip->update_or_create_ip($ip, 'Available');
      # @@@ check return code???
    }
  }

  return $ret_val;
}


sub remove_ip_from_host {
  my ($self, $hostname, $ip, $comment) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = { hostname => $hostname,
               ip       => $ip,
             };

  my $net_ip = Net::IP->new($ip) or
    do {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
      $ret_val->{error_msg} = "Specified IP address '$ip' is not properly " .
                              "formatted";
      return $ret_val;
    };

  my $ip_version = $net_ip->version();
  unless ($ip_version) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
    $ret_val->{error_msg} = "Error cannot determine IP protocol version " .
      "for '$ip': " . Net::IP::Error();
    return $ret_val;
  }

  unless ($self->_valid_hostname($hostname)) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_HOSTNAME;
    $ret_val->{error_msg} = sprintf("Specified hostname '%s' is invalid",
                                    $hostname || 'undef');

    return $ret_val;
  }

  my $result = $self->_find_by_name($hostname, 'HostRecord', 0);

  if ($result->{status} == BLUECAT_STATUS_FOUND) {
    my $found = 0;

    foreach my $ip_entry (@{$result->{host}[0]{ip}}) {
      if ($ip eq $ip_entry) {
        $found = 1;
        last;
      }
    }

    # If this is the only IP associated with this host,
    # remove the entire HostRecord.
    #
    if ($found && scalar(@{$result->{host}[0]{ip}}) == 1) {
      return $self->remove_host($hostname, $ip);
    }

    # If hostname is in use but specified IP is not, it will return mismatch
    #
    unless ($found) {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_HOSTNAME_IP_MISMATCH;
      $ret_val->{error_msg} =
        sprintf("Specified hostname '%s' does not match specified ip '%s'",
                $hostname || 'undef', $ip || 'undef');
      return $ret_val;
    }
  }

  elsif ($result->{status} == BLUECAT_STATUS_NOT_FOUND) {
    $ret_val->{status} = BLUECAT_STATUS_NOT_FOUND;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_REQUEST;
    $ret_val->{error_msg} =
      sprintf("Specified hostname '%s' not found in BlueCat",
              $hostname || 'undef');
    return $ret_val;
  }

  else {
    $ret_val->{status} = $result->{status};
    $ret_val->{error_code} = $result->{error_code} || BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = $result->{error_msg} || 'Unknown error';
    return $ret_val;
  }

  $ret_val->{status} = BLUECAT_STATUS_OK;

  unless ($comment) {
    $comment = $result->{host}[0]{comments} || '';
    $comment = $self->_build_comment() unless ($comment);
  }

  my $start_time = [ gettimeofday() ];

  # Build the new properties string - this is the important part
  #
  my $properties = '';

  # Replace old comment with new one
  $properties .= 'comments=' . $comment . '|';

  # The name hasn't changed
  $properties .= 'absoluteName=' . $hostname . '|';

  # Remove the specified IP from the list
  my $new_ip_list = $self->_remove_item_from_list($ip, $result->{host}[0]{ip});
  my $new_ips = join(',', @$new_ip_list);
  $properties .= 'addresses=' . $new_ips . '|';

  # Set the ttl field only if there was one already
  my $ttl = $result->{host}[0]{ttl};
  $properties .= 'ttl=' . $ttl . '|' if ($ttl);

  # Use the same reverseRecord value
  $properties .= 'reverseRecord=' . $result->{host}[0]{reverse} . '|';

  # Remove this IP entry from all zones from the list above in which it exists.
  #
  my $deleted = 0;
  my $soap_error = '';
  foreach my $zone_info (@{$result->{zone_list}}) {
    my $zone_id = $zone_info->{zone_id} || '-';
    my $host_zone_id = $result->{host}[0]{zone_id} || '+';

    next unless ($zone_id eq $host_zone_id);

    if ($self->{dry_run}) {
      $deleted = 1;
    }
    else {
      my $name = $zone_info->{host} || ' ';
      my $soap_data = SOAP::Data::Builder->new;
      $soap_data->add_elem(name   => 'license_key');
      $soap_data->add_elem(name   => 'license',
                           value  => $self->{license},
                           parent => 'license_key');
      $soap_data->add_elem(name   => 'cdid',
                           value  => $self->{user_cdid});
      $soap_data->add_elem(name   => 'entity');
      $soap_data->add_elem(name   => 'id',
                           value  => $result->{id},
                           attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                           parent => 'entity');
      $soap_data->add_elem(name   => 'name',
                           value  => $name,
                           attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                           parent => 'entity');
      $soap_data->add_elem(name   => 'properties',
                           value  => $properties,
                           attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                           parent => 'entity');
      $soap_data->add_elem(name   => 'type',
                           value  => 'HostRecord',
                           attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                           parent => 'entity');

      eval {
        $result = $self->{soap}->update($soap_data->to_soap_data);
      };

      if ($self->{soap_error}) {
        $soap_error = $self->{soap_error};
      }

      else {
        if ($@) {
          $soap_error = "SOAP Error: $@";
        }

        else {
          if ($result) {
            if ($result->match(SOAP::SOM::envelope)) {
              $deleted = 1;
              # No return value from the update call, so if we get here
              # the update worked.

              $result = $self->find_by_ip($ip);

              # If the ip is no longer in use, set it as
              # available in Orb
              #
              if ($result->{status} ==  BLUECAT_STATUS_NOT_FOUND) {
                my $orbip = AOL::OrbIP->new(db => $self->{version});
                my $orb_rc = $orbip->update_or_create_ip($ip, 'Available');
                # @@@ check return code???
              }
            }
            else {
              $soap_error = 'Did not receive a SOAP Envelope (SOM object)';
            }
          }
        }
      }
    }
  }

  # If we deleted one or more entries, status is ok
  #
  if ($deleted) {
    $ret_val->{status} = BLUECAT_STATUS_OK;
  }
  # If we didn't delete anything and saw a soap error, report that error.
  #
  elsif ($soap_error) {
    $self->_set_error($ret_val, $soap_error);
  }
  # No deletions and no errors encountered.
  #
  else {
    $self->_set_error($ret_val, 'Webservice call returned no result.');
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time('update (HostRecord)', "remove IP $hostname/$ip",
                      tv_interval($start_time, $end_time));

  return $ret_val;
}


sub add_cname {
  my ($self, $cname, $hostname, $comment) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $comment = $self->_build_comment() unless ($comment);

  my $ttl = $self->{ttl};
  my $properties = 'absoluteName=' . $cname .
                   '|linkedRecordName=' . $hostname .
                   '|ttl=' . $ttl .
                   '|comments=' . $comment . '|';

  $ret_val = { cname    => $cname,
               hostname => $hostname,
               comment  => $comment,
             };

  unless ($self->_valid_hostname($cname, 1)) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_HOSTNAME;
    $ret_val->{error_msg} = sprintf("Specified CNAME '%s' is invalid",
                            $cname || 'undef');
    return $ret_val;
  }

  unless ($self->_valid_hostname($hostname)) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_HOSTNAME;
    $ret_val->{error_msg} = sprintf("Specified hostname '%s' is invalid",
                                    $hostname || 'undef');

    return $ret_val;
  }

  # Now see if cname already exists as cname
  #
  my $result = $self->_find_by_name($cname, 'AliasRecord', 0);

  if ($result->{status} == BLUECAT_STATUS_FOUND) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_HOSTNAME_IN_USE;
    $ret_val->{error_msg} = sprintf("Specified CNAME '%s' is in use",
                                    $cname || 'undef');
    $ret_val->{data}{comments} = $result->{comments};
    $ret_val->{data}{cname} = $result->{cname};
    $ret_val->{data}{hostname} = $result->{hostname};
    return $ret_val;
  }

  elsif ($result->{status} != BLUECAT_STATUS_NOT_FOUND) {
    $ret_val->{status} = $result->{status};
    $ret_val->{error_code} = $result->{error_code} || BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = $result->{error_msg} || 'Unknown error';
    return $ret_val;
  }

  # See if cname already exists as hostname
  #
  $result = $self->_find_by_name($cname, 'HostRecord', 0);

  if ($result->{status} == BLUECAT_STATUS_FOUND) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_HOSTNAME_IN_USE;
    $ret_val->{error_msg} = sprintf(
      "Specified CNAME '%s' is in use as a host record", $cname || 'undef');
    return $ret_val;
  }

  # See if target hostname already exists either as a hostname or a cname.
  # Error if it does not exist as one or the other.
  #
  $result = $self->_find_by_name($hostname, 'HostRecord', 0);

  if ($result->{status} != BLUECAT_STATUS_FOUND) {

    # Target was not found as a host record, see if it is a cname
    #
    $result = $self->_find_by_name($hostname, 'AliasRecord', 0);

    if ($result->{status} != BLUECAT_STATUS_FOUND) {

      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_HOSTNAME_NOT_FOUND;
      $ret_val->{error_msg} = sprintf("Specified hostname '%s' not found",
                                      $hostname || 'undef');
      return $ret_val;
    }
  }

  $ret_val->{status} = BLUECAT_STATUS_OK;

  my $start_time = [ gettimeofday() ];

  my $zone_list = $self->get_zone_info($cname);

  if ($zone_list->{status} != BLUECAT_STATUS_OK) {
    $ret_val->{status} = $zone_list->{status};
    $ret_val->{error_code} = $zone_list->{error_code} ||
      BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = $zone_list->{error_msg} ||
      "Error retrieving zone list for cname '$cname'";

    return $ret_val;
  }

  # Find the zone that we want to deploy this record to.
  #
  my $zone_info = $self->_find_best_deployable_zone($zone_list->{zone_list},
    $cname);

  unless ($self->{dry_run}) {
    my $name = $zone_info->{host} || ' ';
    my $soap_data = SOAP::Data::Builder->new;
    $soap_data->add_elem(name   => 'license_key');
    $soap_data->add_elem(name   => 'license',
                         value  => $self->{license},
                         parent => 'license_key');
    $soap_data->add_elem(name   => 'cdid',
                         value  => $self->{user_cdid});
    $soap_data->add_elem(name   => 'parentId',
                         value  => $zone_info->{zone_id});
    $soap_data->add_elem(name   => 'entity');
    $soap_data->add_elem(name   => 'id',
                         value  => '00',
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');
    $soap_data->add_elem(name   => 'name',
                         value  => $name,
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');
    $soap_data->add_elem(name   => 'properties',
                         value  => $properties,
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');
    $soap_data->add_elem(name   => 'type',
                         value  => 'AliasRecord',
                         attributes   => {'xmlns:bcns' => $self->{alt_ns}},
                         parent => 'entity');

    eval {
      $result = $self->{soap}->addEntity($soap_data->to_soap_data);
    };

    if ($self->{soap_error}) {
      $self->_set_error($ret_val);
    }

    else {
      if ($@) {
        $self->_set_error($ret_val, "SOAP Error: $@");
      }

      else {
        if ($result) {
          if ($result->match(SOAP::SOM::envelope)) {
            my $result_id = $result->valueof('//addEntityResponse/return');

            if ($result_id) {
              $ret_val->{host_id} = $result_id;
            }
            else {
              $ret_val->{status} = BLUECAT_STATUS_ERROR;
              $ret_val->{error_code} = BLUECAT_ERR_UNKNOWN_ERR;
              $ret_val->{error_msg} = $result_id;
            }
          }
          else {
            $self->_set_error($ret_val,
              'Did not receive a SOAP Envelope (SOM object)');
          }
        }
        else {
          $self->_set_error($ret_val, 'Webservice call returned no result.');
        }
      }
    }
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time('addEntity (cname)', "$cname/$hostname",
                      tv_interval($start_time, $end_time));

  return $ret_val;
}


sub remove_cname {
  my ($self, $cname) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = { cname   => $cname };

  unless ($self->_valid_hostname($cname)) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_HOSTNAME;
    $ret_val->{error_msg} = sprintf("Specified CNAME '%s' is invalid",
                                    $cname || 'undef');
    return $ret_val;
  }

  my $result = $self->_find_by_name($cname, 'AliasRecord', 0);

  if ($result->{status} == BLUECAT_STATUS_NOT_FOUND) {
    $ret_val->{status} = BLUECAT_STATUS_NOT_FOUND;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_REQUEST;
    $ret_val->{error_msg} =
      sprintf("Specified CNAME '%s' not found in BlueCat",
              $cname || 'undef');
    return $ret_val;
  }

  elsif ($result->{status} != BLUECAT_STATUS_FOUND) {
    $ret_val->{status} = $result->{status};
    $ret_val->{error_code} = $result->{error_code} || BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = $result->{error_msg} || 'Unknown error';
    return $ret_val;
  }

  my $cname_id = $result->{cname_id};

  $result = $self->_delete_object($cname_id);

  $ret_val->{status} = $result->{status};

  if ($result->{status} != BLUECAT_STATUS_OK) {
    $ret_val->{error_code} = $result->{error_code};
    $ret_val->{error_msg} = $result->{error_msg};
  }

  return $ret_val;
}


sub set_ttl {
  my ($self, $ttl) = @_;

  my $ret_val = { status => BLUECAT_STATUS_OK };

  $ttl =~ s/^\s+//;
  $ttl =~ s/\s+$//;

  if ($ttl eq '-1' ||
      $ttl =~ /^\d+$/) {
    $self->{ttl} = $ttl;
  }
  else {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_TTL;
    $ret_val->{error_msg} = "Invalid TTL value '$ttl'";
  }

  return $ret_val;
}


sub _delete_object {
  my ($self, $object_id) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = { status => BLUECAT_STATUS_OK };
  my $start_time = [ gettimeofday() ];

  unless ($self->{dry_run}) {
    my $result;

    eval {
      my $soap_data = SOAP::Data::Builder->new;
      $soap_data->add_elem(name   => 'license_key');
      $soap_data->add_elem(name   => 'license',
                           value  => $self->{license},
                           parent => 'license_key');
      $soap_data->add_elem(name   => 'cdid',
                           value  => $self->{user_cdid});
      $soap_data->add_elem(name   => 'objectId',
                           value  => $object_id);

      $result = $self->{soap}->delete($soap_data->to_soap_data);
      };

    if ($@) {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_UNKNOWN_ERR;
      $ret_val->{error_msg} = "Webservice call failed: $@";
    }

    elsif ($self->{soap_error}) {
      $self->_set_error($ret_val);
    }

    else {
      my $delete_response;

      if ($result) {
        if ($result->match(SOAP::SOM::envelope)) {
          my $delete_response = $result->valueof('//deleteResponse/return');

          if ($delete_response) {
            $ret_val->{status} = BLUECAT_STATUS_ERROR;
            $ret_val->{error_code} = BLUECAT_ERR_UNKNOWN_ERR;
            $ret_val->{error_msg} = $delete_response;
          }
        }
        else {
          $self->_set_error($ret_val,
            'Did not receive a SOAP Envelope (SOM object)');
        }
      }
      else {
        $self->_set_error($ret_val, 'Webservice call returned no result.');
      }
    }
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time('delete', "Id: $object_id",
                      tv_interval($start_time, $end_time));

  return $ret_val;
}


sub _find_related_record {
  my ($self, $name, $id, $type) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = {};

  if ($type ne 'IP4Address' &&
      $type ne 'IP6Address' &&
      $type ne 'HostRecord' &&
      $type ne 'ExternalHostRecord' &&
      $type ne 'AliasRecord') {

    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_TYPE;
    $ret_val->{error_msg} = "Entity type '$type' not recognized";

    return $ret_val;
  }

  my $start_time = [ gettimeofday() ];

  my $soap_data = SOAP::Data::Builder->new;
  $soap_data->add_elem(name   => 'license_key');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => 'license_key');
  $soap_data->add_elem(name   => 'cdid',
                       value  => $self->{user_cdid});
  $soap_data->add_elem(name   => 'entityId',
                       value  => $id);
  $soap_data->add_elem(name   => 'type',
                       value  => $type);
  $soap_data->add_elem(name   => 'start',
                       value  => '00');
  $soap_data->add_elem(name   => 'count',
                       value  => 1000);

  my $result;

  eval {
    $result = $self->{soap}->getLinkedEntities($soap_data->to_soap_data);
  };

# @@ what if there are more than 1000??

  if ($@) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_UNKNOWN_ERR;
    $ret_val->{error_msg} = "Webservice call failed: $@";
  }

  elsif ($self->{soap_error}) {
    $self->_set_error($ret_val);
  }

  else {
    if ($result) {
      if ($result->match(SOAP::SOM::envelope)) {
        my $r = $result->valueof('//getLinkedEntitiesResponse/return');

        my $found = 0;
        $ret_val->{status} = BLUECAT_STATUS_OK;
        $ret_val->{data} = [];

        if ($r && $r->{item}) {
          my $entry = $r->{item};

          $entry = [ $entry ] if (ref($entry) eq 'HASH');

          if (ref($entry) eq 'ARRAY') {
            foreach my $e (@{$entry}) {
              my $property = $self->_get_properties($e->{properties});

              if ($type eq 'HostRecord') {
                my @ips = split(',', $property->{addresses});
                push(@{$ret_val->{data}}, {
                  id      => $e->{id},
                  name    => $property->{absoluteName} || $e->{name} || '',
                  ip      => \@ips,
                  ttl     => $property->{ttl} || '',
                  reverse => $property->{reverseRecord} || '',
                });

                $found = 1;
              }
              elsif ($type eq 'IP4Address' || $type eq 'IP6Address') {
                push(@{$ret_val->{data}}, {
                  id => $e->{id},
                  ip => $property->{address} || '',
                });

                $found = 1;
              }
              elsif ($type eq 'AliasRecord') {
                push(@{$ret_val->{data}}, {
                  id      => $e->{id},
                  cname   => $property->{absoluteName} || $e->{name} || '',
                });

                $found = 1;
              }
              elsif ($type eq 'ExternalHostRecord') {
                # @@@ do something with this
              }
            }
          }

# @@
else {
  print "+++++ SHOULDN'T GET HERE +++++\n";
  print "*** Entry is not an ARRAY ***\n";
  print Dumper $entry;
}

        }

        # If no linked entries have been found
        unless ($found) {
          $ret_val->{status} = BLUECAT_STATUS_NOT_FOUND;
          if ($type eq 'HostRecord') {
            $ret_val->{error_code} = BLUECAT_ERR_HOSTNAME_NOT_FOUND;
          }
          elsif ($type eq 'IP4Address' || $type eq 'IP6Address') {
            $ret_val->{error_code} = BLUECAT_ERR_IP_NOT_FOUND;
          }
          elsif ($type eq 'AliasRecord') {
            $ret_val->{error_code} = BLUECAT_ERR_CNAME_NOT_FOUND;
          }
          else {
            $ret_val->{status} = BLUECAT_STATUS_ERROR;
            $ret_val->{error_msg} = "Associated $type not found for '$name'";
          }
        }
      }
      else {
        $self->_set_error($ret_val,
          'Did not receive a SOAP Envelope (SOM object)');
      }
    }
    else {
      $self->_set_error($ret_val, 'Webservice call returned no result.');
    }
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time('getLinkedEntities', "$id/$type",
                      tv_interval($start_time, $end_time));

  return $ret_val;
}


sub _get_subnet_information {
  my ($self, $ip, $mask) = @_;

  my $ret_val = $self->_check_login();
  return $ret_val unless ($ret_val->{status} == BLUECAT_STATUS_OK);

  $ret_val = { };

  my $net_ip = Net::IP->new($ip) or
    do {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
      $ret_val->{error_msg} = "Specified IP address '$ip' is not properly " .
                              "formatted";
      return $ret_val;
    };

  my $ip_version = $net_ip->version();
  unless ($ip_version) {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
    $ret_val->{error_msg} = "Error cannot determine IP protocol version " .
      "for '$ip': " . Net::IP::Error();
    return $ret_val;
  }

  # Check for a dotted decimal mask (e.g., 255.255.255.0)
  #
  unless (valid_mask($mask)) {
    if (valid_ip($mask)) {
      $mask = get_cidr_mask($mask);
    }
    else {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_INVALID_NETMASK;
      $ret_val->{error_msg} = "Specified netmask '$mask' is not properly " .
                              "formatted";
      return $ret_val;
    }
  }

  # @@ Won't currently work for IPv6, so let's just return an error.
  #
  if ($net_ip->version() eq '6') {
    $ret_val->{status} = BLUECAT_STATUS_ERROR;
    $ret_val->{error_code} = BLUECAT_ERR_INVALID_IP;
    $ret_val->{error_msg} = "Subnet operations not currently supported " .
      "for IPv6";
    return $ret_val;
  }

  my ($low_addr, $high_addr) = get_network_range($ip, $mask);
  my $low_ip = get_dotted_decimal($low_addr);
  my $high_ip = get_dotted_decimal($high_addr);

  my %all_addresses = ();
  for (my $i = $low_addr; $i <= $high_addr; $i++) {
    $all_addresses{get_dotted_decimal($i)} = {
      ip         => get_dotted_decimal($i),
      numeric_ip => $i,
      in_use     => 0,
      };
  }

  my $start_time = [ gettimeofday() ];

  my $soap_data = SOAP::Data::Builder->new;
  $soap_data->add_elem(name   => 'license_key');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => 'license_key');
  $soap_data->add_elem(name   => 'cdid',
                       value  => $self->{user_cdid});
  $soap_data->add_elem(name   => 'startIP',
                       value  => $low_ip);
  $soap_data->add_elem(name   => 'endIP',
                       value  => $high_ip);

  my $result;
  my $tries = 0;

  APIGET: {
    $tries++;
    eval {
      $result = $self->{soap}->getEntitiesByIPRange($soap_data->to_soap_data);
    };

    if ($@) {
      $ret_val->{status} = BLUECAT_STATUS_ERROR;
      $ret_val->{error_code} = BLUECAT_ERR_UNKNOWN_ERR;
      $ret_val->{error_msg} = "Webservice call failed: $@";
      redo APIGET if ($tries <= 2);
    }

    elsif ($self->{soap_error}) {
      $self->_set_error($ret_val);
    }

    else {
      if ($result) {

        if ($result->match(SOAP::SOM::envelope)) {
          my @r = $result->valueof('//getEntitiesByIPRangeResponse/return');

          $ret_val->{data} = [];
          $ret_val->{status} = BLUECAT_STATUS_OK;

          foreach my $entity (@r) {

            next unless ($entity->{ipAddressAsLong} >= $low_addr &&
                         $entity->{ipAddressAsLong} <= $high_addr);

            my $ip_addr = $entity->{ipAddress};

            if ($all_addresses{$ip_addr}) {
              push(@{$all_addresses{$ip_addr}{host}}, {
                name     => $entity->{fqdn} || $entity->{name} || '',
                id       => $entity->{id},
                comments => $entity->{comments} || '',
              });
              $all_addresses{$ip_addr}{in_use} =  1;
              # @@ $all_addresses{$ip_addr}{ip_id} = '??';
            }
          }
        }
        else {
          redo APIGET if ($tries <= 2);
          $self->_set_error($ret_val,
            'Did not receive a SOAP Envelope (SOM object)');
        }
      }
      else {
        redo APIGET if ($tries <= 2);
        $self->_set_error($ret_val, 'Webservice call returned no result.');
      }
    }
  }

  my $end_time = [ gettimeofday() ];

  $self->_record_time('getEntitiesByIPRange', "$ip/$mask",
                      tv_interval($start_time, $end_time));

  if ($ret_val->{status} == BLUECAT_STATUS_OK) {
    my @full_entries = ();

    foreach my $address
      (sort { $all_addresses{$a}->{numeric_ip} <=>
              $all_addresses{$b}->{numeric_ip} }
      keys(%all_addresses)) {

      push(@full_entries, $all_addresses{$address});
    }

    $ret_val->{status} = BLUECAT_STATUS_OK;
    $ret_val->{data} = \@full_entries;
  }

  return $ret_val;
}


sub _set_error {
  my ($self, $ret_val, $default_err) = @_;

  my $err = $self->{soap_error} || $default_err || 'unknown';

  my $code = BLUECAT_ERR_SOAP_ERROR;
  if ($err eq 'Duplicate of another item') {
    $code = BLUECAT_ERR_HOSTNAME_IN_USE;
  }
  elsif ($err eq 'Not logged in') {
    $code = BLUECAT_ERR_NOT_LOGGED_IN;
  }
  elsif ($err eq 'Authentication Error: Ensure that your username and password are correct.') {
    $code = BLUECAT_ERR_AUTH_ERROR;
  }
  elsif ($err =~ /^Object was not found : /) {
    $code = BLUECAT_ERR_ID_DOES_NOT_EXIST;
  }
  elsif ($err eq 'Invalid destination Zone.') {
    $code = BLUECAT_ERR_ZONE_DOES_NOT_EXIST;
  }
  elsif ($err =~ /IP Address doesn't belong to a Network/) {
    $code = BLUECAT_ERR_NETWORK_DOES_NOT_EXIST;
  }
  elsif ($err eq '500 read timeout') {
    $code = BLUECAT_ERR_TIMEOUT;
  }

  $ret_val->{status} = BLUECAT_STATUS_ERROR;
  $ret_val->{error_code} = $code;
  $ret_val->{error_msg} = $err;

  return $ret_val;
}


sub _valid_hostname {
  my ($self, $hostname, $strict) = @_;

  return 0 unless ($hostname);

  # Requested hostname contains invalid character(s)
  # It can contain an asterisk, but that must be the first character
  # and must be followed by a . and there must not be any other asterisk
  # in the name.
  #
  if ($strict) {
    return 0 if ($hostname =~ /[^a-zA-Z0-9\-.\*]/);
  }
  else {
    return 0 if ($hostname =~ /[^a-zA-Z_0-9\-.\*]/);
  }
  return 0 if ($hostname =~ /\*/ && substr($hostname, 1) =~ /\*/);
  return 0 if ($hostname =~ /\*/ && $hostname !~ /^\*\./);

  # Requested hostname is too long (> 255 characters)
  #
  return 0 if (length($hostname) > 255);

  my @labels = split(/\./, $hostname);

  # Requested hostname label cannot start or end with a '-'
  #
  return 0 if (scalar(grep { /^-/ } @labels));
  return 0 if (scalar(grep { /-$/ } @labels));

  # Requested hostname has too many '.'s (i.e., a blank label)
  #
  return 0 if (scalar(grep { /^$/ } @labels));

  # Requested hostname label too long (> 63 characters)
  #
  return 0 if (scalar(grep { length($_) > 63 } @labels));

  return 1;
}


sub _build_comment {
  my ($self) = @_;

  my ($prog) = $0 =~ /([^\/]*)$/;
  $prog = 'AOL::BLUECAT' unless ($prog);
  my $comment = "$prog ";

  my $user = $self->{user_cdid} || '';

  my ($sec, $min, $hr, $mday, $mon, $y) = localtime(time());
  $comment .= sprintf("%s %02d/%02d/%04d %02d:%02d",
    $user, $mon + 1, $mday, $y + 1900, $hr, $min);

  return $comment;
}


sub _remove_item_from_list {
  my ($self, $item, $list) = @_;

  my %list_hash = map { $_, 0 } @$list;

  delete $list_hash{$item};

  my @new_list = keys(%list_hash);
  return \@new_list;
}


sub _record_time {
  my ($self, $key1, $key2, $elapsed) = @_;

  $self->{timer}{$key1}{$key2}->{count}++;
  $self->{timer}{$key1}{$key2}->{elapsed} += $elapsed;

  if (! defined($self->{timer}{$key1}{$key2}->{min}) ||
      $elapsed < $self->{timer}{$key1}{$key2}->{min}) {
    $self->{timer}{$key1}{$key2}->{min} = $elapsed
  }

  if (! defined($self->{timer}{$key1}{$key2}->{max}) ||
      $elapsed > $self->{timer}{$key1}{$key2}->{max}) {
    $self->{timer}{$key1}{$key2}->{max} = $elapsed
  }
}


sub dump_timers {
  my ($self) = @_;

  unless (keys(%{$self->{timer}})) {
    print "\nNo timing data available\n\n";
    return;
  }

  print "\n";
  print "        Request          Count   Elapsed Time   Max Time   Min Time   " .
        "Avg Time\n";
  print "  --------------------  -------  ------------   --------   --------   " .
        "--------\n";

  foreach my $key1 (sort keys(%{$self->{timer}})) {
    my $count = 0;
    my $elapsed = 0;
    my $max = 0;
    my $min = 99999999;
    foreach my $key2 (sort keys(%{$self->{timer}{$key1}})) {
      $count += $self->{timer}{$key1}{$key2}{count};
      $elapsed += $self->{timer}{$key1}{$key2}{elapsed};
      $max = $self->{timer}{$key1}{$key2}{max}
        if ($self->{timer}{$key1}{$key2}{max} > $max);
      $min = $self->{timer}{$key1}{$key2}{min}
        if ($self->{timer}{$key1}{$key2}{min} < $min);

      if ($self->{full_times}) {
        my $avg = ($self->{timer}{$key1}{$key2}{count} > 0) ?
                   $self->{timer}{$key1}{$key2}{elapsed} /
                   $self->{timer}{$key1}{$key2}{count} : 0;
        printf "  %-20s   %5d     %-8f     %-8f   %-8f   %-8f\n",
               $key1, $self->{timer}{$key1}{$key2}{count},
               $self->{timer}{$key1}{$key2}{elapsed},
               $self->{timer}{$key1}{$key2}{max},
               $self->{timer}{$key1}{$key2}{min}, $avg;
        print "    $key2\n"
      }
    }

    my $avg = ($count > 0) ? $elapsed / $count : 0;
    printf "%s %-20s   %5d     %-8f     %-8f   %-8f   %-8f\n",
           ($self->{full_times}) ? '*' : ' ', $key1, $count,
           $elapsed, $max, $min, $avg;
    print "\n" if ($self->{full_times});
  }

  print "\n";
}


1;

