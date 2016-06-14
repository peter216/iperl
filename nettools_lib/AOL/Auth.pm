############################################################################
# AOL::Auth - Encrypt and store user data or get and decrypt that data.
# Initially used for storing/retrieving tacacs authentication data for
# network device access.
#
############################################################################

package AOL::Auth;

use strict;
use warnings;
use English qw( -no_match_vars );
use Crypt::CBC;
use MIME::Base64;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw( auth_file
                     set_initialization_vector
                     set_encryption_key
                     get_field
                     get_fields
                     set_fields
                     encode_base64
                     decode_base64
                     encrypt
                     decrypt
                     get_tacacs_credentials

                     AOL_AUTH_OK
                     AOL_AUTH_BAD_PARAMETER
                     AOL_AUTH_FILE_DOES_NOT_EXIST
                     AOL_AUTH_FILE_ERROR
                     AOL_AUTH_FIELD_DOES_NOT_EXIST
                   );

use constant AOL_AUTH_OK                   => 0;
use constant AOL_AUTH_BAD_PARAMETER        => 1;
use constant AOL_AUTH_FILE_DOES_NOT_EXIST  => 2;
use constant AOL_AUTH_FILE_ERROR           => 3;
use constant AOL_AUTH_FIELD_DOES_NOT_EXIST => 4;

my $_DEFAULT_AUTH_FILE             = '.network_device_v3.properties';
my $_DEFAULT_AUTH_FILE_MODE        = 0600;
my $_DEFAULT_INITIALIZATION_VECTOR = '0001020304050607';
my $_DEFAULT_ENCRYPTION_KEY        = '0102040808040201';

sub new {
  my ($class, %args) = @_;

  my $self = {};
  bless($self, $class);

  # Set the name/path of the auth file
  #
  $self->auth_file(($args{auth_file}) ? $args{auth_file} :
    $ENV{HOME} . '/' . $_DEFAULT_AUTH_FILE);

  # Set the mode for the auth file (if it is rewritten)
  #
  $self->auth_file_mode(($args{auth_file_mode}) ? $args{auth_file_mode} :
    $_DEFAULT_AUTH_FILE_MODE);

  # Set the initialization vector
  #
  $self->set_initialization_vector(($args{initialization_vector}) ?
    $args{initialization_vector} : $_DEFAULT_INITIALIZATION_VECTOR);

  # Set the encryption key
  #
  $self->set_encryption_key(($args{encryption_key}) ?
    $args{encryption_key} : $_DEFAULT_ENCRYPTION_KEY);

  return $self;
}


sub auth_file {
  my ($self, $file) = @_;

  $self->{auth_file} = $file if ($file);

  return $self->{auth_file};
}


sub auth_file_mode {
  my ($self, $mode) = @_;

  $self->{auth_file_mode} = $mode if ($mode);

  return $self->{auth_file_mode};
}


# Set the key for encrypting/decrypting the data
#
sub set_encryption_key {
  my ($self, $key_string) = @_;

  $self->{encryption_key} = $self->_pack_string($key_string);
}


# Set the initialization vector for encryption.
# Should we be able to tell it to generate a random IV??
#
sub set_initialization_vector {
  my ($self, $iv_string) = @_;

  $self->{initialization_vector} = $self->_pack_string($iv_string);
}


# Pack the given string as 8 bytes of binary (hex) data
#
sub _pack_string {
  my ($self, $string) = @_;

  return pack('H16', $string);
}


sub get_field {
  my ($self, $field) = @_;

  if (ref($field) ne 'HASH') {
    my %ret_val = (
      status    => AOL_AUTH_BAD_PARAMETER,
      error_msg => "get_field: 'field' value should be a hash"
    );

    return \%ret_val;
  }

  return $self->get_fields([ $field ]);
}


sub get_fields {
  my ($self, $fields) = @_;

  my %ret_val = ( status => AOL_AUTH_OK );

  if (ref($fields) eq 'HASH') {
    return $self->get_field($fields);
  }

  if (ref($fields) ne 'ARRAY') {
    $ret_val{status} = AOL_AUTH_BAD_PARAMETER;
    $ret_val{error_msg} = "get_fields: 'fields' value should be an array";

    return \%ret_val;
  }

  # Does the specified auth file exist?
  #
  if (! -f $self->{auth_file}) {
    $ret_val{status} = AOL_AUTH_FILE_DOES_NOT_EXIST;
    $ret_val{error_msg} =
      "get_fields: auth file '$self->{auth_file}' does not exist";

    return \%ret_val;
  }

  open(AUTH_FILE, $self->{auth_file}) or
    do {
      $ret_val{status} = AOL_AUTH_FILE_ERROR;
      $ret_val{error_msg} =
        "get_fields: error opening auth file '$self->{auth_file}': $!";

      return \%ret_val;
    };

  my @file_rows = <AUTH_FILE>;
  close(AUTH_FILE);

  foreach my $field (@$fields) {
    unless ($field->{key}) {
      $ret_val{status} = AOL_AUTH_BAD_PARAMETER;
      $ret_val{error_msg} = "get_fields: key field not found";

      return \%ret_val;
    }

    my $key = $field->{key};
    my $encrypted = $field->{encrypted} || 0;
    my $base64 = $field->{base64} || 0;

    my $value;

    foreach my $row (@file_rows) {
      if ($row =~ /^$key=(.*)$/) {
        $value = $1;
        chomp($value);
# @@@ should we allow for multiple occurrences of this key??
        last;
      }
    }

    unless ($value) {
      $ret_val{status} = AOL_AUTH_FIELD_DOES_NOT_EXIST;
      $ret_val{error_msg} =
        "get_fields: requested field '$key' not found in file";

      return \%ret_val;
    }

    $value = $self->base64_decode($value) if ($base64);
    $value = $self->decrypt($value) if ($encrypted);

    $ret_val{data}{$key} = $value;
  }
  
  return \%ret_val;
}


sub set_field {
  my ($self, $field) = @_;

  if (ref($field) ne 'HASH') {
    my %ret_val = (
      status    => AOL_AUTH_BAD_PARAMETER,
      error_msg => "set_field: 'field' value should be a hash"
    );

    return \%ret_val;
  }

  return $self->set_fields([ $field ]);
}


sub set_fields {
  my ($self, $fields) = @_;

  my %ret_val = ( status => AOL_AUTH_OK );

  if (ref($fields) eq 'HASH') {
    return $self->set_field($fields);
  }

  if (ref($fields) ne 'ARRAY') {
    $ret_val{status} = AOL_AUTH_BAD_PARAMETER;
    $ret_val{error_msg} = "set_fields: 'fields' value should be an array";

    return \%ret_val;
  }

  # Does the specified auth file exist?
  #
  if (! -f $self->{auth_file}) {
    $ret_val{status} = AOL_AUTH_FILE_DOES_NOT_EXIST;
    $ret_val{error_msg} =
      "set_fields: auth file '$self->{auth_file}' does not exist";

    return \%ret_val;
  }

  open(AUTH_FILE, $self->{auth_file}) or
    do {
      $ret_val{status} = AOL_AUTH_FILE_ERROR;
      $ret_val{error_msg} =
        "set_fields: error opening auth file '$self->{auth_file}': $!";

      return \%ret_val;
    };

  my @file_rows = <AUTH_FILE>;
  close(AUTH_FILE);

  my @new_rows = ();
  my @remove_rows = ();

  foreach my $field (@$fields) {
    unless ($field->{key}) {
      $ret_val{status} = AOL_AUTH_BAD_PARAMETER;
      $ret_val{error_msg} = "set_fields: key field not found";

      return \%ret_val;
    }

    unless ($field->{value}) {
      $ret_val{status} = AOL_AUTH_BAD_PARAMETER;
      $ret_val{error_msg} = "set_fields: value field not found";

      return \%ret_val;
    }

    my $key = $field->{key};
    my $value = $field->{value};
    my $encrypted = $field->{encrypted} || 0;
    my $base64 = $field->{base64} || 0;

    $value = $self->encrypt($value) if ($encrypted);
    $value = $self->base64_encode($value) if ($base64);

    push(@new_rows, "$key=$value");

    for (my $row_ndx = 0; $row_ndx < scalar(@file_rows); $row_ndx++) {
      if ($file_rows[$row_ndx] =~ /^$key=(.*)$/) {
        push(@remove_rows, $row_ndx);
# @@@ should we allow for multiple occurrences of this key??
        last;
      }
    }
  }

  # Remove the old rows that we are replacing
  #
  foreach my $remove (reverse @remove_rows) {
    splice(@file_rows, $remove, 1);
  }

  # Add the new rows to the file data
  #
  foreach my $new_row (@new_rows) {
    push(@file_rows, $new_row);
  }

  # Write the updated data back to the file
  #
  open(AUTH_FILE, "> $self->{auth_file}") or
    do {
      $ret_val{status} = AOL_AUTH_FILE_ERROR;
      $ret_val{error_msg} = "set_fields: error opening auth file " .
        "'$self->{auth_file}' for write: $!";

      return \%ret_val;
    };

  print AUTH_FILE @file_rows;
  close(AUTH_FILE);

  # Set the file mode (to make sure that it is secure).
  #
  chmod($self->{auth_file_mode}, $self->{auth_file});

  return \%ret_val;
}


sub decrypt {
  my ($self, $encrypted_value) = @_;

  my $cipher = Crypt::CBC->new({
    'key'         => $self->{encryption_key},
    'iv'          => $self->{initialization_vector},
    'prepend_iv'  => 0,
    'padding'     => 'standard',
    'header'      => 'none',
    'literal_key' => 1,
    # 'cipher'      => 'DES',
  });

  my $decrypted = $cipher->decrypt($encrypted_value);

  return $decrypted;
}


sub encrypt {
  my ($self, $value) = @_;

  my $cipher = Crypt::CBC->new({
    'key'         => $self->{encryption_key},
    'iv'          => $self->{initialization_vector},
    'prepend_iv'  => 0,
    'padding'     => 'standard',
    'header'      => 'none',
    'literal_key' => 1,
    # 'cipher'      => 'DES',
  });

  my $encrypted_value = $cipher->encrypt($value);
  chomp($encrypted_value);

  return $encrypted_value;
}


sub base64_decode {
  my ($self, $value) = @_;

  return MIME::Base64::decode_base64($value);
}


sub base64_encode {
  my ($self, $value) = @_;

  return MIME::Base64::encode_base64($value);
}


sub get_tacacs_credentials {
  my ($self) = @_;

  my $user_key = 'tacacs.user';
  my $pass_key = 'tacacs.password';

  # Make sure that the correct file name, initialization vector, and
  # encryption key are set.
  #
  $self->set_initialization_vector($_DEFAULT_INITIALIZATION_VECTOR);
  $self->set_encryption_key($_DEFAULT_ENCRYPTION_KEY);

  # Get the tacacs user name (tacacs.user) and password (tacacs.password)
  # from the file.  Username is not encrypted, password is base64 encoded
  # and encrypted.
  #
  my $auth_response = $self->get_fields([
    {key => $user_key},
    {key => $pass_key, base64 => 1, encrypted => 1},
  ]);

  return (undef, undef) if ($auth_response->{status} != AOL_AUTH_OK);

  my $pass = $auth_response->{data}{$pass_key};
  if ($pass =~ /^.*:(.*)$/) {
    $pass = $1;
  }

  return ($auth_response->{data}{$user_key}, $pass);
}



1;

__END__

This is what the $field data for get_fields should look like:

[
  { key => 'tacacs.user', base64 => 0, encrypted => 0 },
  { key => 'tacacs.password', base64 => 1, encrypted => 1 },
]

Almost the same for set_fields, just need the value:

[
  { key => 'tacacs.user', value => x, base64 => 0, encrypted => 0 },
  { key => 'tacacs.password', value => y, base64 => 1, encrypted => 1 },
]

--- Get tacacs credentials the easy way

use AOL::Auth;

my $auth = AOL::Auth->new();

my ($username, $password) = $auth->get_tacacs_credentials();

unless ($username) {
  print "Error getting tacacs credentials\n";
  exit(0);
}

print "Username: $username, Password: $password\n";


--- Get tacacs credentials the hard way

use AOL::Auth;

my $user_key = 'tacacs.user';
my $pass_key = 'tacacs.password';

my $auth = AOL::Auth->new();

# First get the tacacs user name from the file.  It is
# not encrypted.
#
my $auth_response = $auth->get_field({key => $user_key});

if ($auth_response->{status} != AOL::Auth::AOL_AUTH_OK) {
  print "Error getting field '$user_key' from auth file:\n";
  print "$auth_response->{error_msg}\n";
}
else {
  print "'$user_key' value is '$auth_response->{data}{$user_key}'\n";
}

# Now get the tacacs user password from the file.  It is
# base64 encoded and encrypted.
#
$auth_response = $auth->get_field(
  {key => $pass_key, base64 => 1, encrypted => 1});

if ($auth_response->{status} != AOL::Auth::AOL_AUTH_OK) {
  print "Error getting field '$pass_key' from auth file:\n";
  print "$auth_response->{error_msg}\n";
}
else {
  print "'$pass_key' value is '$auth_response->{data}{$pass_key}'\n";
}

