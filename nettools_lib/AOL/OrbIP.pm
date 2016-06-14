############################################################################
# $Id$
#
# $Revision$
############################################################################

package AOL::OrbIP;

use strict;
use warnings;
use English qw( -no_match_vars );

use SOAP::Lite
# trace => 'all'
;
use SOAP::Data::Builder;

use AOL::IPUtils;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw( get_ip_address
                     get_subnet_ips
                     insert_ip
                     update_ip
                     update_or_create_ip
                     initialize_subnet_ips
                     get_status_id

                     ORBIP_OK
                     ORBIP_INVALID_IP
                     ORBIP_INVALID_SUBNET
                     ORBIP_IP_PARAMETERS_INVALID
                     ORBIP_VRRP_INVALID
                     ORBIP_VIRTUAL_INVALID
                     ORBIP_SOAP_ERROR
                   );

use constant ORBIP_OK                    => 0;
use constant ORBIP_INVALID_IP            => 1;
use constant ORBIP_INVALID_SUBNET        => 2;
use constant ORBIP_IP_PARAMETERS_INVALID => 3;
use constant ORBIP_VRRP_INVALID          => 4;
use constant ORBIP_VIRTUAL_INVALID       => 5;
use constant ORBIP_SOAP_ERROR            => 6;

my $_DEFAULT_DB = 'prod';

my %_ORB_SERVICE_URI = (
  dev  => 'http://oasisws-dev.ops.aol.com:8100/orb/services/net/latest/IPAddressService?wsdl',
  prod => 'http://ws.oasis.aol.com:8100/orb/services/net/latest/IPAddressService?wsdl',
);

my $_ORB_LICENSE = '97D5A2CC-F0976FF5-33253779-3ED7DACD';
my $_ORB_NS      = 'http://services.net.orb.ws.oasis.aol.com/';


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

  $self->{license} = $args{license} || $_ORB_LICENSE;

  $self->{dry_run} = ($args{dry_run}) ? 1: 0;

  $self->{orb_error} = undef;

  $self->{soap_error} = undef;
  $self->{soap_error_detail} = undef;

  $self->{status_to_id} = {
    'In Use'       => 1,
    'Reserved'     => 2,
    'Available'    => 3,
    'Unassignable' => 4,
  };

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

  return $self;
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


## Methods available
#
# getIPAddressByElementId
# getIPAddressByExample
# getIPAddressBySubnet
# insertIPAddress
# updateIPAddress
# updateOrCreateIPAddress
# deleteIPAddress



sub get_ip_address {
  my ($self, $ip) = @_;

  my %ret_val = ( status => ORBIP_OK );

  unless (AOL::IPUtils::valid_ip($ip)) {
    $ret_val{status} = ORBIP_INVALID_IP;
    $ret_val{error_msg} = "IP address '$ip' improperly formatted";
    return \%ret_val;
  }

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));
  $soap_data->add_elem(name => 'criteria');

  $soap_data->add_elem(name => 'address',
                       value => $ip,
                       parent => $soap_data->get_elem('criteria'));

  my $result;

  eval {
    $result = $self->{soap}->getIPAddressByExample($soap_data->to_soap_data);
  };

  if ($@) {
    $self->{soap_error} = $@;
  }

  if ($self->{soap_error}) {
    $ret_val{status} = ORBIP_SOAP_ERROR;
    $ret_val{error_msg} = $self->{soap_error} || 'unknown';
  }

  elsif (defined($result)) {
    if ($result->match(SOAP::SOM::envelope)) {
      my %ip_data = ();

      my @val = $result->valueof('//return');

      foreach my $element (sort @val) {
        $ip_data{$element->{address}} = {
          address_id => $element->{addressId},
          type       => $element->{addressType},
          type_id    => $element->{addressTypeId},
          vrrp       => $element->{vrrp},
          virtual    => $element->{virtual},
          status     => $element->{ipAddressStatus},
          status_id  => $element->{ipAddressStatusId},
        };
      }

      $ret_val{data} = \%ip_data;
    }

    else {
      $ret_val{status} = ORBIP_SOAP_ERROR;
      $ret_val{error_msg} = "No SOAP envelope returned";
    }
  }

  else {
    $ret_val{status} = ORBIP_SOAP_ERROR;
    $ret_val{error_msg} = "Unknown error";
  }

  return \%ret_val;
}


sub get_subnet_ips {
  my ($self, $subnet) = @_;

  my %ret_val = ( status => ORBIP_OK );

  unless (AOL::IPUtils::valid_subnet($subnet)) {
    $ret_val{status} = ORBIP_INVALID_SUBNET;
    $ret_val{error_msg} = "Subnet '$subnet' improperly formatted";
    return \%ret_val;
  }

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));
  $soap_data->add_elem(name   => 'criteria',
                       value  => $subnet);

  my $result;

  eval {
    $result = $self->{soap}->getIPAddressBySubnet($soap_data->to_soap_data);
  };

  if ($@) {
    $self->{soap_error} = $@;
  }

  if ($self->{soap_error}) {
    $ret_val{status} = ORBIP_SOAP_ERROR;
    $ret_val{error_msg} = $self->{soap_error} || 'unknown';
  }

  elsif (defined($result)) {
    if ($result->match(SOAP::SOM::envelope)) {
      my %subnet_data = ();

      my @val = $result->valueof('//return');

      foreach my $element (sort @val) {
        $subnet_data{$element->{address}} = {
          address_id => $element->{addressId},
          type       => $element->{addressType},
          type_id    => $element->{addressTypeId},
          vrrp       => $element->{vrrp},
          virtual    => $element->{virtual},
          status     => $element->{ipAddressStatus},
          status_id  => $element->{ipAddressStatusId},
        };
      }

      $ret_val{data} = \%subnet_data;
    }

    else {
      $ret_val{status} = ORBIP_SOAP_ERROR;
      $ret_val{error_msg} = "No SOAP envelope returned";
    }
  }

  else {
    $ret_val{status} = ORBIP_SOAP_ERROR;
    $ret_val{error_msg} = "Unknown error";
  }

  return \%ret_val;
}


sub insert_ip {
  my ($self, $ip, $status, $virtual, $vrrp) = @_;

  return $self->update_or_create_ip($ip, $status, $virtual, $vrrp);
}


sub update_ip {
  my ($self, $ip, $status, $virtual, $vrrp) = @_;

  return $self->update_or_create_ip($ip, $status, $virtual, $vrrp);
}


sub update_or_create_ip {
  my ($self, $ip, $status, $virtual, $vrrp) = @_;

  my %ret_val = ( status => ORBIP_OK );

  $virtual = '' unless (defined($virtual));
  $vrrp = '' unless (defined($vrrp));

  my $rc = $self->_normalize_and_validate_parameters($ip, \$virtual, \$vrrp);

  if ($rc->{status} != ORBIP_OK) {
    return $rc;
  }

  return \%ret_val if ($self->{dry_run});

  my $status_id = $self->get_status_id($status);

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));
  $soap_data->add_elem(name   => 'criteria');

  $soap_data->add_elem(name   => 'address',
                       value  => $ip,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name   => 'addressTypeId',
                       # value  => 'IPv4',
                       value  => 1,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name   => 'ipAddressStatusId',
                       value  => $status_id,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name   => 'virtual',
                       value  => $virtual,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name   => 'vrrp',
                       value  => $vrrp,
                       parent => $soap_data->get_elem('criteria'));

  my $result;

  eval {
    $result = $self->{soap}->updateOrCreateIPAddress($soap_data->to_soap_data);
  };

  if ($@) {
    $self->{soap_error} = $@;
  }

  if ($self->{soap_error}) {
    $ret_val{status} = ORBIP_SOAP_ERROR;
    $ret_val{error_msg} = $self->{soap_error} || 'unknown';
  }

  elsif (defined($result)) {
    if ($result->match(SOAP::SOM::envelope)) {
      # @@ Is element id always returned?
      $ret_val{id} = $result->valueof('//return');
    }
    else {
      $ret_val{status} = ORBIP_SOAP_ERROR;
      $ret_val{error_msg} = "No SOAP envelope returned";
    }
  }

  else {
    $ret_val{status} = ORBIP_SOAP_ERROR;
    $ret_val{error_msg} = "Unknown error";
  }

  return \%ret_val;
}


# sub delete_ip {
#   my ($self, $ip) = @_;
# 
# Not implemented.  For now just use update_ip
# to mark the IP as 'Unassignable'.
#
# }


sub initialize_subnet_ips {
  my ($self, $subnet, $ips_to_set, $full_init) = @_;

  my %ret_val = ( status => ORBIP_OK );
  $full_init = 0 unless (defined($full_init));

  unless (AOL::IPUtils::valid_subnet($subnet)) {
    $ret_val{status} = ORBIP_INVALID_SUBNET;
    $ret_val{error_msg} = "Subnet '$subnet' improperly formatted";
    return \%ret_val;
  }

  if (ref($ips_to_set) ne 'ARRAY') {
    $ret_val{status} = ORBIP_IP_PARAMETERS_INVALID;
    $ret_val{error_msg} = "Subnet parameters not an array reference";
    return \%ret_val;
  }

  # @@ We don't have anything that we can do with the name for now.
  # @@ Eventually we should implement a way to update the 
  # @@ net_ip_address_alias table properly.

  my %ip_data = ();

  foreach my $entry (@$ips_to_set) {

    my $virtual = $entry->{virtual};
    my $vrrp = $entry->{vrrp};

    $virtual = '' unless (defined($virtual));
    $vrrp = '' unless (defined($vrrp));

    my $rc = $self->_normalize_and_validate_parameters($entry->{ip}, \$virtual, \$vrrp);

    if ($rc->{status} != ORBIP_OK) {
      return $rc;
    }

    $ip_data{$entry->{ip}} = { name    => $entry->{name},
                               vrrp    => $vrrp,
                               virtual => $virtual,
                             };
  }

  my $subnet_data = $self->get_subnet_ips($subnet);

  if ($subnet_data->{status} != ORBIP_OK) {
    return $subnet_data;
  }

  my ($ip, $mask) = AOL::IPUtils::get_subnet_components($subnet);
  my ($low, $high) = AOL::IPUtils::get_network_range($ip, $mask);

  for (my $i = $low; $i <= $high; $i++) {
    my $ip = AOL::IPUtils::get_dotted_decimal($i);

    # Go through the subnet and if the IP doesn't exist or it isn't
    # already set the way we want it to be set, update Orb with the
    # correct state information.
    #
    if ($full_init && ($i == $low || $i == $high)) {
      if (! defined($subnet_data->{$ip}) ||
          ! $self->_ip_data_already_set($subnet_data->{$ip}, 'Unassignable',
                                        'true', 'false')) {
        my $rc = $self->update_or_create_ip($ip, 'Unassignable',
          'true', 'false');

        if ($rc->{status} != ORBIP_OK) {
          return $rc;
        }
      }
    }

    elsif (defined($ip_data{$ip})) {
      if (! defined($subnet_data->{$ip}) ||
          ! $self->_ip_data_already_set($subnet_data->{$ip}, 'In Use',
                                        $ip_data{$ip}{virtual},
                                        $ip_data{$ip}{vrrp})) {
        my $rc = $self->update_or_create_ip(
          $ip, 'In Use', $ip_data{$ip}{virtual}, $ip_data{$ip}{vrrp});

        if ($rc->{status} != ORBIP_OK) {
          return $rc;
        }
      }
    }

    else {
      if ($full_init &&
         (! defined($subnet_data->{$ip}) ||
          ! $self->_ip_data_already_set($subnet_data->{$ip}, 'Available',
                                        'false', 'false'))) {
        my $rc = $self->update_or_create_ip($ip, 'Available', 'false', 'false');

        if ($rc->{status} != ORBIP_OK) {
          return $rc;
        }
      }
    }
  }

  return \%ret_val;
}


sub get_status_id {
  my ($self, $status) = @_;

  return (defined($self->{status_to_id}{$status}))
    ? $self->{status_to_id}{$status} : undef;
}


sub _ip_data_already_set {
  my ($self, $subnet_data, $status, $virtual, $vrrp) = @_;

  return 0 if ($subnet_data->{status} ne $status ||
               $subnet_data->{virtual} ne $virtual ||
               $subnet_data->{vrrp} ne $vrrp);

  return 1;
}


sub _normalize_and_validate_parameters {
  my ($self, $ip, $virtual, $vrrp) = @_;

  my %ret_val = ( status => ORBIP_OK );

  unless (defined($ip) && AOL::IPUtils::valid_ip($ip)) {
    $ret_val{status} = ORBIP_INVALID_IP;
    $ret_val{error_msg} = "IP '$ip' improperly formatted";
    return \%ret_val;
  }

  unless (defined($$virtual) && defined($$vrrp)) {
    my $result = $self->get_ip_address($ip);

    $$virtual = $result->{data}{$ip}{virtual} unless (defined($$virtual));
    $$vrrp = $result->{data}{$ip}{vrrp} unless (defined($$vrrp));
  }

  $$vrrp = 'false' unless ($$vrrp);
  $$virtual = 'false' unless ($$virtual);

  $$vrrp = 'true' if ($$vrrp eq '1');
  $$vrrp = 'false' if ($$vrrp eq '0');
  $$virtual = 'true' if ($$virtual eq '1');
  $$virtual = 'false' if ($$virtual eq '0');
  $$virtual = 'true' if ($$vrrp eq 'true');

  if ($$vrrp ne 'true' && $$vrrp ne 'false') {
    $ret_val{status} = ORBIP_VRRP_INVALID;
    $ret_val{error_msg} =
      "Input parameter VRRP '$$vrrp' improperly formatted";
    return \%ret_val;
  }

  if ($$virtual ne 'true' && $$virtual ne 'false') {
    $ret_val{status} = ORBIP_VIRTUAL_INVALID;
    $ret_val{error_msg} =
      "Input parameter VIRTUAL '$$virtual' improperly formatted";
    return \%ret_val;
  }

  return \%ret_val;
}


1;

