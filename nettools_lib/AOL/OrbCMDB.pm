############################################################################
# $Id$
#
# $Revision$
############################################################################

package AOL::OrbCMDB;

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

our @EXPORT_OK = qw( add_interface_to_vlan
                     remove_interface_to_vlan
                     decommission_vlan
                     link_ip_to_interface
                     unlink_ip_from_interface
                     link_switch_vlan_subnet

                     ORBCMDB_OK
                     ORBCMDB_INVALID_ELEMENT_ID
                     ORBCMDB_INVALID_IP
                     ORBCMDB_INVALID_SUBNET
                     ORBCMDB_WS_ERROR
                     ORBCMDB_SOAP_ERROR
                   );

use constant ORBCMDB_OK                    => 0;
use constant ORBCMDB_INVALID_ELEMENT_ID    => 1;
use constant ORBCMDB_INVALID_IP            => 2;
use constant ORBCMDB_INVALID_SUBNET        => 3;
use constant ORBCMDB_WS_ERROR              => 4;
use constant ORBCMDB_SOAP_ERROR            => 6;

my $_DEFAULT_DB = 'prod';

my %_ORB_SERVICE_URI = (
  dev  => 'http://oasisws-dev.ops.aol.com:8100/orb/services/net/latest/OrbCMDBService?wsdl',
  prod => 'http://ws.oasis.aol.com:8100/orb/services/net/latest/OrbCMDBService?wsdl',
);

my %_ORB_LICENSE = (
  prod => '608D4CA7-0CD23338-C2A3ADA3-16F1B106',  # configurator
  dev  => '5E31025B-937171E4-598CC1B6-704454CC',  # configurator
);

my $_ORB_NS = 'http://services.net.orb.ws.oasis.aol.com/';


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

  $self->{license} = $args{license} || $_ORB_LICENSE{$self->{db}};

  $self->{cdid} = $args{cdid} || 'pstephan98';   # @@ cdid?

  $self->{dry_run} = ($args{dry_run}) ? 1: 0;

  $self->{orb_error} = undef;

  $self->{soap_error} = undef;
  $self->{soap_error_detail} = undef;

  eval {
    $self->{soap} = SOAP::Lite->autotype(0)
                              ->readable(1)
                              ->proxy($self->{uri})
                              ->ns($self->{ns}, 'ns2')
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



sub add_interface_to_vlan {
  my ($self, $interface_id, $vlan_id) = @_;

  my %ret_val = ( status => ORBCMDB_OK );

  unless (defined($interface_id) && $interface_id =~ /^\d+$/) {
    $ret_val{status} = ORBCMDB_INVALID_ELEMENT_ID;
    $ret_val{error_msg} = sprintf("Interface ID '%s' is missing or non-numeric",
      defined($interface_id) ? $interface_id : '');
    return \%ret_val;
  }

  unless (defined($vlan_id) && $vlan_id =~ /^\d+$/) {
    $ret_val{status} = ORBCMDB_INVALID_ELEMENT_ID;
    $ret_val{error_msg} = sprintf("Vlan ID '%s' is missing or non-numeric",
      defined($vlan_id) ? $vlan_id : '');
    return \%ret_val;
  }

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));

  $soap_data->add_elem(name => 'cdid',
                       value => $self->{cdid});
  $soap_data->add_elem(name => 'vlanId',
                       value => $vlan_id);
  $soap_data->add_elem(name => 'interfaceId',
                       value => $interface_id);

  my $result;

  unless ($self->{dry_run}) {
    eval {
      $result = $self->{soap}->addInterfaceToVLAN($soap_data->to_soap_data);
    };

    if ($self->{soap_error}) {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = $self->{soap_error} || 'unknown';
    }

    elsif (defined($result)) {
      if ($result->match(SOAP::SOM::envelope)) {

        my $val = $result->valueof('//return');

        # Negative return value here an error.
        #
        if ($val < 0) {
          my %err_msg = (
            '-1' => 'Specified vlan not found in Orb',
            '-2' => 'Specified logical interface not found in Orb',
            '-3' => 'Specified cdid not found in Orb',
          );

          $ret_val{status} = ORBCMDB_WS_ERROR;
          $ret_val{error_msg} = $err_msg{$val} ||
            "Error returned by addInterfaceToVLAN call: '$val'";
        }
      }

      else {
        $ret_val{status} = ORBCMDB_SOAP_ERROR;
        $ret_val{error_msg} = "No SOAP envelope returned";
      }
    }

    else {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = "Unknown error";
    }
  }

  return \%ret_val;
}


sub remove_interface_from_vlan {
  my ($self, $interface_id, $vlan_id) = @_;

  my %ret_val = ( status => ORBCMDB_OK );

  unless (defined($interface_id) && $interface_id =~ /^\d+$/) {
    $ret_val{status} = ORBCMDB_INVALID_ELEMENT_ID;
    $ret_val{error_msg} = sprintf("Interface ID '%s' is missing or non-numeric",
      defined($interface_id) ? $interface_id : '');
    return \%ret_val;
  }

  unless (defined($vlan_id) && $vlan_id =~ /^\d+$/) {
    $ret_val{status} = ORBCMDB_INVALID_ELEMENT_ID;
    $ret_val{error_msg} = sprintf("Vlan ID '%s' is missing or non-numeric",
      defined($vlan_id) ? $vlan_id : '');
    return \%ret_val;
  }

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));

  $soap_data->add_elem(name => 'vlanId',
                       value => $vlan_id);
  $soap_data->add_elem(name => 'interfaceId',
                       value => $interface_id);

  my $result;

  unless ($self->{dry_run}) {
    eval {
      $result = $self->{soap}->removeInterfaceFromVLAN($soap_data->to_soap_data);
    };

    if ($self->{soap_error}) {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = $self->{soap_error} || 'unknown';
    }

    elsif (defined($result)) {
      if ($result->match(SOAP::SOM::envelope)) {

        my $val = $result->valueof('//return');

        # Negative return value here an error.
        #
        if ($val < 0) {
          my %err_msg = (
            '-1' => 'Specified mapping not found in Orb',
          );

          $ret_val{status} = ORBCMDB_WS_ERROR;
          $ret_val{error_msg} = $err_msg{$val} || 
            "Error returned by removeInterfaceFromVLAN call: '$val'";
        }
      }

      else {
        $ret_val{status} = ORBCMDB_SOAP_ERROR;
        $ret_val{error_msg} = "No SOAP envelope returned";
      }
    }

    else {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = "Unknown error";
    }
  }

  return \%ret_val;
}


sub decommission_vlan {
  my ($self, $vlan_id) = @_;

  my %ret_val = ( status => ORBCMDB_OK );

  unless (defined($vlan_id) && $vlan_id =~ /^\d+$/) {
    $ret_val{status} = ORBCMDB_INVALID_ELEMENT_ID;
    $ret_val{error_msg} = sprintf("Vlan ID '%s' is missing or non-numeric",
      defined($vlan_id) ? $vlan_id : '');
    return \%ret_val;
  }

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));

  $soap_data->add_elem(name => 'cdid',
                       value => $self->{cdid});
  $soap_data->add_elem(name => 'vlanId',
                       value => $vlan_id);

  my $result;

  unless ($self->{dry_run}) {
    eval {
      $result = $self->{soap}->decommissionVLAN($soap_data->to_soap_data);
    };

    if ($self->{soap_error}) {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = $self->{soap_error} || 'unknown';
    }

    elsif (defined($result)) {
      if ($result->match(SOAP::SOM::envelope)) {

        my $val = $result->valueof('//return');

        # Negative return value here an error.
        #
        if ($val < 0) {
          my %err_msg = (
            '-1' => 'Specified vlan not found in Orb',
            '-2' => 'Status for Decommissioned not found in Orb',
          );

          $ret_val{status} = ORBCMDB_WS_ERROR;
          $ret_val{error_msg} = $err_msg{$val} ||
            "Error returned by decommissionVLAN call: '$val'";
        }
      }

      else {
        $ret_val{status} = ORBCMDB_SOAP_ERROR;
        $ret_val{error_msg} = "No SOAP envelope returned";
      }
    }

    else {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = "Unknown error";
    }
  }

  return \%ret_val;
}


sub link_ip_to_interface {
  my ($self, $ip, $interface_id, $force) = @_;

  my %ret_val = ( status => ORBCMDB_OK );

  if (defined($force) &&
     ($force eq '1' || lc($force) eq 't' || lc($force) eq 'true')) {
    $force = 'true';
  }
  else {
    $force = 'false';
  }

  unless (AOL::IPUtils::valid_ip($ip)) {
    $ret_val{status} = ORBCMDB_INVALID_IP;
    $ret_val{error_msg} = sprintf("Specified IP '%s' is not valid", $ip);
    return \%ret_val;
  }

  unless (defined($interface_id) && $interface_id =~ /^\d+$/) {
    $ret_val{status} = ORBCMDB_INVALID_ELEMENT_ID;
    $ret_val{error_msg} = sprintf("Interface ID '%s' is missing or non-numeric",
      defined($interface_id) ? $interface_id : '');
    return \%ret_val;
  }

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));

  $soap_data->add_elem(name => 'cdid',
                       value => $self->{cdid});
  $soap_data->add_elem(name => 'ipAddress',
                       value => $ip);
  $soap_data->add_elem(name => 'interfaceId',
                       value => $interface_id);
  $soap_data->add_elem(name => 'force',
                       value => $force);

  my $result;

  unless ($self->{dry_run}) {
    eval {
      $result = $self->{soap}->linkIPAddressToLogicalInterface($soap_data->to_soap_data);
    };

    if ($self->{soap_error}) {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = $self->{soap_error} || 'unknown';
    }

    elsif (defined($result)) {
      if ($result->match(SOAP::SOM::envelope)) {

        my $val = $result->valueof('//return');

        # Negative return value here an error.
        #
        if ($val < 0) {
          my %err_msg = (
            '-1' => 'Specified IP address not found in Orb',
            '-2' => 'Mapping already exists for this IP, not forced',
            '-3' => 'Specified cdid not found in Orb',
            '-4' => 'Specified logical interface not found in Orb',
          );

          $ret_val{status} = ORBCMDB_WS_ERROR;
          $ret_val{error_msg} = $err_msg{$val} ||
            "Error returned by linkIPAddressToLogicalInterface call: '$val'";
        }
      }

      else {
        $ret_val{status} = ORBCMDB_SOAP_ERROR;
        $ret_val{error_msg} = "No SOAP envelope returned";
      }
    }

    else {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = "Unknown error";
    }
  }

  return \%ret_val;
}


sub unlink_ip_from_interface {
  my ($self, $ip, $interface_id) = @_;

  my %ret_val = ( status => ORBCMDB_OK );

  unless (AOL::IPUtils::valid_ip($ip)) {
    $ret_val{status} = ORBCMDB_INVALID_IP;
    $ret_val{error_msg} = sprintf("Specified IP '%s' is not valid", $ip);
    return \%ret_val;
  }

  unless (defined($interface_id) && $interface_id =~ /^\d+$/) {
    $ret_val{status} = ORBCMDB_INVALID_ELEMENT_ID;
    $ret_val{error_msg} = sprintf("Interface ID '%s' is missing or non-numeric",
      defined($interface_id) ? $interface_id : '');
    return \%ret_val;
  }

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));

  $soap_data->add_elem(name => 'cdid',
                       value => $self->{cdid});
  $soap_data->add_elem(name => 'ipAddress',
                       value => $ip);
  $soap_data->add_elem(name => 'interfaceId',
                       value => $interface_id);

  my $result;

  unless ($self->{dry_run}) {
    eval {
      $result = $self->{soap}->unlinkIPAddressToLogicalInterface($soap_data->to_soap_data);
    };

    if ($self->{soap_error}) {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = $self->{soap_error} || 'unknown';
    }

    elsif (defined($result)) {
      if ($result->match(SOAP::SOM::envelope)) {

        my $val = $result->valueof('//return');

        # Negative return value here an error.
        #
        if ($val < 0) {
          my %err_msg = (
            '-1' => 'Specified IP address not found in Orb',
            '-2' => 'Specified logical interface not found in Orb',
          );

          $ret_val{status} = ORBCMDB_WS_ERROR;
          $ret_val{error_msg} = $err_msg{$val} ||
            "Error returned by unlinkIPAddressToLogicalInterface call: '$val'";
        }
      }

      else {
        $ret_val{status} = ORBCMDB_SOAP_ERROR;
        $ret_val{error_msg} = "No SOAP envelope returned";
      }
    }

    else {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = "Unknown error";
    }
  }

  return \%ret_val;
}


sub link_switch_vlan_subnet {
  my ($self, $asset_tag, $subnet, $network_function) = @_;

  my %ret_val = ( status => ORBCMDB_OK );

# @@ validate asset_tag and network_function

  unless (AOL::IPUtils::valid_subnet($subnet)) {
    $ret_val{status} = ORBCMDB_INVALID_SUBNET;
    $ret_val{error_msg} =
      sprintf("Specified subnet '%s' is not valid", $subnet);
    return \%ret_val;
  }

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));

  $soap_data->add_elem(name => 'assetTag',
                       value => $asset_tag);
  $soap_data->add_elem(name => 'subnet',
                       value => $subnet);
  $soap_data->add_elem(name => 'networkFunction',
                       value => $network_function);

  my $result;

  unless ($self->{dry_run}) {
    eval {
      $result = $self->{soap}->createSwitchSubnetConfig($soap_data->to_soap_data);
    };

    if ($self->{soap_error}) {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = $self->{soap_error} || 'unknown';
    }

    elsif (defined($result)) {
      if ($result->match(SOAP::SOM::envelope)) {

        my $val = $result->valueof('//return');

        # Return value of 1 indicates success
        #
        if ($val != 1) {
          $ret_val{status} = ORBCMDB_WS_ERROR;
          $ret_val{error_msg} = 
            "Error returned by createSwitchSubnetConfig call: '$val'";
        }
      }

      else {
        $ret_val{status} = ORBCMDB_SOAP_ERROR;
        $ret_val{error_msg} = "No SOAP envelope returned";
      }
    }

    else {
      $ret_val{status} = ORBCMDB_SOAP_ERROR;
      $ret_val{error_msg} = "Unknown error";
    }
  }

  return \%ret_val;
}


1;

