package AOL::ENV;

use strict;
use warnings;

use JSON;
use Sys::Hostname;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT =qw( get_env
               );

my $_DEFAULT_ENV_FILE = '/opt/nettools/lib/data/host_environments.json';

sub new {
  my ($class, %args) = @_;

  my $self = {};
  bless($self, $class);

  $self->{env_file} = $args{env_file} || $_DEFAULT_ENV_FILE;
  $self->{this_host} = hostname();
  $self->{environments} = _load_json($self->{env_file});

  return ($self->{environments}) ? $self : undef;
}

sub get_env {
  my ($self, $host) = @_;
 
  $host = $self->{this_host} unless ($host);

  my $env = $self->{environments}{'host'}{$host};

  if (defined $env) {
    return $env;
  }
  else {
    return 'UNKNOWN';
  }
}

sub _load_json {
  my ($env_file) = @_;

  return undef unless (-f $env_file);

  my $json;
  {
    local $/;
    open my $fh, '<', $env_file;
    $json = <$fh>;
    close $fh;
  }

  my $data;
  eval {
    $data = decode_json($json);
  };

  return undef if ($@);
  return $data;
}

1;

__END__

=head1 NAME

AOL::ENV - Allows the user to determine the environment (dev/prod) for
a host.

=head1 SYNOPSIS

This package is used to determine the run environment for a given host.
The run environments currently consist of B<dev> and B<prod>.

=head1 DESCRIPTION

This package uses a JSON formatted file to determine and return the
current run environment for various network tools hosts.  This will 
allow scripts to alter their behavior based on the environment.

The current environments returned for a given host currently include
B<dev> or B<prod>, but any string value is possible.  

The module will use a default filename to look up the run environment,
but a new file can be specified by passing the name into the constructor
as the B<env_file> argument.

The primary method of this object is B<get_env> which is used to get
the environment of either the current host or any host that is specified.
If the current or requested hostname is not in the json file, a value of
B<UNKNOWN> is returned by this method.

If the hosts file is not present or it does not contain properly formatted
JSON, the constructor will return undef.

=head1 EXAMPLE

The following code creates a new AOL::ENV object.  Then it uses the 
get_env method to print the environment of the current host as well as
another host.

  use AOL::ENV;

  my $env = AOL::ENV->new() or
    die "Failed to initialize ENV";

  printf "Environment of this host is '%s'\n", $env->get_env();

  my $other_host = 'nettoolsjump-s01.ops.aol.com';
  printf "Environment of host '$other_host' is '%s'\n",
    $env->get_env($other_host);


  % env
  Environment of this host is 'dev'
  Environment of host 'nettoolsjump-s01.ops.aol.com' is 'prod'

