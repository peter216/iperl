############################################################################
# $Id$
#
# $Revision$
############################################################################

package AOL::UserInfo;

use strict;
use warnings;
use English qw( -no_match_vars );
use Time::HiRes qw(gettimeofday tv_interval);
use HTTP::Request;
use LWP::UserAgent;
use XML::Simple;
use URI::Escape;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw( get_user_info
                     get_user_info_by_cdid
                     get_user_info_by_kerb_user
                     get_oncall_users
                     get_kerb_user
                     set_kerb_user
                   );

my $_ORB_ATOMICS_URL = "http://orb-atomics.ops.aol.com:8080/jAtomics/raw/?q=";
my $_BY_CDID = 'CDID';
my $_BY_KERB = 'KERB';

my @_USER_FIELDS = (
  'person_lastname',
  'person_firstname',
  'person_title',
  'person_email',
  'person_phone_work',
  'person_screenname',
  'element_short_name',
  'employee_cdid',
  'employee_kerb_uid',
  'employeestatus_description',
  'employee_kerb_login',
  'team_name',
  'team_fqtn',
  'team_short_code',
  'team_element_id',
  'organization_name',
  'manager_name',
  'manager_fk_element_id',
  'element_id',
);


sub new {
  my ($class, %args) = @_;

  my $self = {};
  bless($self, $class);

  $self->{kerb_user} = $args{kerb_user} || $self->_get_callers_kerb_user();

  $self->{user_info} = {};
  $self->{orb_error} = undef;

  $self->{atomics_url} = $args{atomics_url} || $_ORB_ATOMICS_URL;

  return $self;
}


sub get_user_info {
  my ($self, $kerb_user) = @_;

  $kerb_user = $self->{kerb_user} unless ($kerb_user);

  return undef unless (defined($kerb_user));

  return $self->get_user_info_by_kerb_user($kerb_user);
}


sub get_user_info_by_kerb_user {
  my ($self, $kerb_user) = @_;

  $kerb_user = $self->{kerb_user} unless (defined($kerb_user));

  return $self->{user_info}{$_BY_KERB}{$kerb_user}
    if (defined($self->{user_info}{$_BY_KERB}{$kerb_user}));

  return $self->_lookup_user_info($_BY_KERB, $kerb_user);
}


sub get_user_info_by_cdid {
  my ($self, $cdid) = @_;

  unless ($cdid) {
    $self->{orb_error} = "CDID parameter undefined";
    return undef;
  }

  return $self->{user_info}{$_BY_CDID}{$cdid}
    if (defined($self->{user_info}{$_BY_CDID}{$cdid}));

  return $self->_lookup_user_info($_BY_CDID, $cdid);
}


sub get_oncall_users {
  my ($self, $team) = @_;

  unless ($team) {
    $self->{orb_error} = "Team parameter undefined";
    return undef;
  }

  return $self->{team_info}{$team} if (defined($self->{team_info}{$team}));

  return $self->_lookup_oncall_users($team);
}


sub set_kerb_user {
  my ($self, $kerb_user) = @_;

  $self->{kerb_user} = $kerb_user;

  return $self->get_user_info();
}


sub get_kerb_user {
  my ($self) = @_;

  return $self->{kerb_user};
}


sub _get_callers_kerb_user {
  my ($self) = @_;

  $self->{kerb_user} = getlogin() || (getpwuid($UID))[0] || $ENV{USER} ||
    `whoami`;
  chomp($self->{kerb_user});

  return $self->{kerb_user};
}


sub _lookup_user_info {
  my ($self, $type, $user) = @_;

  return $self->{user_info}{$type}{$user}
    if (defined($self->{user_info}{$type}{$user}));

  $self->{orb_error} = undef;

  my $fields = join(', ', @_USER_FIELDS);
  my $SQL = "SELECT $fields" .
            "  FROM employee_display";

  my $criteria = ($type eq $_BY_KERB)
    ? " WHERE employee_kerb_login = '$user'"
    : " WHERE employee_cdid = '$user'";

  $SQL .= $criteria;

  my $version = 1;
  my $format = 'compact';
  my $query_params = "&version=$version&format=$format";
  $SQL = uri_escape($SQL);

  my $url .= $self->{atomics_url};
  $url .= $SQL . $query_params;

  my $request = HTTP::Request->new(GET => $url);

  my $user_agent = LWP::UserAgent->new;
  my $response = $user_agent->request($request);
  my $xs = XML::Simple->new();
  my $xml;

  if ($response->is_success()) {
    eval {
      $xml = $xs->XMLin($response->content);
    };

    if ($@) {
      $self->{orb_error} = "Error in xml decoding: $@\n";
    }

    if ($self->{orb_error}) {
      # Do nothing
    }

    elsif (defined($xml->{sqlException})) {
      $self->{orb_error} = "SQL Exception:\n" . $xml->{sqlException};
    }

    else {
      my %info;
      my $kerb_user;
      my $cdid_user;

      my $records = $xml->{data}{rows}{row};

      if (ref($records) eq 'HASH') {
        $records = [ $records ];
      }

      foreach my $ref (@$records) {
        for (my $i = 0; $i < scalar(@_USER_FIELDS); $i++) {
          $info{$_USER_FIELDS[$i]} = $ref->{value}[$i] || undef;
          $info{$_USER_FIELDS[$i]} = undef if (ref($ref->{value}[$i]) eq 'HASH');

          $kerb_user = $ref->{value}[$i]
            if ($_USER_FIELDS[$i] eq 'employee_kerb_login');
          $cdid_user = $ref->{value}[$i]
            if ($_USER_FIELDS[$i] eq 'employee_cdid');
        }
      }

      $self->{user_info}{$_BY_KERB}{$kerb_user} = \%info if ($kerb_user);
      $self->{user_info}{$_BY_CDID}{$cdid_user} = \%info if ($cdid_user);
    }
  }
  else {
    $self->{orb_error} = sprintf("Error getting Orb data: %s\n",
                                 $response->status_line);
  }


  return $self->{user_info}{$type}{$user} || undef;
}


sub _lookup_oncall_users {
  my ($self, $team) = @_;

  return $self->{team_info}{$team}
    if (defined($self->{team_info}{$team}));

  $self->{orb_error} = undef;

  my @employee_types = (
    { name => 'primary',    tag => 'pe' },
    { name => 'secondary',  tag => 'se' },
    { name => 'escalation', tag => 'ee' },
  );

  my $SQL = "SELECT td.team_name";
  my $tables = "  FROM team_display td, oncall_rotation_display ord";
  my $joins = "  ";

  foreach my $type (@employee_types) {
    my $tag = $type->{tag};
    my $name = $type->{name};

    $tables .= ", employee_display $tag";
    $joins .= " ord.${name}_cdid = $tag.employee_cdid AND";

    foreach my $field (@_USER_FIELDS) {
      $SQL .= ", $tag.$field";
    }
  }

  $SQL .= $tables;

  $SQL .= " WHERE td.team_short_code = '$team' AND" .
          "       ord.team_fk_element_id = td.team_fk_element_id AND" .
          $joins .
          "       current_oncall_schedule IS TRUE";

  my $version = 1;
  my $format = 'compact';
  my $query_params = "&version=$version&format=$format";
  $SQL = uri_escape($SQL);

  my $url .= $self->{atomics_url};
  $url .= $SQL . $query_params;

  my $request = HTTP::Request->new(GET => $url);

  my $user_agent = LWP::UserAgent->new;
  my $response = $user_agent->request($request);
  my $xs = XML::Simple->new();
  my $xml;

  if ($response->is_success()) {
    eval {
      $xml = $xs->XMLin($response->content);
    };

    if ($@) {
      $self->{orb_error} = "Error in xml decoding: $@\n";
    }

    if ($self->{orb_error}) {
      # Do nothing
    }

    elsif (defined($xml->{sqlException})) {
      $self->{orb_error} = "SQL Exception:\n" . $xml->{sqlException};
    }

    else {
      my %info;

      my $records = $xml->{data}{rows}{row};

      if (ref($records) eq 'HASH') {
        $records = [ $records ];
      }

      foreach my $rec (@$records) {
        my $ndx = 0;
        $info{team_name} = $rec->{value}[$ndx] || undef;
        $ndx++;

        foreach my $type (@employee_types) {
          my $name = $type->{name};

          for (my $i = 0; $i < scalar(@_USER_FIELDS); $i++) {
            $info{$name}{$_USER_FIELDS[$i]} = $rec->{value}[$ndx] || undef;
            $ndx++;
          }
        }
      }

      $self->{team_info}{$team} = \%info;
    }
  }
  else {
    $self->{orb_error} = sprintf("Error getting Orb data: %s\n",
                                 $response->status_line);
  }

  return $self->{team_info}{$team};
}


1;

