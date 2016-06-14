############################################################################
# Wrapper module for Atomics calls to Orb, NMS, or EDC.
#
# Peter Stephan - 5/21/2013
############################################################################

package AOL::Atomics;

use HTTP::Request;
use LWP::UserAgent;
use XML::Simple;
use URI::Escape;
use JSON;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw( database
                     execute_query
                     output_format
                     request_format

                     ATOMICS_OK
                     ATOMICS_SQL_ERROR
                   );

use constant ATOMICS_OK              => 0;
use constant ATOMICS_SQL_ERROR       => 1;
use constant ATOMICS_FAILED          => 2;
use constant ATOMICS_JSON_ERROR      => 3;


my $_DEFAULT_REQUEST_FORMAT = 'compact';
my $_DEFAULT_OUTPUT_FORMAT = 'formatted';
my $_DEFAULT_DATABASE = 'nms';

my %_VALID_DATABASES = (
  nms => 'http://nms-atomics.ops.aol.com:8081/nms-jAtomics/raw/?q=',
  orb => 'http://orb-atomics.ops.aol.com:8080/jAtomics/raw/?q=',
  edc => 'http://nsadmin-atomics.iweb.aol.com/raw/?q=',
);

my %_VALID_REQUEST_FORMATS = (
  xml     => 1,
  compact => 1,
  json    => 1, # Not sure if json always works properly
);

my %_VALID_OUTPUT_FORMATS = (
  raw       => 1,
  formatted => 1,
);


sub new {
  my ($class, %args) = @_;

  my $self = {};
  bless($self, $class);

  # Current Atomics version is 1 in all cases
  #
  $self->{version} = 1;

  $self->{database} = $_DEFAULT_DATABASE;

  if ($args{database}) {
    $args{database} = lc($args{database});
    $self->{database} = $args{database}
      if ($self->_valid_database($args{database}));
  }

  $self->{request_format} = $_DEFAULT_REQUEST_FORMAT;
  $self->{output_format} = $_DEFAULT_OUTPUT_FORMAT;

  if ($args{request_format}) {
    $args{request_format} = lc($args{request_format});
    $self->{request_format} = $args{request_format}
      if ($self->_valid_request_format($args{request_format}));
  }

  if ($args{output_format}) {
    $args{output_format} = lc($args{output_format});
    $self->{output_format} = $args{output_format}
      if ($self->_valid_output_format($args{output_format}));
  }

  $self->{base_url} = $_VALID_DATABASES{$self->{database}};
  
  return $self;
}


# Set or get target database
#
sub database {
  my ($self, $database) = @_;

  if (defined($database)) {
    $database = lc($database);
    $self->{database} = $database if ($self->_valid_database($database));
    $self->{base_url} = $_VALID_DATABASES{$self->{database}};
  }

  return $self->{database};
}


# Set or get request format
#
sub request_format {
  my ($self, $format) = @_;

  if (defined($format)) {
    $format = lc($format);
    $self->{request_format} = $format
      if ($self->_valid_request_format($format));
  }

  return $self->{request_format};
}


# Set or get output format
#
sub output_format {
  my ($self, $format) = @_;

  if (defined($format)) {
    $format = lc($format);
    $self->{output_format} = $format if ($self->_valid_request_format($format));
  }

  return $self->{output_format};
}


# Run the requested query against the target atomics instance.
#
sub execute_query {
  my ($self, $sql) = @_;

  my %ret = ( status => ATOMICS_OK );

  my $query_params = "&version=$self->{version}&format=$self->{request_format}";

  $sql = uri_escape($sql);

  # select, raw, or sproc
  my $url = $self->{base_url};
  $url .= $sql;
  $url .= $query_params;

  my $request = HTTP::Request->new(GET => $url);

  my $user_agent = LWP::UserAgent->new;
  my $response = $user_agent->request($request);

  if ($response->is_success()) {

    if ($self->{output_format} eq 'raw') {
      $ret{data} = $response;
    }

    elsif ($self->{request_format} eq 'json') {
      my $json = JSON->new();
      my $data = $response->content;
      $data =~ s/\t/ /g;
      $data =~ s/\n/ /g;

      eval {
        $data = $json->decode($data);
      };

      if ($@) {
        $ret{status} = ATOMICS_JSON_ERROR;
        $ret{error} = "Error in json decoding: $@\n";
      }

      if (defined($data->{sqlException})) {
        $ret{status} = ATOMICS_SQL_ERROR;
        $ret{error} = "SQL Exception:\n" . $data->{sqlException};
      }

      else {
        # @@ Probably should set null values to undef.
        $ret{data} = $data->{records};
      }
    }

    elsif ($self->{request_format} eq 'xml') {
      my $xs = XML::Simple->new();
      my $xml;

      $xml = $xs->XMLin($response->content);

      if (defined($xml->{sqlException})) {
        $ret{status} = ATOMICS_SQL_ERROR;
        $ret{error} = "SQL Exception:\n" . $xml->{sqlException};
      }

      else {
        # header contains numRecords, numFields, status, QTime @@
        # $xml = $xml->{responseBody}{record} if ($self->{request_format} eq 'xml');
        # responseHeader contains numRecords, numFields, status, QTime @@

        $ret{data} = $xml;
      }
    }

    elsif ($self->{request_format} eq 'compact') {
      my $xs = XML::Simple->new();
      my $xml;

      $xml = $xs->XMLin($response->content);

      if (defined($xml->{sqlException})) {
        $ret{status} = ATOMICS_SQL_ERROR;
        $ret{error} = "SQL Exception:\n" . $xml->{sqlException};
      }

      else {
        # header contains numRecords, numFields, status, QTime @@
        #   $xml = $xml->{responseBody}{record} if ($self->{request_format} eq 'xml');
        # responseHeader contains numRecords, numFields, status, QTime @@

        # If a single row was returned, make it looks like an array.
        #
        if (! defined($xml->{data}{rows}{row})) {
          $ret{data} = [ ];
        }
        elsif (ref($xml->{data}{rows}{row}) ne 'ARRAY') {
          $ret{data} = [ $xml->{data}{rows}{row} ];
        }
        else {
          $ret{data} = $xml->{data}{rows}{row};
        }

        # Set null values to undef
        #
        for (my $i = 0; $i < scalar(@{$ret{data}}); $i++) {
          for (my $j = 0; $j < scalar(@{$ret{data}[$i]{value}}); $j++) {
            if (ref($ret{data}[$i]{value}[$j]) eq 'HASH') {
              $ret{data}[$i]{value}[$j] = undef;
            }
          }
        }
      }
    }

    else {
      $ret{status} = ATOMICS_BAD_FORMAT;
      $ret{error} = sprintf("Requested format '%s' unrecognized",
        $self->{request_format});
    }
  }
  else {
    $ret{status} = ATOMICS_FAILED;
    $ret{error} = "Response code: $response->{code}\n" . $response->status_line;
  }

  return \%ret;
}


sub _valid_database {
  my ($self, $database) = @_;

  return (defined($_VALID_DATABASES{$database})) ? 1 : 0;
}


sub _valid_request_format {
  my ($self, $format) = @_;

  return (defined($_VALID_REQUEST_FORMATS{$format})) ? 1 : 0;
}


sub _valid_output_format {
  my ($self, $format) = @_;

  return (defined($_VALID_OUTPUT_FORMATS{$format})) ? 1 : 0;
}


