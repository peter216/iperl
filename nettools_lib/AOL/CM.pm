package AOL::CM;

use strict;
use warnings;

use English qw( -no_match_vars );
use Time::Local;
use Data::Dumper;

use REST::Client;
use JSON;

use MIME::Base64;

use AOL::UserInfo;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT = qw( create_ticket
                  get_ticket
                  update_ticket
                  log_error_in_ticket
                  close_ticket
                );

my $_DEFAULT_SERVICENOW_USER = 'neocm';
my $_DEFAULT_SERVICENOW_PASS = 'neocm';

my $_DEFAULT_DEV_PROXY = 'https://aoldev.service-now.com';
my $_DEFAULT_PROD_PROXY = 'https://aol.service-now.com';

my $_DEFAULT_DURATION = '1h';
my $_DEFAULT_RISK = 'Low';

sub new {
  my ($class, %args) = @_;

  my $self = {};
  bless($self, $class);

  $self->{servicenow_user} = $args{servicenow_user} || $_DEFAULT_SERVICENOW_USER;
  $self->{servicenow_pass} = $args{servicenow_pass} || $_DEFAULT_SERVICENOW_PASS;

  if ($args{proxy}) {
    $self->{proxy} = $args{proxy};
  }
  elsif ($args{dev}) {
    $self->{proxy} = $_DEFAULT_DEV_PROXY;
  }
  else {
    $self->{proxy} = $_DEFAULT_PROD_PROXY;
  }

  $self->{rest_error} = '';

  $self->{servicenow_rest} = REST::Client->new(
    host => $self->{proxy}
  );

  $self->{dry_run} = ($args{dry_run}) ? 1: 0;

  $self->{encoded_auth} = encode_base64("$self->{servicenow_user}:$self->{servicenow_pass}", '');

  return $self;
}


sub create_ticket {
  my ($self, %args) = @_;

# args notes:
#   template - atdn_prefix_builder, dcnets_new_prod_switch, 
#     dcnets_new_rilo_switch, dcnets_new_vlan_router, 
#     dcnets_new_vlan_switch, or dcnets_vlan_port_move,
#     atdn_web_tools
#   oncall_level - primary, secondary, escalation (associated with 'team' arg)

  my %fields = (
    short_desc =>
      { default => '', load => 1, required => 1 },
    install_steps =>
      { default => '', load => 1, required => 0 },
    assignment_group =>
      { default => '', load => 0, required => 0 },
    risk_description =>
      { default => '', load => 0, required => 0 },
    status =>
      { default => '', load => 0, required => 0 },
    change_category =>
      { default => '', load => 0, required => 0 },
    change_description =>
      { default => '', load => 0, required => 0 },
    change_comments =>
      { default => '', load => 0, required => 0 },
    backout_plan =>
      { default => '', load => 0, required => 0 },
    notes =>
      { default => '', load => 0, required => 0 },
    device_list =>
      { default => '', load => 0, required => 0 },
    start_time =>
      { default => '', load => 0, required => 0 },
    end_time =>
      { default => '', load => 0, required => 0 },
    duration =>
      { default => $_DEFAULT_DURATION, load => 0, required => 0 },
    template =>
      { default => 0, load => 0, required => 1 },
    cdid =>
      { default => '', load => 0, required => 1 },
    username =>
      { default => '', load => 0, required => 0 },
    email =>
      { default => '', load => 0, required => 0 },
    team =>
      { default => '', load => 0, required => 0 },
    secondary =>
      { default => '', load => 0, required => 0 },
  );

  # Check for user entered fields that are invalid.
  #
  foreach my $field (keys(%args)) {
    unless (defined($fields{$field})) {
      print "create_ticket: argument '$field' not valid.\n";
    }
  }

  my %values = ();

  # Set default values
  #
  foreach my $field (keys(%fields)) {
    $values{$field} = $fields{$field}{default}
      if (defined($fields{$field}{default}));
  }

  # device_list needs to end up as a newline separated list
  #
  $values{device_list} =
    $self->_format_device_list($args{device_list} || 'None');

  if ($args{template}) {

    if ($args{template} eq 'atdn_prefix_builder') {

      my $cdid = $args{cdid} || '';
      my $team = $args{secondary} || 'ATDNCN';

      ($values{cdid}, $values{username}) =
        $self->_get_user_data(
          $cdid,
          $team,
          $args{oncall_level} || 'primary',
          $args{username});

      $values{short_desc} = 'Daily BGP Prefix Updates';
      $values{change_description} = 'Router: BGP Change';
      $values{change_description} .= "\n" . $values{device_list};
      $values{install_steps} = $args{install_steps};      

      $values{status} = ($args{express}) ? 'Closed' : 'Approved';

      $values{change_comments} =
        'Email confirmation of changes sent to Installation Team';
      $values{backout_plan} = 'Error report sent to Installation Team ' .
        'for manual backout or ticket completion'; 

      $values{risk} = $_DEFAULT_RISK;
      $values{change_category} = 'Network';
      $values{type} = 'Scheduled';
      $values{assignment_group} = 'NOC Network Support';

      $values{template} = 1;
    }

    elsif ($args{template} eq 'dcnets_new_prod_switch' ||
           $args{template} eq 'dcnets_new_vlan_router') {
      # Set user to dcnets primary oncall unless otherwise specified.
      #
      ($values{cdid}, $values{username}) =
        $self->_get_user_data(
          $args{cdid},
          $args{team} || 'dcnets',
          $args{oncall_level} || 'primary',
          $args{username});

      if ($args{template} eq 'dcnets_new_prod_switch') {
        $values{short_desc} = 'Router interface configuration for new switch';
      }
      elsif ($args{template} eq 'dcnets_new_vlan_router') {
        $values{short_desc} =
          'Router interface configuration for new switch vlan';
      }
      $values{change_description} = "Router Interface Changes\n" . 
                                    $values{device_list};
      $values{install_steps}      = $args{short_desc} || $values{short_desc};
      $values{install_steps}     .= "\n" . $values{device_list};
      $values{status}             = 'Closed';
      $values{risk}               = $_DEFAULT_RISK;
      $values{change_category}    = 'Network';
      $values{type}               = 'Scheduled';
      $values{assignment_group}   = 'NOC Network Support';

      $values{template} = 1;
    }

    elsif ($args{template} eq 'dcnets_switch_decom' ||
           $args{template} eq 'dcnets_switch_decom_router') {
      # Set user to dcnets primary oncall unless otherwise specified.
      #
      ($values{cdid}, $values{username}) =
        $self->_get_user_data(
          $args{cdid},
          $args{team} || 'dcnets',
          $args{oncall_level} || 'primary',
          $args{username});

      if ($args{template} eq 'dcnets_switch_decom') {
        $values{short_desc}         = 'Clear switch configuration for switch decom';
        $values{change_description} = 'Switch Configuration Changes';
      }
      elsif ($args{template} eq 'dcnets_switch_decom_router') {
        $values{short_desc} =
          'Clear router interface configuration for switch decom';
        $values{change_description} = 'Router Interface Changes';
      }
      $values{change_description} .= "\n" . $values{device_list};
      $values{install_steps}       = $args{short_desc} || $values{short_desc};
      $values{install_steps}      .= "\n" . $values{device_list};
      $values{status}              = 'Closed';
      $values{risk}                = $_DEFAULT_RISK;
      $values{change_category}     = 'Network';
      $values{type}                = 'Scheduled';
      $values{assignment_group}    = 'NOC Network Support';
      
      $values{template} = 1;
    }

    elsif ($args{template} eq 'dcnets_new_rilo_switch' ||
           $args{template} eq 'dcnets_new_vlan_switch' ||
           $args{template} eq 'dcnets_vlan_port_move' ||
           $args{template} eq 'dcnets_switch_move' ||
           $args{template} eq 'dcnets_aggregation_switch') {
      # Set user to dcnets primary oncall unless otherwise specified.
      #
      ($values{cdid}, $values{username}) =
        $self->_get_user_data(
          $args{cdid},
          $args{team} || 'dcnets',
          $args{oncall_level} || 'primary',
          $args{username});

      if ($args{short_desc}) {
        $values{short_desc} = $args{short_desc};
      }
      else {
        if ($args{template} eq 'dcnets_new_rilo_switch') {
          $values{short_desc} = 'Hub interface description for new rilo switch';
        }
        elsif ($args{template} eq 'dcnets_new_vlan_switch') {
          $values{short_desc} = 'Switch configuration for new vlan';
        }
        elsif ($args{template} eq 'dcnets_vlan_port_move') {
          $values{short_desc} = 'Switch configuration for vlan port moves';
        }
        elsif ($args{template} eq 'dcnets_switch_move') {
          $values{short_desc} = 'Switch configuration changes for switch move';
        }
        elsif ($args{template} eq 'dcnets_aggregation_switch') {
          $values{short_desc} = 'Aggregation switch changes for switch move';
        }
      }
      $values{change_description} = "Switch Configuration Changes\n" .
                                    $values{device_list};
      $values{install_steps}      = $args{short_desc} || $values{short_desc};
      $values{install_steps}     .= "\n" . $values{device_list};
      $values{status}             = 'Closed';
      $values{risk}               = $_DEFAULT_RISK;
      $values{change_category}    = 'Network';
      $values{type}               = 'Scheduled';
      $values{assignment_group}   = 'NOC Network Support';

      $values{template} = 1;
    }
    
    elsif ($args{template} eq 'atdn_web_tools') {

      ($values{cdid}, $values{username}) =
        $self->_get_user_data(
          $args{cdid},
          $args{team} || 'ATDNCN',
          $args{oncall_level} || 'primary',
          $args{username});

      $values{assignment_group}   = 'NOC Network Support';
      $values{install_steps}      = $args{install_steps};
      $values{change_description} = $args{reason_for_maint} || 'Circuit maintenance';
      $values{short_desc}         = $args{short_desc};
      $values{device_list}        = $args{device_list};
      $values{status}             = 'Approved';
      $values{backout_plan}       = 'Escalate to Network TAC';
      $values{risk}               = $_DEFAULT_RISK;
      $values{change_category}    = 'Network';
      $values{type}               = 'Scheduled';
  
      $values{template} = 1;
    }
  }

  unless ($values{template}) {
    ($values{cdid}, $values{username}) =
      $self->_get_user_data($args{cdid}, $args{team}, $args{oncall_level},
        $args{username});
  }



  # Get start time - from argument or 'now'
  #
  $values{start_time} = $self->_get_time($args{start_time} || 'now');

  unless ($values{start_time}) {
    my @err_ret = (0, "Specified start time '$args{start_time}' unparsable");
    return (wantarray()) ? @err_ret : \@err_ret;
  }

  # Get end time - from argument, from start plus duration, or start
  # plus default duration.
  #
  if ($args{end_time}) {
    $values{end_time} = $self->_get_time($args{end_time});
  }
  elsif ($args{duration}) {
    $values{end_time} = $self->_get_time($values{start_time}, $args{duration});
  }
  else {
    $values{end_time} = $self->_get_time($values{start_time},
      $_DEFAULT_DURATION);
  }

  unless ($values{end_time}) {
    my @err_ret = (0, "Indicator of end time, end_time: '$args{end_time}' " .
                      "or duration: '$args{duration}', unparsable");
    return (wantarray()) ? @err_ret : \@err_ret;
  }

  $values{start_time} = $self->_format_date($values{start_time});
  $values{end_time} = $self->_format_date($values{end_time});

  # Set other fields as indicated in user parameters and escape
  # any strings that need it.
  #
  foreach my $field (keys(%fields)) {
    $values{$field} = $args{$field}
      if (defined($args{$field}) && $fields{$field}{load});
  }

  #
  # In cases where cdid is not set,
  # use neocm as the cdid.
  #
  $values{cdid} = $_DEFAULT_SERVICENOW_USER unless ($values{cdid});

  # Check for required fields
  #
  foreach my $field (keys(%fields)) {
    if ($fields{$field}{required} && ! $values{$field}) {
      my @err_ret = (0, "No valid $field specified");
      return (wantarray()) ? @err_ret : \@err_ret;
    }
  }

  my %data = (
    'assignment_group'     => $values{assignment_group},
    'backout_plan'         => $values{backout_plan},
    'change_plan'          => $values{install_steps},
    'u_risk_description'   => 'None expected',
    'start_date'           => $values{start_time},
    'end_date'             => $values{end_time},
    'risk'                 => $values{risk},
    'category'             => $values{change_category},
    'u_change_description' => $values{change_description},
    'u_change_comments'    => $values{change_comments},
    'requested_by'         => $values{cdid},
    'opened_by'            => $values{cdid},
    'short_description'    => $values{short_desc},
    'state'                => $values{status},
    'type'                 => $values{type},
  );

  my $success = 0;
  my $ticket_number = 0;
  my $reason = '';

  if ($self->{dry_run}) {
    $success = 1;
    $ticket_number = 111111;
  }

  else {
    my $cm_result;
    my $response_code;

    if ($self->{servicenow_rest}) {
      $self->{servicenow_rest}->POST('/api/now/table/change_request',
                                     encode_json(\%data),
                                     {'Authorization' => "Basic $self->{encoded_auth}",
                                      'Content-Type' => 'application/json',
                                      'Accept' => 'application/json'});

      $response_code = $self->{servicenow_rest}->responseCode();
      
      if ($response_code >= 500) {
        $reason = $self->{servicenow_rest}->responseContent();
      }
      
      else {

        $cm_result = decode_json($self->{servicenow_rest}->responseContent());

        if ($response_code != 201) {
        
          if ($cm_result->{'status'} eq 'failure') {
            my $rest_error = $cm_result->{'error'}->{'message'} || '';
            my $rest_error_detail = '';
            my $detail = $cm_result->{'error'}->{'detail'};

            if ($detail) {
              $rest_error_detail = $detail || '';
            }

            $reason = "$rest_error\n$rest_error_detail";
          }
          else {
            $reason = "Unknown error. No error message obtained for failure.\n";
          }
        }

        else {
          my $incident_details = $cm_result->{'result'};

          if ($incident_details->{'number'}) {
            $ticket_number = $incident_details->{'number'};
            $success = 1;
          }
          else {
            $reason = 'ServiceNow request failed to return a ticket number';
          }
        }
      }
    }

    else {
      $reason = "Connection Error. Could not establish connection to Service Now server\n";
    }
  }
  
  my @ret = ($success, ($success) ? $ticket_number : $reason);
  return (wantarray()) ? @ret : \@ret;
}


sub get_ticket {
  my ($self, $ticket) = @_;

  my $ticket_number = $self->_normalize_ticket_number($ticket);

  unless (defined($ticket_number)) {
    my @err_ret = (0, "Specified ticket number invalid '$ticket'");
    return (wantarray()) ? @err_ret : \@err_ret;
  }


  my $cm_result;
  my $success = 0;
  my $reason = '';
  my $cm_ticket = undef;
  my $response_code;

  if ($self->{servicenow_rest}) {
    $self->{servicenow_rest}->GET("/api/now/table/change_request?" .
                                  "sysparm_query=number=$ticket_number",
                                     {'Authorization' => "Basic $self->{encoded_auth}",
                                      'Accept' => 'application/json'});

    $response_code = $self->{servicenow_rest}->responseCode();

    if ($response_code >= 500) {
      $reason = $self->{servicenow_rest}->responseContent();
    }

    else {

      $cm_result = decode_json($self->{servicenow_rest}->responseContent());

      if ($response_code != 200) {

        if ($cm_result->{'status'} eq 'failure') {
          my $rest_error = $cm_result->{'error'}->{'message'} || '';
          my $rest_error_detail = '';
          my $detail = $cm_result->{'error'}->{'detail'};

          if ($detail) {
            $rest_error_detail = $detail || '';
          }

          $reason = "$rest_error\n$rest_error_detail";
        }
        else {
          $reason = "Unknown error. No error message obtained for failure.\n";
        }
      }

      else {
        $cm_ticket = $cm_result->{'result'}->[0];
        $success   = 1;
      }
    }
  }

  else {
    $reason = "Connection Error. Could not establish connection to Service Now server\n";
  }

  my @ret = ($success, ($success) ? $cm_ticket : $reason);
  return (wantarray()) ? @ret : \@ret;
}


sub update_ticket {
  my ($self, %args) = @_;

# args are
#    ticket_number
#    device_list
#    device_list_append
#    install_steps
#    install_steps_append
#    short_desc
#    short_desc_append
#    start_time  (planned)
#    end_time  (planned)
#    duration
#    cdid
#    username


  my $ticket_number = $args{ticket_number};

  my ($get_success, $ticket) = $self->get_ticket($ticket_number);

  unless ($get_success) {
    my @err_ret = (0, "Could not retrieve CM ticket '$ticket_number':\n" .
                      $ticket);
    return (wantarray()) ? @err_ret : \@err_ret;
  }

  my $ticket_sys_id = $ticket->{'sys_id'};

  my $device_list = '';
  if ($args{device_list}) {
    $device_list = $self->_format_device_list($args{device_list}) || '';
  }
  else {
    if ($args{device_list_append}) {
      $device_list = $self->_format_device_list($args{device_list_append});
    }
  }


  my $short_desc = undef;
  if ($args{short_desc}) {
    $short_desc = $args{short_desc};
  }
  else {
    if ($args{short_desc_append}) {
      chomp($ticket->{short_description});
      $short_desc = $ticket->{short_description} . " - " .
                    $args{short_desc_append};
    }
  }

  my $install_steps = undef;
  if ($args{install_steps}) {
    $install_steps = $args{install_steps} . "\n" . $device_list;
  }
  else {
    if ($args{install_steps_append}) {
      $install_steps = $ticket->{change_plan} . "\n" .
                       $args{install_steps_append} . "\n" . $device_list;
    }
  }

  my $start_dt;
  my $start_time;
  my $end_dt;
  my $end_time;
  if ($args{start_time}) {
    $start_time = $self->_get_time($args{start_time});

    unless ($start_time) {
      my @err_ret = (0, "Specified start time '$args{start_time}' unparsable");
      return (wantarray()) ? @err_ret : \@err_ret;
    }

    $start_dt = $self->_format_date($start_time);
    
    if ($args{duration}) {
      $end_time = $self->_get_time($start_time, $args{duration});
     
      unless ($end_time) {
        my @err_ret = (0, "Indicator of end time, end_time: '$args{end_time}' " .
                        "or duration: '$args{duration}', unparsable");
        return (wantarray()) ? @err_ret : \@err_ret;
      }
      $end_dt = $self->_format_date($end_time);
    }
  }

  if ($args{end_time}) {

    $end_time = $self->_get_time($args{end_time});

    unless ($end_time) {
      my @err_ret = (0, "Indicator of end time, end_time: '$args{end_time}' " .
                        "or duration: '$args{duration}', unparsable");
      return (wantarray()) ? @err_ret : \@err_ret;
    }

    $end_dt = $self->_format_date($end_time);
  }

  my $new_requestor = $args{cdid} if $args{cdid};

  my $change_description = $ticket->{'u_change_description'};

  $change_description .= "\n" . $device_list;


  my %data = ();

  $data{'u_change_description'} = $change_description if ($change_description);
  $data{'change_plan'}          = $install_steps if ($install_steps);
  $data{'requested_by'}         = $new_requestor if ($new_requestor);
  $data{'short_description'}    = $short_desc if ($short_desc);
  $data{'end_date'}             = $end_dt if (defined($end_dt));
  $data{'start_date'}           = $start_dt if (defined($start_dt));
  $data{'risk'}                 = $_DEFAULT_RISK;
  $data{'sys_id'}               = $ticket_sys_id;

  return $self->_do_update(\%data);
}


sub log_error_in_ticket {
  my ($self, %args) = @_;

# args are
#   ticket_number
#   error_text

  unless (defined($args{ticket_number}) && $args{ticket_number}) {
    my @err_ret = (0, "Ticket number required in call to log_error_in_ticket");
    return (wantarray()) ? @err_ret : \@err_ret;
  }

  unless (defined($args{error_text}) && $args{error_text}) {
    my @err_ret = (0, "Error text required in call to log_error_in_ticket");
    return (wantarray()) ? @err_ret : \@err_ret;
  }

  my $ticket_number = $args{ticket_number};

  my ($get_success, $ticket) = $self->get_ticket($ticket_number);

  unless ($get_success) {
    my @err_ret = (0, "Could not retrieve CM ticket '$ticket_number':\n" .
                      $ticket);
    return (wantarray()) ? @err_ret : \@err_ret;
  }

  my $ticket_sys_id = $ticket->{'sys_id'};

  my $error_text = $args{error_text};

  my %data = ();
  
  $data{'u_change_comments'} = $error_text;
  $data{'risk'}              = $_DEFAULT_RISK;
  $data{'sys_id'}            = $ticket_sys_id;

  return $self->_do_update(\%data);
}


sub close_ticket {
  my ($self, %args) = @_;

# args are
#   ticket_number
#   cancel        # optional
#   cancel_reason # optional

  my $ticket_number = $args{ticket_number} || '';

  my ($get_success, $ticket) = $self->get_ticket($ticket_number);

  unless ($get_success) {
    my @err_ret = (0, "Could not retrieve CM ticket '$ticket_number':\n" .
                      $ticket);
    return (wantarray()) ? @err_ret : \@err_ret;
  }

  my $ticket_sys_id = $ticket->{'sys_id'};

  # Return an error if the ticket is already closed
  if ($ticket->{state} =~ /(Canceled|Rejected|Complete)/) {
    my @err_ret = (0, "Ticket '$ticket_number' is already closed - " .
                      "status = '$ticket->{Status}");
    return (wantarray()) ? @err_ret : \@err_ret;
  }

  my $canceled = $args{cancel} || 0;

  my $success = '';
  my $state = '';
  my $cancel_reason = '';
  my $end_dt;

  if ($canceled) {
    $state = 'Canceled';
    $cancel_reason = $args{cancel_reason} ||
      'No changes required, no changes made';
  }
  else {
    $state = 'Closed';
  }

  if ($args{end_time}) {

    my $end_time = $self->_get_time($args{end_time});

    unless ($end_time) {
      my @err_ret = (0, "Indicator of end time, end_time: '$args{end_time}' " .
                        "or duration: '$args{duration}', unparsable");
      return (wantarray()) ? @err_ret : \@err_ret;
    }

    $end_dt = $self->_format_date($end_time);
  }

  my %data = ();

  $data{'u_change_comments'} = $cancel_reason if ($cancel_reason);
  $data{'state'}  = $state;
  $data{'risk'}   = $_DEFAULT_RISK;
  $data{'end_date'} = $end_dt if (defined($end_dt));
  $data{'sys_id'} = $ticket->{'sys_id'};

  return $self->_do_update(\%data);
}


sub _do_update {
  my ($self, $data) = @_;

  my $success = 0;
  my $reason = '';

  my $sys_id = $data->{'sys_id'};

  delete $data->{'sys_id'};

  unless ($self->{dry_run}) {
    my $cm_result;
    my $response_code;

    if ($self->{servicenow_rest}) {
      $self->{servicenow_rest}->PUT("/api/now/table/change_request/$sys_id",
                                     encode_json(\%$data),
                                     {'Authorization' => "Basic $self->{encoded_auth}",
                                      'Content-Type' => 'application/json',
                                      'Accept' => 'application/json'});

      $response_code = $self->{servicenow_rest}->responseCode();

      if ($response_code >= 500) {
        $reason = $self->{servicenow_rest}->responseContent();
      }

      else {

        $cm_result = decode_json($self->{servicenow_rest}->responseContent());

        if ($response_code != 200) {

          if ($cm_result->{'status'} eq 'failure') {
            my $rest_error = $cm_result->{'error'}->{'message'} || '';
            my $rest_error_detail = '';
            my $detail = $cm_result->{'error'}->{'detail'};

            if ($detail) {
              $rest_error_detail = $detail || '';
            }

            $reason = "$rest_error\n$rest_error_detail";
          }
          else {
            $reason = "Unknown error. No error message obtained for failure.\n";
          }
        }

        else {
          $success = 1;
        }
      }
    }

    else {
      $reason = "Connection Error. Could not establish connection to Service Now server\n";
    }
  }

  my @ret = ($success, $reason);
  return (wantarray()) ? @ret : \@ret;
}


sub _get_time {
  my ($self, $time_str, $duration_str) = @_;

  my %seconds_in = ( 's' => 1,
                     'm' => 60,
                     'h' => 3600,
                     'd' => 86400,
                     'w' => 5184000,
                   );

  my $utc = undef;

  if ($time_str) {
    $utc = $self->_parse_time($time_str);
  }
  else {
    $utc = time();
  }

  if ($duration_str) {
    my $duration = 0;

    if ($duration_str =~ /^\s*(\d+)\s*(w|d|h|m|s)?\s*$/i) {
      $duration = $1 * $seconds_in{lc($2)};
    }
    else {
      # Duration parse error
      return undef;
    }

    $utc += $duration if (defined($utc));
  }

  return $utc;
}


sub _parse_time {
  my ($self, $tm) = @_;

  my $year;
  my $mon;
  my $day;
  my $hour;
  my $min;
  my $sec = 0;

  $tm =~ s/^\s+//;
  $tm =~ s/\s+$//;

  # If not TOE assumes eastern time
  # Assumes 24 clock
  if ($tm =~ /^\d+$/) {
    return $tm;
  }

  elsif ($tm eq 'now') {
    return time();
  }

  elsif ($tm =~ /^(\d{4})-(\d{1,2})-(\d{1,2})\s+(\d{1,2}):(\d{2})(:\d{2})?$/) {
    $year = $1 - 1900;
    $mon = $2 - 1;
    $day = $3;
    $hour = $4;
    $min = $5;
  }

  elsif ($tm =~ /^(\d{4})-(\d{1,2})-(\d{1,2})\s+(\d{1,2}):(\d{2})(:\d{2})?-(\d{1,2}):(\d{2}):(\d{2})$/) {
    $year = $1 - 1900;
    $mon = $2 - 1;
    $day = $3;
    $hour = $4;
    $min = $5;
  }

  elsif ($tm =~ /^(\d{1,2})\/(\d{1,2})\/(\d{4})\s+(\d{1,2}):(\d{2})(:\d{2})?$/) {
    $mon = $1 - 1;
    $day = $2;
    $year = $3 - 1900;
    $hour = $4;
    $min = $5;
  }

  else {
    return undef;
  }

  return timelocal($sec, $min, $hour, $day, $mon, $year);
}


sub _format_date {
  my ($self, $tm) = @_;

  my $formatted_date = '';

  if ($tm) {
    my ($sec, $min, $hr, $mday, $mon, $y, $wday, $yday, $isdst) =
      localtime($tm);
    $formatted_date = sprintf("%04d-%02d-%02d %02d:%02d:%02d%s",
                               $y + 1900, $mon + 1, $mday,
                               $hr, $min, $sec, ($isdst) ? "-04:00:00" : "-05:00:00");
  }

  return $formatted_date;
}


sub _format_device_list {
  my ($self, $devices) = @_;

  my @devs = split(/\n/, $devices);
  my $device_list = '';

  foreach my $d (@devs) {
    my @d_list = split(/\s*,\s*/, $d);
    map { s/^\s+//; s/\s+$//; $_ } @d_list;

    if (scalar(@d_list)) {
      $device_list .= "\n" if ($device_list);
      $device_list .= join("\n", @d_list);
    }
  }

  return $device_list;
}


sub _normalize_ticket_number {
  my ($self, $ticket_number) = @_;

  $ticket_number =~ s/^\s+//;
  $ticket_number =~ s/\s+$//;

  return undef if ($ticket_number !~ /^CHG\d+$/);

  return $ticket_number;
}



sub _get_user_data {
  my ($self, $cdid, $team, $oncall_level, $username) = @_;

  my $ret_cdid = '';
  my $ret_team = '';
  my $ret_name = '';

  $oncall_level = lc($oncall_level);

  # If cdid is provided, look up user data for that cdid.
  #
  if ($cdid) {
    my $ui = AOL::UserInfo->new();
    my $user_info = $ui->get_user_info_by_cdid($cdid);

    if ($user_info) {
      $ret_cdid = $user_info->{employee_cdid} || '';
      $ret_name = $user_info->{element_short_name} || '';
    }
  }

  # Otherwise look up user data by team if that is provided
  #
  elsif ($team && $oncall_level) {
    my $ui = AOL::UserInfo->new();
    my $oncall_info = $ui->get_oncall_users($team);

    if ($oncall_info) {
      $ret_cdid = $oncall_info->{$oncall_level}{employee_cdid} || '';
      $ret_name = $oncall_info->{$oncall_level}{element_short_name} || '';
    }
  }

  return ($ret_cdid, $ret_name);
}


1;


__END__

=head1 NAME

AOL::CM - Create, Retrieve, Update, or Delete a Service Now CM ticket
programmatically.

=head1 SYNOPSIS

The following example shows proper use of the CM module to create,
retrieve, and delete a Service Now CM ticket.

  use AOL::CM;
  use Data::Dumper;

  my $cm = AOL::CM->new();
  my ($create_success, $create_result) =
      $cm->create_ticket(
                         secondary => 'ATDNCN',
                         short_desc => 'Prefix List Updates',
                         device_list => 'pop1-ash, pop2-ash,
                                         pop3-ash, bb1-ash',
                         install_steps => 'Change prefix lists',
                         start_time => time() + 50400,
                         duration => '15m',
  );

  unless ($create_success) {
    die "Error creating CM ticket: $create_result\n";
  }

  my $ticket_number = $create_result;
  print "Created CM ticket number: $ticket_number\n";

  my ($get_success, $ticket) = $cm->get_ticket($ticket_number);

  unless ($get_success) {
    die "Error retrieving CM ticket '$ticket_number': $ticket\n";
  }

  print "Retrieved CM ticket: $ticket_number\n";
  print Dumper $ticket;
  print "\n";

  my ($close_success, $close_result) =
      $cm->close_ticket(
                        ticket_number => $ticket_number,
                        end_time => time(),
  );

  unless ($close_success) {
    die "Error closing CM ticket '$ticket_number': $close_result\n";
  }

  print "Closed CM ticket: $ticket_number\n";
  print "\n";


Note that this example won't really work.  The create_ticket() does not
indicate an 'express' request.  Therefore, the ticket, once created, must
be Approved by a Remedy administrator before it can be closed.


=head1 DESCRIPTION

This package allows an application to create, retrieve, update, or delete
a Service Now CM ticket given a set of parameters.

It is intended to be used by NEO tools that make automated changes to
network devices so that changes and problems can be more easily tracked
through Service Now CM.


=head1 METHODS

=over 4

=item B<new()>

The constructor for the CM module.  Arguments must be specified as name/value
pairs.  No arguments are required.

=over 4

=item B<servicenow_user>

Identifies the username of the Service Now user that should be used when
contacting Service Now.  The default value is B<neocm>.

=item B<servicenow_pass>

Identifies the password to be used when contacting Service Now.

=item B<proxy>

Identifies the URL of the Service Now proxy to be used.  This parameter
overrides the B<dev> parameters.

=item B<dev>

Indicates that the development instance of Service Now should be used.

=back 4

The B<new()> method returns a reference to the CM object and should
be used in subsequent method calls.

=item B<create_ticket>(%ARGS)

The B<create_ticket()> method creates a new Service Now CM ticket.
The arguments to the B<create_ticket()> method are below.  All arguments must
be given as name/value pairs.  See the example above.  This method 
requires that either the B<secondary> or the B<cdid> parameter be given.
All other parameters are optional.

=over 4

=item B<secondary>

@@
Specified that the secondary on-call of the team specified should be 
put in as the creator of the ticket.  The secondary's name, e-mail
address, and cdid are looked up in ORB and are added to the Service Now ticket.
Either this or the B<cdid> parameter are required.

=item B<cdid>

Indicates the CDID of the person that should be put in as the creator of
the ticket.  The name of this person is looked up in
ORB and added to the ticket.  Either this or the B<secondary> parameter
are required.

=item B<name>

Identifies the name of the requestor of this ticket.  If the B<secondary>
parameter has been entered, this field is ignored because the name will
be determined from the secondary on_call of the given group.

=item B<short_desc>

Specifies the short description string of the Service Now ticket.

=item B<dev_list>

Specifies the list of devices that are affected by this change.  The 
list should be a comma-separated or newline-separated list of devices.

=item B<change_type>

Specifies the Service Now change type for this ticket.  It must be a valid 
Service Now Change Type or the creation will fail.  The default value is
'BGP Change'.

=item B<start_time>

Specifies the expected start time of the change.  The format can be any
of the following: TOE (i.e., number of seconds since Jan. 1, 1970),
'yyyy-mm-dd hh:mm', or 'mm/dd/yy hh:mm'.  The default value is the current
time.

=item B<duration>

Specifies the expected length of the maintenance.  The format is a
number optionally followed by units.  For example, '2 w' is two weeks,
'1 h' is one hour, '3600s' is 3600 seconds, and '1800' is 1800 seconds.
Acceptable units are 'w', 'd', 'h', 'm', 's', and the default is seconds.
This field is ignored if B<end_time> is specified.

=item B<end_time>

Specifies the expected end time of the maintenance.  The format is the
same as for <start_time>.  If neither B<end_time> nor B<duration> are
specified, the end time is assumed to be one hour after the start time.

=item B<install_steps>

Specifies the install steps for the maintenance of a description of the
change being applied.

=item B<express>

If a ticket is to be submitted as already complete, set the B<express>
parameter to 1.  This creates an Express ticket (one that does not need
to be Approved) that is already listed as complete and successful.  Do
not attempt to close a ticket that was opened with the B<express> flag.

=back 4

The call to the B<create_ticket()> method returns two values.  The first is a
success/failure value (1 for success, 0 for failure).  The second is the
ticket number that was created (in the case of a successful creation) or
an error reason if the creation was not successful.

=item B<get_ticket>($ticket_number)

Retrieves the Service Now CM ticket with the given ticket number.  The
B<get_ticket()> method takes only a single argument that specifies
the ticket number of the ticket to be retrieved.

The call to the B<get_ticket()> method returns two values.  The first is a
success/failure value (1 for success, 0 for failure).  The second is a
hash containing the values of the CM ticket retrieved or an error reason
if the retrieval was not successful.

=item B<update_ticket>(%ARGS)

The B<update_ticket()> method is used to replace certain fields in an
existing Service Now CM ticket.  The arguments to the B<update_ticket()>
method are below.  All arguments must be given as name/value pairs.
The B<ticket_sys_id> parameter is required.  All other parameters are
optional and depend on what fields the caller wants to be changed.

=over 4

=item B<ticket_number>

Indicates the ticket number of the ticket that is to be updated.
Required.

=item B<secondary>

=item B<cdid>

Indicates the CDID of the person that should be added as a requestor of
the ticket.

=item B<dev_list>

Specifies the list of devices that are affected by this change.  The 
list should be a comma-separated or newline-separated list of devices.

=item B<dev_list_append>

Specifies a list of devices that should be appended to the list of devices
affected by this change that is already in the ticket.  The list should be
a comma-separated or newline-separated list of devices.  If both the
B<dev_list> and the B<dev_list_append> parameters are given, the 
B<device_list_append> parameter is ignored.

=item B<short_desc>

Specifies the short description string of the Service Now ticket.

=item B<short_desc_append>

Specifies text that should be appended to the current short description 
field in the Service Now ticket.  If both the B<short_desc> and the
B<short_desc_append> parameters are given, the B<short_desc_append>
parameter is ignored.

=item B<install_steps>

Specifies the install steps for the maintenance of a description of the
change being applied.

=item B<install_steps_append>

Specifies an additional set of install steps that should be appended to the
install steps that are currently in the Service Now ticket.  If both the
B<install_steps> and the B<install_steps_append> parameters are given,
the B<install_steps_append> parameter is ignored.

=item B<start_time>

Specifies the expected start time of the change.  The format can be any
of the following: TOE (i.e., number of seconds since Jan. 1, 1970),
'yyyy-mm-dd hh:mm', or 'mm/dd/yy hh:mm'.  The default value is the current
time.

=item B<duration>

Specifies the expected length of the maintenance.  The format is a
number optionally followed by units.  For example, '2 w' is two weeks,
'1 h' is one hour, '3600s' is 3600 seconds, and '1800' is 1800 seconds.
Acceptable units are 'w', 'd', 'h', 'm', 's', and the default is seconds.
This field is ignored if B<end_time> is specified.

=item B<end_time>

Specifies the expected end time of the maintenance.  The format is the
same as for <start_time>.  If neither B<end_time> nor B<duration> are
specified, the end time is assumed to be one hour after the start time.

=back 4

The call to the B<update_ticket()> method returns two values.  The first is a
success/failure value (1 for success, 0 for failure).  The second is an
error reason if the update was not successful.

=item B<log_error_in_ticket>(%ARGS)

The B<log_error_in_ticket()> method allows the caller to specify that
an error has occurred during the change by adding the B<error_text>
provided in the 'Addtional Comments' of the specified Service Now CM ticket.
The arguments to the B<log_error_in_ticket()> method are below.  All
arguments must be given as name/value pairs.  This method requires that
both the B<ticket_number> and B<error_text> parameter be given.

=over 4

=item B<ticket_number>

Indicates the ticket number of the ticket that is to be updated.
Required.

=item B<error_text>

Specifies the reason that the maintenance did not complete successfully.
The B<error_text> value is put in the Additional Comments of the specified
ticket.  The calling application should notify a human that the ticket
should be worked outside the scope of the application.

=back 4

The call to the B<log_error_in_ticket()> method returns two values.  The
first is a success/failure value (1 for success, 0 for failure).  The
second is an error reason if the update was not successful.

=item B<close_ticket>(%ARGS)

The B<close_ticket()> method closes the specified Service Now CM ticket.
The arguments to the B<close_ticket()> method are below.  All arguments
must be given as name/value pairs.  See the example above.  This method 
requires that the B<ticket_number> parameter be given.  All other
parameters are optional.

=over 4

=item B<ticket_number>

Indicates the ticket number of the ticket that is to be closed.
Required.

=item B<cancel>

If set to 1, specifies that the ticket should be cancelled rather than
closed as complete and successful.  Caller may set a cancel reason in the
B<cancel_reason> parameter.

=item B<cancel_reason>

Specifies the reason that this ticket is being cancelled.  This field is
ignored if the B<cancel> parameter is not set.  If the B<cancel> parameter
is set and this parameter is not included it will default to
'B<No changes required, no changes made>'.

=back 4

The call to the B<close_ticket()> method returns two values.  The first is a
success/failure value (1 for success, 0 for failure).  The second is an
error reason if the request was not successful.

=cut

