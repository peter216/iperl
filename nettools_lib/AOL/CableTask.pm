############################################################################
# $Id$
#
# $Revision$
############################################################################

package AOL::CableTask;

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

our @EXPORT_OK = qw( submit

                     CABLETASK_OK
                     CABLETASK_MISSING_LICENSE_KEY
                     CABLETASK_FAIL
                     CABLETASK_SOAP_ERROR
                   );

use constant CABLETASK_OK                    => 0;
use constant CABLETASK_MISSING_LICENSE_KEY   => 1;
use constant CABLETASK_FAIL                  => 2;
use constant CABLETASK_SOAP_ERROR            => 3;

my $_DEFAULT_ENV = 'prod';

my %_ONTRACK_SERVICE_URI = (
  dev   => 'http://oasisws-dev.ops.aol.com:8100/ontrack/services/latest/SwitchInstallRequestService?wsdl',
  stage => 'http://oasisws-stage.ops.aol.com:8100/ontrack/services/latest/SwitchInstallRequestService?wsdl',
  prod  => 'http://ws.oasis.aol.com:8100/ontrack/services/latest/SwitchInstallRequestService?wsdl',
);

my $_ONTRACK_NS = 'http://services.ontrack.ws.oasis.aol.com/';


sub new {
  my ($class, %args) = @_;

  my $self = {};
  bless($self, $class);

  $self->{env} = $args{env} || $_DEFAULT_ENV;

  $self->{uri} = $args{uri} ||
    (defined($_ONTRACK_SERVICE_URI{$self->{env}}))
      ? $_ONTRACK_SERVICE_URI{$self->{env}}
      : $_ONTRACK_SERVICE_URI{$_DEFAULT_ENV};

  $self->{ns} = $args{ns} || $_ONTRACK_NS;

  $self->{license} = $args{license} || '';

  $self->{dry_run} = ($args{dry_run}) ? 1: 0;

  $self->{soap_error} = undef;
  $self->{soap_error_detail} = undef;

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


sub submit {
  my ($self, %params) = @_;

  my %ret_val = ( status => CABLETASK_OK );

  my $cdid = $params{cdid} || '';
  my $switch_name = $params{switch_name} || '';
  my $switch_ip   = $params{switch_ip} || '';
  my $switch_site = $params{switch_site} || '';
  my $switch_room = $params{switch_room} || '';
  my $switch_asset_tag = $params{switch_asset_tag} || '';
  my $port_speed = $params{port_speed} || '';
  my $media_type = $params{media_type} || '';
  my $upstream1_device = $params{upstream1_device} || '';
  my $upstream1_interface = $params{upstream1_interface} || '';
  my $upstream1_room = $params{upstream1_room} || '';
  my $upstream1_tile = $params{upstream1_tile} || '';
  my $upstream1_switch_port = $params{upstream1_switch_port} || '';
  my $upstream2_device = $params{upstream2_device} || '';
  my $upstream2_interface = $params{upstream2_interface} || '';
  my $upstream2_room = $params{upstream2_room} || '';
  my $upstream2_tile = $params{upstream2_tile} || '';
  my $upstream2_switch_port = $params{upstream2_switch_port} || '';

  # @ Do we need to validate the parameters before sending?

  unless ($self->{license}) {
    $ret_val{status} = CABLETASK_MISSING_LICENSE_KEY;
    $ret_val{error_msg} = "No webservice license key specified";
    return \%ret_val;
  }

  return \%ret_val if ($self->{dry_run});

  my $soap_data = SOAP::Data::Builder->new();
  $soap_data->add_elem(name   => 'licenseKey');
  $soap_data->add_elem(name   => 'license',
                       value  => $self->{license},
                       parent => $soap_data->get_elem('licenseKey'));
  $soap_data->add_elem(name => 'criteria');

  $soap_data->add_elem(name => 'mediaType',
                       value => $media_type,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'portSpeed',
                       value => $port_speed,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'requestorCdid',
                       value => $cdid,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'switchAssetTag',
                       value => $switch_asset_tag,
                       parent => $soap_data->get_elem('criteria'))
    if ($switch_asset_tag);
  $soap_data->add_elem(name => 'switchIp',
                       value => $switch_ip,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'switchName',
                       value => $switch_name,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'switchRoom',
                       value => $switch_room,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'switchSite',
                       value => $switch_site,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'ud1Room',
                       value => $upstream1_room,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'ud1SwitchPort',
                       value => $upstream1_switch_port,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'ud1TargetInterface',
                       value => $upstream1_interface,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'ud1Tile',
                       value => $upstream1_tile,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'ud2Room',
                       value => $upstream2_room,
                       parent => $soap_data->get_elem('criteria'))
    if ($upstream2_room);
  $soap_data->add_elem(name => 'ud2SwitchPort',
                       value => $upstream2_switch_port,
                       parent => $soap_data->get_elem('criteria'))
    if ($upstream2_switch_port);
  $soap_data->add_elem(name => 'ud2TargetInterface',
                       value => $upstream2_interface,
                       parent => $soap_data->get_elem('criteria'))
    if ($upstream2_interface);
  $soap_data->add_elem(name => 'ud2Tile',
                       value => $upstream2_tile,
                       parent => $soap_data->get_elem('criteria'))
    if ($upstream2_tile);
  $soap_data->add_elem(name => 'upstreamDevice1',
                       value => $upstream1_device,
                       parent => $soap_data->get_elem('criteria'));
  $soap_data->add_elem(name => 'upstreamDevice2',
                       value => $upstream2_device,
                       parent => $soap_data->get_elem('criteria'))
    if ($upstream2_device);

  my $result;

  eval {
    $result = $self->{soap}->createSwitchInstallRequest($soap_data->to_soap_data);
  };

  if ($self->{soap_error}) {
    $ret_val{status} = CABLETASK_SOAP_ERROR;
    $ret_val{error_msg} = $self->{soap_error} || 'unknown';
  }

  elsif (defined($result)) {
    if ($result->match(SOAP::SOM::envelope)) {

      my $response = $result->valueof('//return');

      # Response values are SUCCESS or FAIL without explanation.
      #
      if ($response ne 'SUCCESS') {
        $ret_val{status} = CABLETASK_FAIL;
        $ret_val{error_msg} = "Webservice responded with failure message.";
      }
    }

    else {
      $ret_val{status} = CABLETASK_SOAP_ERROR;
      $ret_val{error_msg} = "No SOAP envelope returned";
    }
  }

  else {
    $ret_val{status} = CABLETASK_SOAP_ERROR;
    $ret_val{error_msg} = "Unknown error";
  }

  return \%ret_val;
}


1;

