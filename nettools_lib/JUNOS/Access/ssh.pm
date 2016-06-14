#
# $Id: ssh.pm,v 1.6 2007-06-28 09:14:37 builder Exp $
#
# COPYRIGHT AND LICENSE
# Copyright (c) 2001-2003, 2007, Juniper Networks, Inc.  
# All rights reserved.  
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 	1.	Redistributions of source code must retain the above
# copyright notice, this list of conditions and the following
# disclaimer. 
# 	2.	Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution. 
# 	3.	The name of the copyright owner may not be used to 
# endorse or promote products derived from this software without specific 
# prior written permission. 
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
# IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# The JUNOS::Access::ssh implements the ssh access method. 
#

package JUNOS::Access::ssh;

use JUNOS::Trace;
use JUNOS::Access;

use Expect;

use vars qw(@ISA);
@ISA = qw(JUNOS::Access);

sub disconnect
{
    my ($self) = shift;
    $self->{'ssh-obj'}->hard_close();
}

sub start
{
    my($self) = @_;
    my $ssh_cmd;

    # Get ssh port number if it exists
    my $rport= (getservbyname('ssh', 'tcp'))[2];
    $rport = $rport || 22;

    my $echostate = 'stty -echo;';
    if (exists($self->{'ssh-program'})) {
        $sshprog = $self->{'ssh-program'};
    } else {
        $sshprog = 'ssh';
    }

    # This implementation assumes OpenSSH.
    $ssh_cmd = $echostate . $sshprog;
    $ssh_cmd .= ' -aqTx ';

    if (defined $self->{'ssh-compress'} && $self->{'ssh-compress'}) {
	$ssh_cmd .= '-C ';
    }

    if (defined $self->{'ssh-debug'} && $self->{'ssh-debug'}) {
	$ssh_cmd .= '-v ';
    }

    $ssh_cmd .= '-l ' . $self->{'login'} . ' ';
    $ssh_cmd .= '-p' . $rport . ' ';
    $ssh_cmd .= $self->{'hostname'} . ' junoscript';

    # Create the Expect object
    my $ssh = Expect->spawn($ssh_cmd);
    if (!$ssh) {
	$self->{JUNOS_Device}->report_error(
			"Could not execute ssh client program on the system");
	return;
    }

    $self->{'ssh-obj'} = $ssh;
    # Turn off logging to stdout
    $ssh->log_stdout(0);
    
    # Create reference to the method 'out'
    $mref = sub { $self->out(@_) };
    $ssh->log_file($mref);

    if (defined($self->{'timeout'})) {
	$timeout = $self->{'timeout'};
    } else {
	$timeout = 10;
    }

    # Send our password or passphrase
    if ($ssh->expect($timeout, ('password:', '(yes/no)?', 'passphrase'))) {
        print $ssh "$self->{'password'}\r" if ($ssh->match() eq 'password:');
        print $ssh "$self->{'password'}\r" if ($ssh->match() eq 'passphrase');
        if ($ssh->match() eq '(yes/no)?') { # Host key authenticity
            print $ssh "yes\r";
            if ($ssh->expect($timeout, ('password:', 'passphrase'))) {
                print $ssh "$self->{'password'}\r";
            }
        }
    } else {
        $self->{'seen_eof'} = 1;
    }

    $self;
}

sub send
{
    my ($self, $xml) = @_;
    my $ssh = $self->{'ssh-obj'};
    print $ssh "$xml\r";
    1;
}

sub recv
{
    my $self = shift;
    my $xml;

    my $ssh = $self->{'ssh-obj'};
    if ($ssh->expect(600, "\n")) {
        $xml = $ssh->before(); 
    } else {
        print "Failed to login to $self->{'hostname'}\n";
        $self->{'seen_eof'} = 1;
    }
    $xml;
}

sub out
{
    $self = shift;

    foreach $line (@_) {
	if (defined($self->{'ssh-debug'}) && $self->{'ssh-debug'}) {
	    if ($line =~ m/^debug/) {
		print $line;
	    }
	}

        if ($line =~ /Permission\ denied/) {
	    print "Login failed: Permission Denied\n";
	    $self->{'ssh-obj'}->hard_close();
	    $self->{'seen_eof'} = 1;
        }

	if ($line =~ /not found/) {
	    $self->{JUNOS_Device}->report_error(
			    "Could not find ssh client program on the system");
	    $self->{'ssh-obj'}->hard_close();
	    $self->{'seen_eof'} = 1;
	}
    }
}

sub incoming
{
    $_[0];
}

1;

__END__

=head1 NAME

JUNOS::Access::ssh - Implements the ssh access method.

=head1 SYNOPSIS

This class is used internally to provide ssh access to a JUNOS::Access instance.

=head1 DESCRIPTION

This is a subclass of JUNOS::Access that manages a ssh session with the destination host.  The underlying mechanics for managing the ssh session is based on 
'ssh' binary.

=head1 CONSTRUCTOR

new($ARGS)

See the description of the constructor of the superclass JUNOS::Access.  This class also reads the following ssh specific keys from the input hash table reference $ARGS.

    ssh-debug		turn on/off debug in ssh binary.  The
			debug messages are displayed on STDOUT. 
			The value is 1 or 0.  By default, debug is
			off.

    ssh-compress	turn on/off compression for ssh binary. 
			The value is 1 or 0.  By default, compression
			is on.

=head1 SEE ALSO

    JUNOS::Access
    JUNOS::Device

=head1 AUTHOR

Juniper Junoscript Perl Team, send bug reports, hints, tips, and suggestions 
to support@juniper.net.

=head1 COPYRIGHT

Copyright (c) 2001 Juniper Networks, Inc.  All rights reserved.
