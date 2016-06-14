############################################################################
# $Id$
#
# $Revision$
############################################################################

package AOL::Hammer;

use strict;
use warnings;
use English qw( -no_match_vars );
use HTTP::Request;
use HTTP::Status;
use HTTP::Cookies;
use LWP::UserAgent;
use URI::Escape;

use JSON;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw( authenticate
                     get_lb_devices
                     get_ha_node_data
                     get_interface_data
                     get_sites_by_project_id
                     get_site
                     enable_vserver
                     disable_vserver
                     enable_application
                     disable_application
                     get_application_status
                     get_vserver_status
                     get_status
                     key
                     cdid

                     HAMMER_OK
                     HAMMER_NO_KEY
                     HAMMER_NO_CDID
                     HAMMER_API_ERROR
                     HAMMER_AUTH_FAIL
                     HAMMER_NO_SITE_SPECIFIED
                     HAMMER_NO_APPLICATION_SPECIFIED
                     HAMMER_INVALID_ACTION
                     HAMMER_FORBIDDEN
                     HAMMER_RESOURCE_DOES_NOT_EXIST
                     HAMMER_NO_PROJECT_ID_SPECIFIED
                     HAMMER_NO_DEVICE_SPECIFIED
                     HAMMER_NO_VSERVER_SPECIFIED
                     HAMMER_INVALID_TYPE
                     HAMMER_STATUS_UNKNOWN
                   );

use constant HAMMER_OK                       => 0;
use constant HAMMER_NO_KEY                   => 1;
use constant HAMMER_NO_CDID                  => 2;
use constant HAMMER_API_ERROR                => 3;
use constant HAMMER_AUTH_FAIL                => 4;
use constant HAMMER_NO_SITE_SPECIFIED        => 5;
use constant HAMMER_NO_APPLICATION_SPECIFIED => 6;
use constant HAMMER_INVALID_ACTION           => 7;
use constant HAMMER_FORBIDDEN                => 8;
use constant HAMMER_RESOURCE_DOES_NOT_EXIST  => 9;
use constant HAMMER_NO_PROJECT_ID_SPECIFIED  => 10;
use constant HAMMER_NO_DEVICE_SPECIFIED      => 11;
use constant HAMMER_NO_VSERVER_SPECIFIED     => 12;
use constant HAMMER_INVALID_TYPE             => 13;
use constant HAMMER_STATUS_UNKNOWN           => 14;

use constant _HAMMER_ENABLE  => 'enable';
use constant _HAMMER_DISABLE => 'disable';

use constant _HAMMER_APPLICATION => 'applications';
use constant _HAMMER_VSERVER     => 'vservers';

my $_DEFAULT_ENV = 'prod';

my %_HAMMER_API_URI = (
# @@ is there a dev version?
  dev  => 'https://nsadmin.iweb.aol.com/hammer/',
  prod => 'https://nsadmin.iweb.aol.com/hammer/',
);

# my $_DEFAULT_HAMMER_KEY = '08ad31ce-6675-4a98-8c2e-1e8be6cbeac4';
my $_DEFAULT_HAMMER_KEY = '0905a6b9-6f79-4b6f-a578-f19fba235f68';
my $_HAMMER_VERSION = 'v1';


sub new {
  my ($class, %args) = @_;

  my $self = {};
  bless($self, $class);

  $self->{env} = $args{env} || $_DEFAULT_ENV;

  $self->{uri} = $args{uri} ||
    (defined($_HAMMER_API_URI{$self->{env}}))
      ? $_HAMMER_API_URI{$self->{env}}
      : $_HAMMER_API_URI{$_DEFAULT_ENV};

  $self->{key} = $args{key} || $_DEFAULT_HAMMER_KEY;
  $self->{cdid} = $args{cdid} || '';
  $self->{version} = $args{version} || $_HAMMER_VERSION;

  # @@ if env is dev, maybe we want to set dry_run flag.
  $self->{dry_run} = ($args{dry_run}) ? 1: 0;
  $self->{error} = '';
  $self->{authenticated} = 0;

  $self->{cookie_jar} = HTTP::Cookies->new();

  return $self;
}


sub authenticate {
  my ($self) = @_;

  my %ret_val = ( status => HAMMER_OK );

  unless ($self->{key}) {
    $ret_val{status} = HAMMER_NO_KEY;
    $ret_val{error} = "No license key specified";
    return \%ret_val;
  }

  # @@ Could try to get the cdid from the kerb id of caller.
  unless ($self->{cdid}) {
    $ret_val{status} = HAMMER_NO_CDID;
    $ret_val{error} = "No user CDID specified";
    return \%ret_val;
  }

  my $auth_uri = $self->{uri} . $self->{version} . '/authenticate';

  my $auth_data = {
    tool_key => $self->{key},
    cdid     => $self->{cdid},
  };

  my $json = JSON->new();
  my $auth_json = $json->encode($auth_data);

  my $request = HTTP::Request->new(POST => $auth_uri);
  $request->header('Content-Type' => 'application/json');
  $request->content($auth_json);

  my $user_agent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
  my $response = $user_agent->request($request);

  if ($response->is_success()) {
    $self->{cookie_jar}->extract_cookies($response);
    $self->{authenticated} = 1;
  }
  else {
    $ret_val{status} = HAMMER_AUTH_FAIL;
    $ret_val{error} = "Authentication failure: " . $response->status_line;
    $self->{cookie_jar}->clear();
  }

  return \%ret_val;
}


sub get_lb_devices {
  my ($self) = @_;

  my %ret_val = ( status => HAMMER_OK );

  my $uri = $self->{uri} . $self->{version} . '/devices';
  my $request = HTTP::Request->new(GET => $uri);

  my $user_agent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
  my $response = $user_agent->request($request);

  if ($response->is_success()) {
    my $json = JSON->new();
    my $data = $json->decode($response->content);

    if ($data->{status} eq 'OK') {
      $ret_val{data} = $data->{response};
    }
    else {
      $ret_val{status} = HAMMER_API_ERROR;
      my $default_msg = "Error in API response: " . $data->{status} .
        ' - ' . $data->{message};
      $ret_val{error} = _set_error($response, $default_msg);
    }
  }
  else {
    $ret_val{status} = HAMMER_API_ERROR;
    my $default_msg = "Error in API call: " . $response->status_line;
    $ret_val{error} = _set_error($response, $default_msg);
  }

  return \%ret_val;
}


sub get_ha_node_data {
  my ($self, $node, $username, $password) = @_;

  my %ret_val = ( status => HAMMER_OK );

  $password = uri_escape($password);

  my $credentials = "$username:$password";
  my $query = 'config/hanode';
  my $uri = "https://$credentials\@$node/nitro/$self->{version}/$query";

  my $request = HTTP::Request->new(GET => $uri);

  my $user_agent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
  my $response = $user_agent->request($request);

  if ($response->is_success()) {
    my $json = JSON->new();
    my $data = $json->decode($response->content);

# @@ what if errorcode is not defined - is this an error?
    if (defined($data->{errorcode}) && $data->{errorcode} eq '0') {
      $ret_val{data} = $data->{hanode};
    }
    else {
      $ret_val{status} = HAMMER_API_ERROR;
      my $msg = "API error getting HA node data for device $node: " .
        $data->{errorcode};
      $msg .= ' - ' . $data->{message} if ($data->{message});
      $ret_val{error} = _set_error($response, $msg);
    }
  }
  else {
    $ret_val{status} = HAMMER_API_ERROR;
    my $msg = "HTTP error getting HA node data for device $node: " .
      $response->status_line;
    $ret_val{error} = _set_error($response, $msg);
  }

  return \%ret_val;
}


sub get_interface_data {
  my ($self, $node, $interface, $username, $password) = @_;

  my %ret_val = ( status => HAMMER_OK );

  $password = uri_escape($password);
  $interface = uri_escape($interface);

  my $credentials = "$username:$password";
  my $query = 'config/interface';
  $query .= "?filter=id:$interface" if ($interface);
  my $uri = "https://$credentials\@$node/nitro/$self->{version}/$query";

  my $request = HTTP::Request->new(GET => $uri);

  my $user_agent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
  my $response = $user_agent->request($request);

  if ($response->is_success()) {
    my $json = JSON->new();
    my $data = $json->decode($response->content);

# @@ what if errorcode is not defined - is this an error?
    if (defined($data->{errorcode}) && $data->{errorcode} eq '0') {
      $ret_val{data} = $data->{Interface};
    }
    else {
      $ret_val{status} = HAMMER_API_ERROR;
      my $msg = "API error getting HA interface data for device $node: " .
        $data->{errorcode};
      $msg .= ' - ' . $data->{message} if ($data->{message});
      $ret_val{error} = _set_error($response, $msg);
    }
  }
  else {
    $ret_val{status} = HAMMER_API_ERROR;
    my $msg = "HTTP error getting HA interface data for device $node: " .
      $response->status_line;
    $ret_val{error} = _set_error($response, $msg);
  }

  return \%ret_val;
}


sub get_sites_by_project_id {
  my ($self, $project_id) = @_;

  my %ret_val = ( status => HAMMER_OK );

  unless ($project_id) {
    $ret_val{status} = HAMMER_NO_PROJECT_ID_SPECIFIED;
    $ret_val{error} =
      "No Orb project_id specified for get_sites_by_project_id() call";
    return \%ret_val;
  }

  unless ($self->{authenticated}) {
    my $ret = $self->authenticate();
    return $ret unless ($ret->{status} == HAMMER_OK);
  }

  my $sites_uri = $self->{uri} . $self->{version} . '/search/projects?' .
    $project_id;
  my $request = HTTP::Request->new(GET => $sites_uri);

  my $user_agent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
  $user_agent->cookie_jar($self->{cookie_jar});
  my $response = $user_agent->request($request);

  if ($response->is_success()) {
    my $json = JSON->new();
    my $data = $json->decode($response->content);

    $ret_val{data} = $data->{response};
  }
  else {
    $ret_val{status} = HAMMER_API_ERROR;
    my $default_msg = "Error in API call: " . $response->status_line;
    $ret_val{error} = _set_error($response, $default_msg);
  }

  return \%ret_val;
}


sub get_site {
  my ($self, $site) = @_;

  my %ret_val = ( status => HAMMER_OK );

  unless ($site) {
    $ret_val{status} = HAMMER_NO_SITE_SPECIFIED;
    $ret_val{error} = "No site specified for get_site() call";
    return \%ret_val;
  }

  unless ($self->{authenticated}) {
    my $ret = $self->authenticate();
    return $ret unless ($ret->{status} == HAMMER_OK);
  }

  my $site_uri = $self->{uri} . $self->{version} . '/sites/' . $site;
  my $request = HTTP::Request->new(GET => $site_uri);

  my $user_agent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
  $user_agent->cookie_jar($self->{cookie_jar});
  my $response = $user_agent->request($request);

  if ($response->is_success()) {
    my $json = JSON->new();
    my $data = $json->decode($response->content);

    $ret_val{data} = $data->{response};
  }
  else {
    $ret_val{status} = HAMMER_API_ERROR;
    my $default_msg = "Error in API call: " . $response->status_line;
    $ret_val{error} = _set_error($response, $default_msg);
  }

  return \%ret_val;
}


sub enable_vserver {
  my ($self, $device, $vserver) = @_;

  return $self->enable_disable_vserver($device, $vserver, _HAMMER_ENABLE);
}


sub disable_vserver {
  my ($self, $device, $vserver) = @_;

  return $self->enable_disable_vserver($device, $vserver, _HAMMER_DISABLE);
}


sub enable_disable_vserver {
  my ($self, $device, $vserver, $action) = @_;

  my %ret_val = ( status => HAMMER_OK );

  unless ($action eq _HAMMER_ENABLE ||
          $action eq _HAMMER_DISABLE) {
    $ret_val{status} = HAMMER_INVALID_ACTION;
    $ret_val{error} = "Invalid action '$action' specified for enable_disable_vserver() call";
    return \%ret_val;
  }

  unless ($device) {
    $ret_val{status} = HAMMER_NO_DEVICE_SPECIFIED;
    $ret_val{error} = "No device specified for ${action}_vserver() call";
    return \%ret_val;
  }

  unless ($vserver) {
    $ret_val{status} = HAMMER_NO_VSERVER_SPECIFIED;
    $ret_val{error} = "No vserver specified for ${action}_vserver() call";
    return \%ret_val;
  }

  unless ($self->{authenticated}) {
    my $ret = $self->authenticate();
    return $ret unless ($ret->{status} == HAMMER_OK);
  }

  my $able_uri = $self->{uri} . $self->{version} . '/devices/' . $device .
    '/vservers/' . $vserver . "/$action";
  $able_uri .= '?dry_run=true' if ($self->{dry_run});
  my $request = HTTP::Request->new(POST => $able_uri);

  my $user_agent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
  $user_agent->cookie_jar($self->{cookie_jar});
  my $response = $user_agent->request($request);

  if ($response->is_success()) {
    my $json = JSON->new();
    my $data = $json->decode($response->content);

    $ret_val{data} = $data->{response};
  }

  elsif ($response->code() eq RC_FORBIDDEN) {
    $ret_val{status} = HAMMER_FORBIDDEN;
    my $default_msg = "Specified state change not allowed";
    $ret_val{error} = _set_error($response, $default_msg);
  }

  elsif ($response->code() eq RC_NOT_FOUND) {
    $ret_val{status} = HAMMER_RESOURCE_DOES_NOT_EXIST;
    my $default_msg = "Specified device ($device) or vserver " .
        "($vserver) does not exist.";
    $ret_val{error} = _set_error($response, $default_msg);
  }

  else {
    $ret_val{status} = HAMMER_API_ERROR;
    my $default_msg = "Error in API call: " . $response->status_line;
    $ret_val{error} = _set_error($response, $default_msg);
  }

  return \%ret_val;
}


sub enable_application {
  my ($self, $site, $application) = @_;

  return $self->enable_disable_application($site, $application,
    _HAMMER_ENABLE);
}


sub disable_application {
  my ($self, $site, $application) = @_;

  return $self->enable_disable_application($site, $application,
    _HAMMER_DISABLE);
}


sub enable_disable_application {
  my ($self, $site, $application, $action) = @_;

  my %ret_val = ( status => HAMMER_OK );

  unless ($action eq _HAMMER_ENABLE ||
          $action eq _HAMMER_DISABLE) {
    $ret_val{status} = HAMMER_INVALID_ACTION;
    $ret_val{error} = "Invalid action '$action' specified for enable_disable_application() call";
    return \%ret_val;
  }

  unless ($site) {
    $ret_val{status} = HAMMER_NO_SITE_SPECIFIED;
    $ret_val{error} = "No site specified for ${action}_application() call";
    return \%ret_val;
  }

  unless ($application) {
    $ret_val{status} = HAMMER_NO_APPLICATION_SPECIFIED;
    $ret_val{error} = "No application specified for ${action}_application() call";
    return \%ret_val;
  }

  unless ($self->{authenticated}) {
    my $ret = $self->authenticate();
    return $ret unless ($ret->{status} == HAMMER_OK);
  }

  my $able_uri = $self->{uri} . $self->{version} . '/sites/' . $site .
    '/applications/' . $application . "/$action";
  $able_uri .= '?dry_run=true' if ($self->{dry_run});
  my $request = HTTP::Request->new(POST => $able_uri);

  my $user_agent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
  $user_agent->cookie_jar($self->{cookie_jar});
  my $response = $user_agent->request($request);

  if ($response->is_success()) {
    my $json = JSON->new();
    my $data = $json->decode($response->content);

    $ret_val{data} = $data->{response};
  }

  elsif ($response->code() eq RC_FORBIDDEN) {
    $ret_val{status} = HAMMER_FORBIDDEN;
    my $default_msg = "Specified state change not allowed";
    $ret_val{error} = _set_error($response, $default_msg);
  }

  elsif ($response->code() eq RC_NOT_FOUND) {
    $ret_val{status} = HAMMER_RESOURCE_DOES_NOT_EXIST;
    my $default_msg = "Specified site ($site) or application " .
      "($application) does not exist.";
    $ret_val{error} = _set_error($response, $default_msg);
  }

  else {
    $ret_val{status} = HAMMER_API_ERROR;
    my $default_msg = "Error in API call: " . $response->status_line;
    $ret_val{error} = _set_error($response, $default_msg);
  }

  return \%ret_val;
}


sub get_application_status {
  my ($self, $site, $application) = @_;

  return $self->get_status(_HAMMER_APPLICATION, $site, $application);
}


sub get_vserver_status {
  my ($self, $site, $vserver) = @_;

  return $self->get_status(_HAMMER_VSERVER, $site, $vserver);
}


# @@ Should we also support this call?
# @@ https://nsadmin.iweb.aol.com/hammer/v1/sites/spiders-test/status/vservers?applications

sub get_status {
  my ($self, $type, $site, $entity) = @_;

  my %ret_val = ( status => HAMMER_OK );

  if ($type ne _HAMMER_APPLICATION && $type ne _HAMMER_VSERVER) {
    $ret_val{status} = HAMMER_INVALID_TYPE;
    $ret_val{error} = "Type of '$type' is not valid in get_status() call";
    return \%ret_val;
  }

  unless ($site) {
    $ret_val{status} = HAMMER_NO_SITE_SPECIFIED;
    $ret_val{error} = "No site specified for get_${type}_status() call";
    return \%ret_val;
  }

  unless ($entity) {
    $ret_val{status} = ($type eq _HAMMER_APPLICATION) ?
      HAMMER_NO_APPLICATION_SPECIFIED : HAMMER_NO_VSERVER_SPECIFIED;
    $ret_val{error} = "No $type specified for get_${type}_status() call";
    return \%ret_val;
  }

  unless ($self->{authenticated}) {
    my $ret = $self->authenticate();
    return $ret unless ($ret->{status} == HAMMER_OK);
  }

  my $status_uri = $self->{uri} . $self->{version} . '/sites/' . $site .
    "/status/$type";
  my $request = HTTP::Request->new(GET => $status_uri);

  my $user_agent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
  $user_agent->cookie_jar($self->{cookie_jar});
  my $response = $user_agent->request($request);

  if ($response->is_success()) {
    my $json = JSON->new();
    my $data = $json->decode($response->content);

    $ret_val{data} = $data->{response}{$entity}{devices}[0]{enabled};

    unless($ret_val{data}) {
      $ret_val{status} = HAMMER_STATUS_UNKNOWN;
      $ret_val{error} = "No status found for $type ($entity) in site ($site).";
    }
  }

  elsif ($response->code() eq RC_NOT_FOUND) {
    $ret_val{status} = HAMMER_RESOURCE_DOES_NOT_EXIST;
    my $default_msg = "Specified site ($site) or $type ($entity) does " .
      "not exist.";
    $ret_val{error} = _set_error($response, $default_msg);
  }

  else {
    $ret_val{status} = HAMMER_API_ERROR;
    my $default_msg = "Error in API call: " . $response->status_line;
    $ret_val{error} = _set_error($response, $default_msg);
  }

  return \%ret_val;
}


sub key {
  my ($self, $key) = @_;

  return $self->{key} unless (defined($key));

  $self->{key} = $key;
  $self->{cookie_jar}->clear();
  return $self->{key};
}


sub cdid {
  my ($self, $cdid) = @_;

  return $self->{cdid} unless (defined($cdid));

  $self->{cdid} = $cdid;
  $self->{cookie_jar}->clear();
  return $self->{cdid};
}


sub _set_error {
  my ($response, $default_msg) = @_;

  if ($response->content) {
    my $data;
    my $json = JSON->new();

    eval {
      $data = $json->decode($response->content);
    };

    if (! $@ && $data->{message}) {
      return $data->{message};
    }
  }

  return $default_msg;
}


1;

