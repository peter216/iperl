############################################################################
# $Id$
#
# $Revision$
############################################################################

package AOL::SubnetMgmt;

use strict;
use warnings;
use English qw( -no_match_vars );
use Time::HiRes qw(gettimeofday tv_interval);
use HTTP::Request;
use LWP::UserAgent;
use XML::Simple;
use URI::Escape;
use Sys::Hostname;
use NetAddr::IP;
use DBI;

use SOAP::Lite
#  trace => 'all'
;
use SOAP::Data::Builder;

use AOL::UserInfo;
use AOL::IPUtils qw(valid_ip valid_mask valid_subnet get_numeric_ip
                    get_dotted_decimal get_cidr_mask get_network_range
                    get_subnet_components normalize_subnet);
use AOL::BlueCat;
use AOL::OrbIP;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw( find_subnet
                     find_subnets_in
                     reserve_subnet
                     free_subnet
                     clear_subnet
                     get_available_subnet
                     list_available_subnets
                     get_available_subnet_list
                     get_available_subnet_by_color
                     get_ips_in_use
                     update_subnet
                     get_blocks_by_color
                     find_subnet_color

                     SMGMT_OK
                     SMGMT_NOT_FOUND
                     SMGMT_SUBNET_EXISTS
                     SMGMT_INVALID_SUBNET
                     SMGMT_INVALID_REQUEST_SIZE
                     SMGMT_SOAP_ERROR
                     SMGMT_NO_DESCRIPTION
                     SMGMT_ORB_ERROR
                     SMGMT_NO_SUBNET_AVAILABLE
                     SMGMT_BLUECAT_ERROR
                     SMGMT_NMS_ERROR
                     SMGMT_INVALID_NETWORK_COLOR
                     SMGMT_INVALID_SITE
                     SMGMT_BLOCK_LOAD_ERROR
                     SMGMT_INVALID_BLOCK_LIST
                     SMGMT_INVALID_SIZE_LIST
                   );

use constant SMGMT_OK                    => 0;
use constant SMGMT_NOT_FOUND             => 1;
use constant SMGMT_SUBNET_EXISTS         => 2;
use constant SMGMT_INVALID_SUBNET        => 3;
use constant SMGMT_INVALID_REQUEST_SIZE  => 4;
use constant SMGMT_SOAP_ERROR            => 5;
use constant SMGMT_NO_DESCRIPTION        => 6;
use constant SMGMT_ORB_ERROR             => 7;
use constant SMGMT_NO_SUBNET_AVAILABLE   => 8;
use constant SMGMT_BLUECAT_ERROR         => 9;
use constant SMGMT_NMS_ERROR             => 10;
use constant SMGMT_INVALID_NETWORK_COLOR => 11;
use constant SMGMT_INVALID_SITE          => 12;
use constant SMGMT_BLOCK_LOAD_ERROR      => 13;
use constant SMGMT_INVALID_BLOCK_LIST    => 14;
use constant SMGMT_INVALID_SIZE_LIST     => 15;

use constant SMGMT_CHILDREN              => 0;
use constant SMGMT_PARENTS               => 1;


my $_DEFAULT_DB = 'prod';
my $_DEFAULT_MAX_SUBNET_SIZE = 23;
my $_DEFAULT_DNS_RETRIES = 3;
my $_DEFAULT_DNS_RETRY_DELAY = 15;  # seconds

my %_ORB_SERVICE_URI = (
  prod => 'http://ws.oasis.aol.com:8100/orb/services/net/latest/SubnetService?wsdl',
  dev  => 'http://oasisws-dev.ops.aol.com:8100/orb/services/net/latest/SubnetService?wsdl',
);

my $_ORB_LICENSE = '50E291B8-1431E84B-153515A4-86091D34';
my $_ORB_NS      = 'http://services.net.orb.ws.oasis.aol.com/';
my $_ORB_ATOMICS_URL = "http://orb-atomics.ops.aol.com:8080/jAtomics/raw/?q=";

# Eventually we want to replace these files with a call to an
# authoritative database that knows the blocks by network color
# and site.
#
my %BASE_BLOCK_DIR = (
  'nettoolsjump-d01.office.aol.com' => '/opt/nettools/configurator/etc',
  'nettoolsjump-m01.ops.aol.com'    => '/opt/nettools/configurator/etc',
  'ops4-m.itsec.aol.com'            => '/opt/nettools/ip_provisioning/etc',
  'ops4-d.office.aol.com'           => '/opt/nettools/ip_provisioning/etc',
  'ops4-n.office.aol.com'           => '/opt/nettools/ip_provisioning/etc',
  'ops4-frr.itsec.aol.com'          => '/opt/nettools/ip_provisioning/etc',
);


sub new {
  my ($class, %args) = @_;

  my $self = {};
  bless($self, $class);

  $self->{db} = $args{db} || $_DEFAULT_DB;

  $self->{uri} = $args{uri} || 
    (defined($_ORB_SERVICE_URI{$self->{db}}))
      ? $_ORB_SERVICE_URI{$self->{db}}
      : $_ORB_SERVICE_URI{$_DEFAULT_DB};

  $self->{ns} = $args{ns} || $_ORB_NS;
  $self->{atomics_url} = $args{atomics_url} ||
                         $_ORB_ATOMICS_URL;

  $self->{license} = $args{license} || $_ORB_LICENSE;

  $self->{bluecat_license} = $args{bluecat_license} || '';
  $self->{dns_retries} = $args{dns_retries} || $_DEFAULT_DNS_RETRIES;
  $self->{dns_retry_delay} = $args{dns_retry_delay} ||
    $_DEFAULT_DNS_RETRY_DELAY;

  $self->{dry_run} = ($args{dry_run}) ? 1: 0;

  $self->{debug} = $args{debug} || 0;
  $self->{kerb_user} = $args{kerb_user} || undef;

  $self->{orb_error} = undef;

  $self->{soap_error} = undef;
  $self->{soap_error_detail} = undef;

  $self->{valid_colors} = {
    green       => 1,
    white       => 1,
    blue        => 1,
    alien       => 1,
    black       => 1,
    blackr      => 1,
    yellow      => 1,
    mgmt        => 1,
    cloudmgmt   => 1,
    cloudbackup => 1,
    loopback    => 1,
    rilo        => 1,
    backupe     => 1,
    backupi     => 1,
    oscar       => 1,
    priv        => 1,
  };

  $self->{valid_sites} = {
    'AMT'          => 1,
    'ATC'          => 1,
    'ATC-DCNG'     => 1,
    'DTC'          => 1,
    'FRR'          => 1,
    'LCD-DCNG'     => 1,
    'MTC'          => 1,
    'MTC-MR1-DCNG' => 1,
    'MTC-MR3-DCNG' => 1,
    'MTC-MR5-DCNG' => 1,
    'NTC'          => 1,
    'SCD-DCNG'     => 1,
  };

  $self->{subnet_fields} = [
    'description',
    'routingRegion',
    'routingType',
    'source',
    'status',
    'subnetType',
  ];

  $self->{default_field_values} = {
    'description'    => '',
    'routingRegion'  => 'Global',
    'routingType'    => 'Other',
    'source'         => 'Other',
    'status'         => 'Reserved',
    'subnetType'     => 'IPv4',
  };

  if ($args{user_cdid}) {
    $self->{user_cdid} = $args{user_cdid};
  }
  else {
    my $user_info = AOL::UserInfo->new();
    my $info = $user_info->get_user_info($self->{kerb_user});

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

  $self->{nms_username} = $args{nms_username} || 'nms_admin';
  $self->{nms_password} = $args{nms_password} || 'nm3@dm1n';
  $self->{nms_dbname}   = $args{nms_dbname}   || 'nms_parse';
  $self->{nms_db_host}  = $args{nms_db_host}  || 'nettoolsdb.ops.aol.com';
  $self->{nms_DSN} = "dbi:Pg:dbname=$self->{nms_dbname};host=$self->{nms_db_host};";
  $self->{nms_dbh} = undef;

  return $self;
}


sub DESTROY {
  my $self = shift;

  $self->nms_disconnect();
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


sub nms_connect {
  my ($self) = @_;

  unless ($self->{nms_dbh}) {
    $self->{nms_dbh} = DBI->connect($self->{nms_DSN},
                                    $self->{nms_username},
                                    $self->{nms_password}) or
      do {
        print "nms_connect(): Couldn't connect to NMS database: " .
          DBI->errstr . "\n";
      };
  }
}


sub nms_disconnect {
  my ($self) = @_;

  $self->{nms_dbh}->disconnect() if ($self->{nms_dbh});
  $self->{nms_dbh} = undef;
}


sub find_subnet {
  my ($self, $subnet, $all) = @_;

  my %ret_val = ( status  => SMGMT_OK );
  $all = 0 unless (defined($all));

  unless (valid_subnet($subnet)) {
    $ret_val{status} = SMGMT_INVALID_SUBNET;
    $ret_val{error_msg} = "Subnet '$subnet' improperly formatted";
    return \%ret_val;
  }

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name => 'licenseKey');
  $soap_data->add_elem(name => 'license',
                       value => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));
  $soap_data->add_elem(name => 'criteria');

  $soap_data->add_elem(name => 'cidr',
                       value => $subnet,
                       parent => $soap_data->get_elem('criteria'));

  my $result = $self->{soap}->getSubnetsByExample(
    $soap_data->to_soap_data);

  if ($self->{soap_error}) {
    $ret_val{status} = SMGMT_SOAP_ERROR;
    $ret_val{error_msg} = $self->{soap_error};
  }

  else {
    my @val = $result->valueof('//return');

    $ret_val{status} = SMGMT_NOT_FOUND;

    foreach my $element (sort bynet @val) {
      next if (! $all && $element->{status} eq 'Deleted');

      $ret_val{status} = SMGMT_OK;
      $ret_val{data} = $element;
    }
  }

  return \%ret_val;
}


sub find_subnets_in {
  my ($self, $subnet) = @_;

  my %ret_val = ( status  => SMGMT_OK,
                  subnets => []);

  unless (valid_subnet($subnet)) {
    $ret_val{status} = SMGMT_INVALID_SUBNET;
    $ret_val{error_msg} = "Subnet '$subnet' improperly formatted";
    return \%ret_val;
  }

  my $children_subnets = $self->_get_subnets_from_orb($subnet, SMGMT_CHILDREN);

  if ($self->{orb_error}) {
    $ret_val{status} = SMGMT_ORB_ERROR;
    $ret_val{error_msg} = $self->{orb_error};
    return \%ret_val;
  }

  foreach my $element (@$children_subnets) {
    push(@{$ret_val{subnets}}, $element);
  }

  my $parent_subnets = $self->_get_subnets_from_orb($subnet, SMGMT_PARENTS);

  if ($self->{orb_error}) {
    $ret_val{status} = SMGMT_ORB_ERROR;
    $ret_val{error_msg} = $self->{orb_error};
    return \%ret_val;
  }

  foreach my $element (@$parent_subnets) {
    push(@{$ret_val{subnets}}, $element)
      unless ($self->_find_in_list($ret_val{subnets}, $element->{cidr}));
  }

  if (scalar(@{$ret_val{subnets}}) > 0) {
    @{$ret_val{subnets}} = sort bynet @{$ret_val{subnets}};
    $ret_val{status} = SMGMT_OK;
  }
  else {
    $ret_val{status} = SMGMT_NOT_FOUND;
  }

  return \%ret_val;
}


sub _get_subnets_from_orb {
  my ($self, $subnet, $type) = @_;

  $self->{orb_error} = undef;

  my $sql;
  if ($type eq SMGMT_PARENTS) {
    $sql = "select net_ip_subnet_cidr, " .
           "       net_ip_subnet_fk_status_id, " .
           "       net_ip_subnet_status_description, " .
           "       net_ip_subnet_type_description, " .
           "       net_ip_subnet_fk_source_id, " .
           "       net_ip_subnet_source_description, " .
           "       net_ip_subnet_fk_routing_type_id, " .
           "       net_ip_subnet_routing_type_description, " .
           "       net_ip_subnet_fk_routing_region_id, " .
           "       net_ip_subnet_routing_region_description, " .
           "       net_ip_subnet_description " .
           "  from net_ip_subnet_display " .
           " where net_ip_subnet_cidr >>= '$subnet' and " .
           "       net_ip_subnet_fk_status_id != 4;";
  }
  elsif ($type eq SMGMT_CHILDREN) {
    $sql = "select net_ip_subnet_cidr, " .
           "       net_ip_subnet_fk_status_id, " .
           "       net_ip_subnet_status_description, " .
           "       net_ip_subnet_type_description, " .
           "       net_ip_subnet_fk_source_id, " .
           "       net_ip_subnet_source_description, " .
           "       net_ip_subnet_fk_routing_type_id, " .
           "       net_ip_subnet_routing_type_description, " .
           "       net_ip_subnet_fk_routing_region_id, " .
           "       net_ip_subnet_routing_region_description, " .
           "       net_ip_subnet_description " .
           "  from net_ip_subnet_display " .
           " where net_ip_subnet_cidr <<= '$subnet' and " .
           "       net_ip_subnet_fk_status_id != 4;";
  }

  my $version = 1;
  my $format = 'compact';
  my $query_params = "&version=$version&format=$format";
  $sql = uri_escape($sql);

  my $url .= $self->{atomics_url};
  $url .= $sql . $query_params;

  my $request = HTTP::Request->new(GET => $url);

  my $user_agent = LWP::UserAgent->new;
  my $response = $user_agent->request($request);
  my $xs = XML::Simple->new();
  my $xml;

  my @data = ();

  if ($response->is_success()) {
    $xml = $xs->XMLin($response->content);

    my $record = $xml->{data}{rows}{row};
    if (ref($record) eq 'HASH') {
      my $desc = $record->{value}[10] || '';
      $desc = '' if (ref($desc) eq 'HASH');

      push(@data, {
        cidr              => $record->{value}[0],
        status_id         => $record->{value}[1],
        status            => $record->{value}[2],
        subnetType        => $record->{value}[3],
        source_id         => $record->{value}[4],
        source            => $record->{value}[5],
        routing_type_id   => $record->{value}[6],
        routingType       => $record->{value}[7],
        routing_region_id => $record->{value}[8],
        routingRegion     => $record->{value}[9],
        description       => $desc,
      });
    }
    elsif (ref($record) eq 'ARRAY') {
      foreach my $ref (@$record) {
        my $desc = $ref->{value}[10] || '';
        $desc = '' if (ref($desc) eq 'HASH');

        push(@data, {
          cidr              => $ref->{value}[0],
          status_id         => $ref->{value}[1],
          status            => $ref->{value}[2],
          subnetType        => $ref->{value}[3],
          source_id         => $ref->{value}[4],
          source            => $ref->{value}[5],
          routing_type_id   => $ref->{value}[6],
          routingType       => $ref->{value}[7],
          routing_region_id => $ref->{value}[8],
          routingRegion     => $ref->{value}[9],
          description       => $desc,
        });
      }
    }
  }
  else {
    $self->{orb_error} = sprintf("Error getting Orb data: %s\n",
                                 $response->status_line);
  }

  return \@data;
}


sub reserve_subnet {
  my $self = shift;
  my $subnet = shift;
  my (%param) = @_;

  my $ret_val = { status  => SMGMT_OK };

  unless (valid_subnet($subnet)) {
    $ret_val->{status} = SMGMT_INVALID_SUBNET;
    $ret_val->{error_msg} = "Subnet '$subnet' improperly formatted";
    return $ret_val;
  }

  my $result = $self->find_subnet($subnet, 0);

  if ($result->{status} == SMGMT_OK) {
    $ret_val->{status} = SMGMT_SUBNET_EXISTS;
  }

  else {
    unless ($self->{dry_run}) {
      $ret_val = $self->_insert_subnet($subnet,
                                       description => $param{description});
    }
  }

  return $ret_val;
}


sub free_subnet {
  my ($self, $subnet) = @_;

  my $ret_val = { status  => SMGMT_OK };

  unless (valid_subnet($subnet)) {
    $ret_val->{status} = SMGMT_INVALID_SUBNET;
    $ret_val->{error_msg} = "Subnet '$subnet' improperly formatted";
    return $ret_val;
  }

  my $result = $self->find_subnet($subnet, 0);

  if ($result->{status} != SMGMT_OK) {
    $ret_val->{status} = SMGMT_NOT_FOUND;
  }

  else {
    $ret_val = $self->_delete_subnet($subnet);

    if ($ret_val->{status} == SMGMT_OK) {
      my $nms_result = $self->_age_out_subnet_in_nms($subnet);

      if ($nms_result->{status} != SMGMT_OK) {
        $ret_val->{status} = $nms_result->{status};
        $ret_val->{error_msg} = $nms_result->{error_msg};
      }
    }
  }

  return $ret_val;
}


sub clear_subnet {
  my ($self, $subnet) = @_;

  my $ret_val = { status  => SMGMT_OK };

  unless (valid_subnet($subnet)) {
    $ret_val->{status} = SMGMT_INVALID_SUBNET;
    $ret_val->{error_msg} = "Subnet '$subnet' improperly formatted";
    return $ret_val;
  }

  $subnet = normalize_subnet($subnet);
  my $result = $self->find_subnet($subnet, 0);

  if ($result->{status} != SMGMT_OK) {
    $ret_val->{status} = SMGMT_NOT_FOUND;
  }

  else {
    my $ips_in_use = $self->get_ips_in_use($subnet);

    # Now remove all of the DNS entries for IPs in this subnet.
    # This will indirectly also remove all cnames that point to
    # these IPs.
    #
    if ($ips_in_use->{status} == SMGMT_OK) {
      my $dns = AOL::BlueCat->new(license => $self->{bluecat_license},
        dry_run => $self->{dry_run});

      foreach my $ip_entry (@{$ips_in_use->{data}}) {
        my $ip = $ip_entry->{ip};

        foreach my $host_entry (@{$ip_entry->{host}}) {
          my $hostname = $host_entry->{name};
          my $result = $dns->remove_host($hostname, $ip);

          if ($result->{status} != AOL::BlueCat::BLUECAT_STATUS_OK) {
            $ret_val->{status} = SMGMT_BLUECAT_ERROR;
            my $msg = "Error $result->{status} returned from " .
              "remove_host for '$hostname' '$ip' ($result->{error_code})";

            if ($ret_val->{error_msg}) {
              $ret_val->{error_msg} .= "\n" . $msg;
            }
            else {
              $ret_val->{error_msg} = $msg;
            }
          }
        }
      }
    }
    else {
      # Couldn't get list of IPs.  Note it and keep going.
      $ret_val->{status} = $ips_in_use->{status};

      if ($ret_val->{error_msg}) {
        $ret_val->{error_msg} .= "\n" . $ips_in_use->{error_msg};
      }
      else {
        $ret_val->{error_msg} = $ips_in_use->{error_msg};
      }
    }

    $result = $self->free_subnet($subnet);

    if ($result->{status} != SMGMT_OK) {
      $ret_val->{status} = $result->{status};

      if ($ret_val->{error_msg}) {
        $ret_val->{error_msg} .= "\n" . $result->{error_msg};
      }
      else {
        $ret_val->{error_msg} = $result->{error_msg};
      }
    }
  }

  return $ret_val;
}


sub get_available_subnet {
  my ($self, $block, $size, $description) = @_;

  my $ret_val = $self->list_available_subnets($block, $size, 1);

  return $ret_val if ($ret_val->{status} != SMGMT_OK);

  my $found = 0;
  foreach my $subnet (@{$ret_val->{subnets}}) {
    print "Reserving $subnet\n" if ($self->{debug});
    $found = 1;

    $ret_val->{subnet} = $subnet;

    my $result = $self->reserve_subnet($subnet,
      description => $description || '');

    if ($result->{status} != SMGMT_OK) {
      $ret_val->{status} = $result->{status};
      $ret_val->{error_msg} = $result->{error_msg};
    }

    last;
  }

  # Couldn't find any available subnets
  #
  unless ($found) {
    $ret_val->{status} = SMGMT_NO_SUBNET_AVAILABLE;
    $ret_val->{error_msg} = "No subnet of size '$size' available in '$block'";
  }

  return $ret_val;
}


sub list_available_subnets {
  my ($self, $block, $size, $first_available) = @_;

  my $ret_val = { status  => SMGMT_OK };

  # Validate block
  #
  unless (valid_subnet($block)) {
    $ret_val->{status} = SMGMT_INVALID_SUBNET;
    $ret_val->{error_msg} = "Specified block '$block' is not valid";
    return $ret_val;
  }

  # Validate size
  #
  if ($size !~ /^\d+$/) {
    $ret_val->{status} = SMGMT_INVALID_REQUEST_SIZE;
    $ret_val->{error_msg} = "Requested size '$size' is improperly formatted";
    return $ret_val;
  }

  $block = normalize_subnet($block);

  my ($ip, $mask) = get_subnet_components($block);

  if ($size < $mask || $size > 32) {
    $ret_val->{status} = SMGMT_INVALID_REQUEST_SIZE;
    $ret_val->{error_msg} = "Requested size '$size' is out of bounds";
    return $ret_val;
  }

  my ($low, $high) = get_network_range($ip, $mask);

  my $num_ips = 2 ** (32 - $size);

  if ($num_ips > ($high - $low + 1)) {
    $ret_val->{status} = SMGMT_INVALID_REQUEST_SIZE;
    $ret_val->{error_msg} =
      "Requested size '$size' too large for block (/$mask)";
    return $ret_val;
  }

  my $subnet;
  my $found = 0;

  # Check each 'size' subnet in the given block
  #
  while (($low + $num_ips - 1) <= $high) {

    $subnet = get_dotted_decimal($low) . "/$size";
    printf "checking ... %s/$size\n", get_dotted_decimal($low)
      if ($self->{debug});

    my $parent_subnets = $self->_get_subnets_from_orb($subnet, SMGMT_PARENTS);

    if ($self->{orb_error}) {
      $ret_val->{status} = SMGMT_ORB_ERROR;
      $ret_val->{error_msg} = $self->{orb_error};
      return $ret_val;
    }

    # See if this subnet is in use or if there are any smaller subnets
    # in use in this subnet.
    #
    my $in_use = 0;
    foreach my $element (@$parent_subnets) {
      print "  -> $element->{cidr}, $element->{status}\n" if ($self->{debug});
      $in_use = 1;
    }

    unless ($in_use) {
      my $children_subnets = $self->_get_subnets_from_orb($subnet,
                                                          SMGMT_CHILDREN);

      if ($self->{orb_error}) {
        $ret_val->{status} = SMGMT_ORB_ERROR;
        $ret_val->{error_msg} = $self->{orb_error};
        return $ret_val;
      }

      # See if this subnet is in use or if there are any smaller subnets
      # in use in this subnet.
      #
      foreach my $element (@$children_subnets) {
        print "  -> $element->{cidr}, $element->{status}\n" if ($self->{debug});
        $in_use = 1;
      }
    }

    unless ($in_use) {
      # Check if this subnet contains any used ips
      #
      my $ips_in_use = $self->get_ips_in_use($subnet);

      if ($ips_in_use->{status} != SMGMT_OK) {
        printf "Error finding IPs in use for subnet '%s/%s': %s (%s)\n",
          get_dotted_decimal($low), $size, $ips_in_use->{status},
          $ips_in_use->{error_code} if ($self->{debug});

        $ret_val->{status} = $ips_in_use->{status};
        $ret_val->{error_msg} = $ips_in_use->{error_msg};
        return $ret_val;
      }

      else {
        if (scalar(@{$ips_in_use->{data}})) {
          printf "  -> subnet contains %d IPs in use\n",
            scalar(@{$ips_in_use->{data}}) if ($self->{debug});
          $in_use = 1;
        }
      }
    }

    # If we've found a subnet that is not in use,
    #  reserve it and get out of the loop
    #
    unless ($in_use) {
      print "  -> available\n" if ($self->{debug});
      $found = 1;

      push(@{$ret_val->{subnets}}, $subnet);
      last if ($first_available);
    }

    $low += $num_ips;
    $subnet = undef;
  }

  # Couldn't find any available subnets
  #
  unless ($found) {
    $ret_val->{status} = SMGMT_NO_SUBNET_AVAILABLE;
    $ret_val->{error_msg} = "No subnet of size '$size' available in '$block'";
  }

  return $ret_val;
}


# This differs from list_available_subnets in several ways.  First, it is
# faster because it first finds all subnets in use in the given blocks and
# then looks at what is left.  Second, it allows the caller to provide a
# list of blocks to check rather than just one.  Third, it allows for
# multiple subnet lengths to be provided.  This last difference will allow
# the caller to make sure that subnets are allocated efficiently by picking
# a subnet which does not break up a larger block unnecessarily.
#
# This method does not account for unassigned subnets that contain
# DNS entries.  This would prevent the subnet from being used, but
# it is counted as available here.  This is just a list of the subnets
# that Orb thinks are available.  Check DNS (or whatever) later.
#
sub get_available_subnet_list {
  my ($self, $ip_blocks, $subnet_lengths) = @_;

  my $blocks = (ref($ip_blocks) eq '') ? [ $ip_blocks ] : $ip_blocks;
  my $sizes = (ref($subnet_lengths) eq '') ?
    [ $subnet_lengths ] : $subnet_lengths;

  my $ret_val = { status  => SMGMT_OK };

  unless (ref($blocks) eq 'ARRAY' && scalar(@$blocks) > 0) {
    $ret_val->{status} = SMGMT_INVALID_BLOCK_LIST;
    $ret_val->{error_msg} = "Specified block list is not an array or is empty";
    return $ret_val;
  }

  unless (ref($sizes) eq 'ARRAY' && scalar(@$sizes) > 0) {
    $ret_val->{status} = SMGMT_INVALID_SIZE_LIST;
    $ret_val->{error_msg} =
      "Specified mask size list is not an array or is empty";
    return $ret_val;
  }

  # Validate blocks
  #
  foreach my $block (@$blocks) {
    unless (valid_subnet($block)) {
      $ret_val->{status} = SMGMT_INVALID_SUBNET;
      $ret_val->{error_msg} = "Specified block '$block' is not valid";
      return $ret_val;
    }
  }

  # Validate mask lengths
  #
  foreach my $size (@$sizes) {
    unless (valid_mask($size)) {
      $ret_val->{status} = SMGMT_INVALID_REQUEST_SIZE;
      $ret_val->{error_msg} = "Specified subnet size '$size' is not valid";
      return $ret_val;
    }
  }

  # Make a spot for each of the subnet sizes requested.
  #
  foreach my $ml (@$sizes) {
    $ret_val->{data}{$ml} = {};
  }

  my $found = 0;
  foreach my $block (@$blocks) {
    my %in_use = ();

    # Find all of the subnets that are in use (in Orb) in each of
    # the blocks passed into this method.  Any subnet of these
    # blocks that doesn't overlap with any of the used subnets
    # are available.
    #
    my $result = $self->find_subnets_in($block);

    if ($result->{status} == SMGMT_OK) {
      foreach my $subnet (@{$result->{subnets}}) {
        my ($low, $high) = get_network_range(
          get_subnet_components($subnet->{cidr}));
        $in_use{$subnet->{cidr}} = { low => $low, high => $high };
      }
    }

    elsif ($result->{status} == SMGMT_NOT_FOUND) {
      # Not found
      # next;
    }

    else {
      # Return the error from find_subnets_in
      #
      return $result;
    }

    # Find all possible subnets of the requested sizes in the block.
    # and figure out which of those don't have any overlap with
    # used subnets.
    #
    foreach my $target_masklen (@$sizes) {

      my $netaddr_ip = NetAddr::IP->new($block);
      my @new_subnets = $netaddr_ip->split($target_masklen);

      foreach my $new_subnet (@new_subnets) {

        next if ($self->_subnet_overlap($new_subnet, \%in_use));

        # Only store the largest possible available block in the
        # return structure.  So if 1.1.0.0/23 is available, we store
        # that as an available /23, but we don't store 1.1.1.0/24 and
        # 1.1.0.0/24 as available /24s because it is implied.  That way
        # we can later select the smallest available block of the desired
        # size so that we don't break up big blocks unnecessarily.
        #
        my $overlap = 0;
        foreach my $check_masklen (@$sizes) {
          last if ($check_masklen == $target_masklen);

          if ($self->_subnet_overlap($new_subnet,
            $ret_val->{data}{$check_masklen})) {
            $overlap = 1;
            last;
          }
        }

        unless ($overlap) {
          my ($low, $high) = get_network_range(
            get_subnet_components($new_subnet));
          $ret_val->{data}{$target_masklen}{$new_subnet} =
            { low => $low, high => $high };
          $found = 1;
        }
      }
    }
  }

  # Couldn't find any available subnets
  #
  unless ($found) {
    $ret_val->{status} = SMGMT_NO_SUBNET_AVAILABLE;
    $ret_val->{error_msg} =
      "No subnets of requested sizes available in specified blocks";
    delete $ret_val->{data};
  }

  return $ret_val;
}


sub get_available_subnet_by_color {
  my ($self, $color, $site, $requested_size, $description) = @_;

  my $ret_val = { status  => SMGMT_OK };

  $color = $self->_normalize_color($color);
  unless (defined($self->{valid_colors}{$color})) {
    $ret_val->{status} = SMGMT_INVALID_NETWORK_COLOR;
    $ret_val->{error_msg} = "Network color '$color' not recognized";
    return $ret_val;
  }

  $site = uc($site);
  unless ($site && defined($self->{valid_sites}{$site})) {
    $ret_val->{status} = SMGMT_INVALID_SITE;
    $ret_val->{error_msg} = "Site '$site' not recognized";
    return $ret_val;
  }

  unless (valid_mask($requested_size)) {
    $ret_val->{status} = SMGMT_INVALID_REQUEST_SIZE;
    $ret_val->{error_msg} =
      "Specified subnet size '$requested_size' is not valid";
    return $ret_val;
  }

  my $size_list = ($requested_size <= $_DEFAULT_MAX_SUBNET_SIZE) ?
    [ $requested_size ] : [ $_DEFAULT_MAX_SUBNET_SIZE .. $requested_size ];

  my $blocks = $self->get_blocks_by_color($color, $site);

  return $blocks if ($blocks->{status} != SMGMT_OK);

  my $subnet_list = $self->get_available_subnet_list($blocks->{data},
    $size_list);

  return $subnet_list if ($subnet_list->{status} != SMGMT_OK);

  my $found = 0;

  foreach my $ml (sort { $b <=> $a } keys(%{$subnet_list->{data}})) {

    next if ($ml > $requested_size);

    foreach my $avail_subnet (sort bynet2 keys(%{$subnet_list->{data}{$ml}})) {
      my @slist = ();

      if ($ml < $requested_size) {
        # Break up avail_subnet into pieces of requested_size.
        #
        my $netaddr_ip = NetAddr::IP->new($avail_subnet);
        my @subs = $netaddr_ip->split($requested_size);
        map { push(@slist, "$_") } @subs;
      }
      else {
        # Already the right size, so the list of subnets to search is
        # just avail_subnet.
        #
        push(@slist, $avail_subnet);
      }

      foreach my $subnet (@slist) {
        my $dns_tries = 0;

        my $ips_in_use = $self->get_ips_in_use($subnet);

        if ($ips_in_use->{status} != SMGMT_OK) {
          printf "Error finding IPs in use for subnet '%s': %s (%s)\n",
            $subnet, $ips_in_use->{error_code} if ($self->{debug});

          $ret_val->{status} = $ips_in_use->{status};
          $ret_val->{error_msg} = $ips_in_use->{error_msg};
          return $ret_val;
        }

        elsif (scalar(@{$ips_in_use->{data}})) {
          printf "Warning: subnet '$subnet' contains %d IPs in use\n",
            scalar(@{$ips_in_use->{data}}) if ($self->{debug});
        }

        # Nothing in DNS.  Use this one.
        #
        else {
          my $result = $self->reserve_subnet($subnet,
            description => $description || '');

          # Someone grabbed this subnet before we could get to it.
          # Try to reserve the next one.
          #
          if ($result->{status} == SMGMT_SUBNET_EXISTS) {
            next;
          }

          elsif ($result->{status} != SMGMT_OK) {
            $ret_val->{status} = $result->{status};
            $ret_val->{error_msg} = $result->{error_msg};
            return $ret_val;
          }

          $ret_val->{subnet} = $subnet;
          $found = 1;
        }

        last if ($found);
      }

      last if ($found);
    }

    last if ($found);
  }

  # Couldn't find any available subnets
  #
  unless ($found) {
    $ret_val->{status} = SMGMT_NO_SUBNET_AVAILABLE;
    $ret_val->{error_msg} =
      "No subnets of requested sizes available for specified color/site";
  }

  return $ret_val;
}


sub get_ips_in_use {
  my ($self, $subnet) = @_;

  my $ret_val = { status  => SMGMT_OK };

  # Validate subnet
  #
  unless (valid_subnet($subnet)) {
    $ret_val->{status} = SMGMT_INVALID_SUBNET;
    $ret_val->{error_msg} = "Specified subnet '$subnet' is not valid";
    return $ret_val;
  }

  $subnet = normalize_subnet($subnet);

  my ($ip, $mask) = get_subnet_components($subnet);

  my $dns = AOL::BlueCat->new(license => $self->{bluecat_license},
    dry_run => $self->{dry_run});
  my $dns_tries = 0;

  # Retry find_by_subnet call up to $self->{dns_retries}.  This call
  # has traditionally failed when load is high on proteus.
  #
  IPS_IN_USE: {
    $dns_tries++;

    my $result = $dns->find_by_subnet($ip, $mask);

    if ($result->{status} != AOL::BlueCat::BLUECAT_STATUS_OK) {
      $ret_val->{status} = SMGMT_BLUECAT_ERROR;
      $ret_val->{error_msg} = "Error $result->{status} returned from " .
                              "find_by_subnet ($result->{error_code})";

      if ($dns_tries <= $self->{dns_retries}) {
        sleep($self->{dns_retry_delay});
        redo IPS_IN_USE;
      }

      return $ret_val;
    }

    else {
      $ret_val->{data} = $result->{data};
    }
  }

  return $ret_val;
}


sub update_subnet {
  my $self = shift;
  my $subnet = shift;
  my (%param) = @_;

  my %ret_val = ( status => SMGMT_OK );

  unless (valid_subnet($subnet)) {
    $ret_val{status} = SMGMT_INVALID_SUBNET;
    $ret_val{error_msg} = "Subnet '$subnet' improperly formatted";
    return \%ret_val;
  }

  # If no description was given, get out
  unless (defined($param{description})) {
    $ret_val{status} = SMGMT_NO_DESCRIPTION;
    $ret_val{error_msg} = "No description given";
    return \%ret_val;
  }

  my $result = $self->find_subnet($subnet, 1);

  if ($result->{status} != SMGMT_OK) {
    $ret_val{status} = SMGMT_NOT_FOUND;
    $ret_val{error_msg} = "Subnet '$subnet' does not exist - cannot update";
    return \%ret_val;
  }

  return \%ret_val if ($self->{dry_run});

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));
  $soap_data->add_elem(name   => 'creatorCDID',
                       value  => $self->{user_cdid});
  $soap_data->add_elem(name   => 'criteria');

  $soap_data->add_elem(name   => 'cidr',
                       value  => $subnet,
                       parent => $soap_data->get_elem('criteria'));

  foreach my $field (@{$self->{subnet_fields}}) {
    my $val = $param{$field} || $result->{data}{$field};
    $val = ucfirst($val) if ($field eq 'status');
    $soap_data->add_elem(name   => $field,
                         value  => $val,
                         parent => $soap_data->get_elem('criteria'));
  }

  eval {
    $result = $self->{soap}->updateSubnet($soap_data->to_soap_data);
  };

  if ($@) {
    $self->{soap_error} = $@;
  }

  if ($self->{soap_error}) {
    $ret_val{status} = SMGMT_SOAP_ERROR;
    $ret_val{error_msg} = $self->{soap_error} || 'unknown';
  }

  elsif (defined($result)) {
    if ($result->match(SOAP::SOM::envelope)) {
      my $val = $result->valueof('//return');

      if ($val == 1) {
        $ret_val{status} = SMGMT_OK;
      }
      else {
        $ret_val{status} = SMGMT_SOAP_ERROR;
        $ret_val{error_msg} = "Return code from update is '$val'";
      }
    }
    else {
      $ret_val{status} = SMGMT_SOAP_ERROR;
      $ret_val{error_msg} = "No SOAP envelope returned";
    }
  }

  else {
    $ret_val{status} = SMGMT_SOAP_ERROR;
    $ret_val{error_msg} = "Unknown error";
  }

  return \%ret_val;
}


sub get_blocks_by_color {
  my ($self, $color, $site) = @_;

  my %ret_val = ();

  $color = $self->_normalize_color($color);
  unless (defined($self->{valid_colors}{$color})) {
    $ret_val{status} = SMGMT_INVALID_NETWORK_COLOR;
    $ret_val{error_msg} = "Network color '$color' not recognized";
    return \%ret_val;
  }

  $site = uc($site);
  if ($site && ! defined($self->{valid_sites}{$site})) {
    $ret_val{status} = SMGMT_INVALID_SITE;
    $ret_val{error_msg} = "Site '$site' not recognized";
    return \%ret_val;
  }

  my $hostname = hostname();
  my $base_dir = $BASE_BLOCK_DIR{$hostname} || '';

  unless ($base_dir) {
    $ret_val{status} = SMGMT_BLOCK_LOAD_ERROR;
    $ret_val{error_msg} = "Error loading IP block list on '$hostname'";
    return \%ret_val;
  }

  my $path = "$base_dir/${color}_ip_blocks";

  my $ip_blocks = do $path;
  if ($@) {
    $ret_val{status} = SMGMT_BLOCK_LOAD_ERROR;
    $ret_val{error_msg} = "Error loading IP block list from '$path': $@";
    return \%ret_val;
  }

  $ret_val{status} = SMGMT_OK;

  if ($site) {
    $ret_val{data} = ($ip_blocks->{$site}) ?  $ip_blocks->{$site} : [];
  }
  else {
    $ret_val{data} = $ip_blocks;
  }

  return \%ret_val;
}


sub find_subnet_color {
  my ($self, $subnet) = @_;

  my %ret_val = ();

  unless (valid_subnet($subnet)) {
    $ret_val{status} = SMGMT_INVALID_SUBNET;
    $ret_val{error_msg} = "Subnet '$subnet' improperly formatted";
    return \%ret_val;
  }

  my $hostname = hostname();
  my $base_dir = $BASE_BLOCK_DIR{$hostname} || '';

  unless ($base_dir) {
    $ret_val{status} = SMGMT_BLOCK_LOAD_ERROR;
    $ret_val{error_msg} = "Error loading IP block list on '$hostname'";
    return \%ret_val;
  }

  foreach my $color (keys(%{$self->{valid_colors}})) {
    my $path = "$base_dir/${color}_ip_blocks";

    my $ip_blocks = do $path;
    if ($@) {
      $ret_val{status} = SMGMT_BLOCK_LOAD_ERROR;
      $ret_val{error_msg} = "Error loading IP block list from '$path': $@";
      return \%ret_val;
    }

    my ($subnet_low, $subnet_high) = get_network_range(get_subnet_components($subnet));

    foreach my $site (keys(%$ip_blocks)) {
      foreach my $block (@{%{$ip_blocks->{$site}}}) {
        if ($self->_subnet_overlaps($subnet, $block)) {
          $ret_val{status} = SMGMT_OK;
          $ret_val{color} = $color;
          $ret_val{site} = $site;
          $ret_val{block} = $block;
          return \%ret_val;
        }
      }
    }
  }

  $ret_val{status} = SMGMT_NOT_FOUND;
  $ret_val{error_msg} = "Subnet '$subnet' not associated with any network color";

  return \%ret_val;
}


sub _insert_subnet {
  my $self = shift;
  my $subnet = shift;
  my (%param) = @_;

  my %ret_val = ();

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));
  $soap_data->add_elem(name   => 'creatorCDID',
                       value  => $self->{user_cdid});
  $soap_data->add_elem(name   => 'criteria');

  $soap_data->add_elem(name   => 'cidr',
                       value  => $subnet,
                       parent => $soap_data->get_elem('criteria'));

  # If no description was given, blank it out
  $param{description} = ' ' unless ($param{description});
  $param{description} =~ s/&/&amp;/g;
  $param{description} =~ s/>/&gt;/g;
  $param{description} =~ s/</&lt;/g;

  foreach my $field (@{$self->{subnet_fields}}) {
    my $val = $param{$field} || $self->{default_field_values}{$field};
    $val = 'Reserved' if ($field eq 'status');
    $soap_data->add_elem(name   => $field,
                         value  => $val,
                         parent => $soap_data->get_elem('criteria'));
  }

  my $result;

  eval {
    $result = $self->{soap}->insertSubnet($soap_data->to_soap_data);
  };

  if ($@) {
    $self->{soap_error} = $@;
  }

  if ($self->{soap_error}) {
    $ret_val{status} = SMGMT_SOAP_ERROR;
    $ret_val{error_msg} = $self->{soap_error} || 'unknown';
  }

  elsif (defined($result)) {
    if ($result->match(SOAP::SOM::envelope)) {
      my $val = $result->valueof('//return');

      $ret_val{status} = SMGMT_OK;
      $ret_val{element_id} = $val;

      # Initialize IPs in Orb for this subnet.
      # Set the network/broadcast addresses, set the rest as available,
      # and properly set the vrrp and virtual flags.
      #
      my $orbip = AOL::OrbIP->new(db => $self->{db});

      my $orb_rc = $orbip->initialize_subnet_ips($subnet, [], 1);

      if ($orb_rc->{status} != AOL::OrbIP::ORBIP_OK) {
        # @@ Set a warning field here??
        # printf "WARNING: Couldn't set IPs in Orb (%d):\n", $orb_rc->{status};
        # printf "   %s\n", $orb_rc->{error_msg} if ($orb_rc->{error_msg});
      }
    }
    else {
      $ret_val{status} = SMGMT_SOAP_ERROR;
      $ret_val{error_msg} = "No SOAP envelope returned";
    }
  }

  else {
    $ret_val{status} = SMGMT_SOAP_ERROR;
    $ret_val{error_msg} = "Unknown error";
  }

  return \%ret_val;
}


sub _delete_subnet {
  my ($self, $subnet) = @_;

  my %ret_val = ( status => SMGMT_OK );

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));
  $soap_data->add_elem(name   => 'updaterCDID',
                       value  => $self->{user_cdid});
  $soap_data->add_elem(name   => 'cidr',
                       value  => $subnet);

  return \%ret_val if ($self->{dry_run});

  my $result;

  eval {
    $result = $self->{soap}->deleteSubnet($soap_data->to_soap_data);
  };

  if ($@) {
    $self->{soap_error} = $@;
  }

  if ($self->{soap_error}) {
    $ret_val{status} = SMGMT_SOAP_ERROR;
    $ret_val{error_msg} = $self->{soap_error} || 'unknown';
  }

  elsif (defined($result)) {
    if ($result->match(SOAP::SOM::envelope)) {
      my $val = $result->valueof('//return');

      if ($val == 1) {
        $ret_val{status} = SMGMT_OK;

        # Update status of the IPs in this subnet in Orb.
        # Mark all IPs as available and non-virtual/non-vrrp.
        #
        my $orbip = AOL::OrbIP->new(db => $self->{db});

        my $orb_rc = $orbip->initialize_subnet_ips($subnet, [], 1);

        if ($orb_rc->{status} != AOL::OrbIP::ORBIP_OK) {
          # @@ Set a warning field here??
          # printf "WARNING: Couldn't set IPs in Orb (%d):\n", $orb_rc->{status};
          # printf "   %s\n", $orb_rc->{error_msg} if ($orb_rc->{error_msg});
        }

        my ($network_ip, $broadcast_ip) = get_network_range(
          get_subnet_components($subnet));

        $orb_rc = $orbip->update_or_create_ip(get_dotted_decimal($network_ip),
          'Available', 0, 0);
        if ($orb_rc->{status} != AOL::OrbIP::ORBIP_OK) {
          # @@ Set a warning field here??
        }

        $orb_rc = $orbip->update_or_create_ip(get_dotted_decimal($broadcast_ip),
          'Available', 0, 0);
        if ($orb_rc->{status} != AOL::OrbIP::ORBIP_OK) {
          # @@ Set a warning field here??
        }
      }
      else {
        $ret_val{status} = SMGMT_SOAP_ERROR;
        $ret_val{error_msg} = "Return code from delete is '$val'";
      }
    }
    else {
      $ret_val{status} = SMGMT_SOAP_ERROR;
      $ret_val{error_msg} = "No SOAP envelope returned";
    }
  }

  else {
    $ret_val{status} = SMGMT_SOAP_ERROR;
    $ret_val{error_msg} = "Unknown error";
  }

  return \%ret_val;
}


sub _find_block {
  my ($self, $subnet) = @_;

  my $ip;
  my $mask;

  if ($subnet =~ /^([\d\.]+)\/(\d+)$/) {
    $ip = $1;
    $mask = $2;
  }
  else {
    return 'bad subnet';
  }

  my $num_octets = ($mask >= 24) ? 3 : (($mask >= 16) ? 2 : 1);
  my @octets = split(/\./, $ip);
  splice(@octets, $num_octets);
  my $block = join('.', @octets);

  my ($low_range, $high_range) = get_network_range($ip, $mask);

  $block .= '.';
  return ($block, $low_range, $high_range);
}


sub _age_out_subnet_in_nms {
  my ($self, $subnet) = @_;

  my %ret_val = ( status => SMGMT_OK );

  unless (valid_subnet($subnet)) {
    $ret_val{status} = SMGMT_INVALID_SUBNET;
    $ret_val{error_msg} = "Subnet '$subnet' improperly formatted";
    return \%ret_val;
  }

  return \%ret_val if ($self->{dry_run});

  $self->nms_connect();

  return SMGMT_NMS_ERROR unless ($self->{nms_dbh});

  my $SQL = "UPDATE subnets " .
            "   SET last_touched_at = '1997-10-04 15:00:00' " .
            " WHERE subnet = '$subnet'";

  my $sth = $self->{nms_dbh}->prepare($SQL) or
    do {
      print "_age_out_subnet_in_nms: Couldn't prepare SQL '$SQL': " .
        DBI->errstr . "\n";
      $ret_val{status} = SMGMT_NMS_ERROR;
      $ret_val{error_msg} = DBI->errstr;
      return \%ret_val;
    };

  my $db_response = $sth->execute();

# @@ $sth->rows() is the number of rows updated.
# @@ do we want to check/return this??

  unless ($db_response) {
    $ret_val{status} = SMGMT_NMS_ERROR;
    $ret_val{error_msg} = DBI->errstr;
    return \%ret_val;
  }

  $sth->finish();
  $self->nms_disconnect();

  return \%ret_val;
}


sub bynet {
  my @a_octets = split(/\D/, $a->{cidr});
  my @b_octets = split(/\D/, $b->{cidr});

  for my $i (0..4) {
    next if ($a_octets[$i] == $b_octets[$i]);
    return ($a_octets[$i] <=> $b_octets[$i]);
  }
}


sub bynet2 {
  my @a_octets = split(/\D/, $a);
  my @b_octets = split(/\D/, $b);

  for my $i (0..4) {
    next if ($a_octets[$i] == $b_octets[$i]);
    return ($a_octets[$i] <=> $b_octets[$i]);
  }
}


sub _find_in_list {
  my ($self, $list, $item) = @_;

  foreach my $element (@$list) {
    return 1 if ($element->{cidr} eq $item);
  }

  return 0;
}


sub _normalize_color {
  my ($self, $color) = @_;

  $color = lc($color);
  $color =~ s/^\s*generic//;
  $color =~ s/^\s*non-?routable//;
  $color =~ s/^^\s*routable\s+black/blackr/;
  $color =~ s/^\s+//;
  $color =~ s/\s+$//;

  return $color;
}


sub _subnet_overlap {
  my ($self, $subnet, $in_use) = @_;

  my $overlap = 0;

  my ($low, $high) = get_network_range(get_subnet_components($subnet));

  foreach my $s (keys(%$in_use)) {
    if (($low >= $in_use->{$s}{low} && $low <= $in_use->{$s}{high}) ||
        ($high <= $in_use->{$s}{high} && $high >= $in_use->{$s}{low}) ||
        ($low <= $in_use->{$s}{low} && $high >= $in_use->{$s}{high})) {
      $overlap = 1;
      last;
    }
  }

  return $overlap;
}


sub _subnet_overlaps {
  my ($self, $subnet, $block) = @_;

  my ($subnet_low, $subnet_high) = get_network_range(get_subnet_components($subnet));
  my ($block_low, $block_high) = get_network_range(get_subnet_components($block));

  if (($subnet_low >= $block_low && $subnet_low <= $block_high) ||
      ($subnet_high <= $block_high && $subnet_high >= $block_low) ||
      ($subnet_low <= $block_low && $subnet_high >= $block_high)) {
   return 1;
  }

  return 0;
}



1;

