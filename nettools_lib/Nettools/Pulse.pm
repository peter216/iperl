#########################################################################
# Pulse library for Perl
#
#
#
#
#
#
#
#########################################################################

package Nettools::Pulse;

use IO::Socket::INET;
use Net::Domain qw (hostname hostfqdn hostdomain);
use strict 'vars';

use vars qw($VERSION $PULSE_PROTO_VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $PULSE_HEARTBEAT $PULSE_REMOVE $MIN_TIME);

BEGIN {
    use Exporter ();
    our ($VERSION, @ISA, @EXPORT, @EXPORT_OK, %EXPORT_TAGS); # export these

    my ($CVS_revision);                     # cvs revision (just the # please)
    $CVS_revision = ' $Revision: 6852 $ ';
    $CVS_revision =~ /Revision:\s+([^\s]+)\s/;
    $CVS_revision = $1;
    $VERSION = $CVS_revision;

    $PULSE_PROTO_VERSION = "2"; # a string, but an integer.

    $MIN_TIME = 1 * 1000;  # min value for any TIME value.

    #
    # These are constants useful for encoding the messages to the server
    #
    $PULSE_REMOVE    = 0;
    $PULSE_HEARTBEAT = 1;

    @ISA       = qw(Exporter);
    @EXPORT    = qw();
    @EXPORT_OK = qw();
}


# no defaults yet.
my %Defaults = (
		'dnsFailureRetryMinutes'    => 60,
		'dnsRefreshIntervalMinutes' => 4 * 60
	       );

#
# Constructor
#
sub new {
    my $type  = shift;               # bleargh. inheritable constructor.
    my $class = ref($type) || $type; # inheritable!
    my %args  = @_;                  # a hash passed as an arg
    my $self  = {};                  # a reference to ME!  (hashref)
    my $bad_constructor = 0;

    # bless() turns this hash into an object
    bless($self,$class);


    #String stethoscopeHost
    #int port
    #String programName
    #int uniqueID
    #String groupID (#####-###)
    #long maxHeartbeatAge
    #long minAlarmInterval

    my (@required_args) = (
			   "stethoscopeHost", "port", "programName", "uniqueID",
			   "maxHeartbeatAge", "minAlarmInterval", "groupID"
			  );
    my (@optional_args) = keys %Defaults;

    # Initialize local variables.
    $self->{'server_ips'}      = [ ]; # empty array at first
    #
    # Stats.
    #
    $self->{'heartbeats_sent'} = 0;
    $self->{'create_time'} = time();

    $self->{'my_hostname'} = Net::Domain::hostfqdn();

    # copy the required arg into the %self hash.
    # and test to ensure all are specified.
    foreach my $arg (@required_args) {
	if (! defined ($args{$arg})) {
	    print STDERR "Constructor error for Pulse.  Must specify \"$arg\"\n";
	    $bad_constructor=1;
	}
	$self->{$arg}= $args{$arg};
    }
    
    #
    # If we missed any required constructor arguments, or have
    # specified any invalid inputs, we fail by returning
    # UNDEF to the caller to indicate a failed object creation.
    #
    if ($bad_constructor ||
	! $self->_validate_all()) {
	return (undef);
    }

    #
    # At construction-time, we copy the %Defaults values into %self.
    # The constructor _could_ override any of them. (optional vals)
    #
    foreach my $arg (keys %Defaults) {
	$self->{$arg} = $Defaults{$arg};
    }
    
    # copy the optional arguments into the %self hash.
    foreach my $arg (@optional_args) {
	if (defined ($args{$arg})) {
	    $self->{$arg}=$args{$arg};
	}
    }

    #
    # Now perform DNS lookup on the stethoscopeHost and get its list of IPs
    # If this fails, then the constructor must BOMB.  Can't send heartbeats
    # without knowing where we send them.
    #
    my $count_ips = 0;
    my $hostname = $self->{'stethoscopeHost'};

    # I wonder if I should just call the _update_dns() function to set up
    # the initial ips/sockets
    
    #
    # attempt a DNS lookup.  if it fails, the constructor will fail.
    #
    my @ips = $self->_resolve_dns ( $hostname );
    if (scalar(@ips) == 0) {
	print STDERR "Pulse Constructor failed: DNS lookup failed to resolve stethoscopeHost: $hostname\n";
	return (undef);
    }

    #
    # Now we have the list of IPs, we need to set up our UDP socket objects.
    #
    @{ $self->{'server_ips'} } = @ips;
    foreach my $ip (@ips) {
	$self->_add_udp_socket ($ip);
    }
    # If all of the socket calls failed, do not permit the constructor to succeed.
    if (scalar(@{ $self->{'server_sockets'} }) == 0) {
	return (undef);
    }

    $self->{'next_dns_update'} = time() + 60 * $self->{'dnsRefreshIntervalMinutes'}
      + rand(60); # add a little randomness to prevent lock-step synchrony

    return ($self);
}


sub sendHeartbeat {
    my ($self) = @_;
    my ($mesg, $sock);
    my $bad = 0;

    $self->_update_dns();
    $mesg = $self->_encode_message ($PULSE_HEARTBEAT);

    # walk list of all servers, send this message to all of them
    foreach $sock ( @{ $self->{'server_sockets'} } ) {
	my $host_port = $sock->peerhost() . ":" . $sock->peerport();
	my $ret = $sock->send ($mesg); # try to send it!
	# print STDERR "Sending to $host_port returns $ret\n";
	if ($ret != length($mesg) ) {
	    $bad=1;
	}
    }
    if (! $bad) {
	return (1);
    } else {
	return (undef); # any of them fail, this returns undef
    }
}


sub sendDeregister {
    my ($self) = @_;
    my $mesg;
    my $sock;

    $self->_update_dns();
    $mesg = $self->_encode_message ($PULSE_REMOVE);


    # walk list of all servers, send this message to all of them
    foreach $sock ( @{ $self->{'server_sockets'} } ) {
	my $host_port = $sock->peerhost() . ":" . $sock->peerport();
	my $ret = $sock->send ($mesg); # try to send it!
	# print STDERR "Sending to $host_port returns $ret\n";
    }
    return (1);
}

sub _encode_message {
    my ($self, $type) = @_;
    my ($mesg);

    $mesg = join (' ',
		  $PULSE_PROTO_VERSION,
		  $type,
		  $self->{'my_hostname'},
		  $self->{'programName'},
		  $self->{'uniqueID'},
		  $self->{'groupID'},
		  $self->{'maxHeartbeatAge'},
		  $self->{'minAlarmInterval'});

    # print STDERR "Debug:  message for stethoscope is: $mesg\n";
    return ($mesg);
}


sub _add_udp_socket {
    my ($self, $ip) = @_;
    my $port = $self->{'port'};

    #
    # This subroutine will build new IO::Socket::INET object for the ip
    # given, using the port from our constructor supplied config.
    # The new IO::Socket::INET object will be APPENDED to the list of
    # current UDP socket objects.  This will allow us to use this for adding
    # new servers when the DNS rotor resolves to a wider set of things.
    #

    my $new_socket = IO::Socket::INET->new (
					    'Proto'      => 'udp',
					    'PeerAddr'   => $ip,
					    'PeerPort'   => $port
					   );
    if ($new_socket) {
	push (@{ $self->{'server_sockets'} }, $new_socket );
	return (1);
    }

    print STDERR "Pulse Error building UDP socket to $ip:$port. Skipping it.\n";
    return (undef);
}



sub _remove_udp_socket {
    my ($self, $ip) = @_;
    my $port = $self->{'port'};
    my ($sock, $i, $count_removed);

    #
    # This subroutine will FIND the IP:port pair and remove it from
    # the list of server sockets.  The caller must be updating the server_ips
    # list.  This function only operates on the @server_sockets list.
    #
    $count_removed = 0;
    $i = 0;
    foreach $sock (@{ $self->{'server_sockets'} }) {
	if ($ip eq $sock->peeraddr()) {
	    # print STDERR "Debug: removing socket for $ip:$port.\n";
	    # This extracts and REMOVES one item from the list.
	    my $old_sock = splice (@{ $self->{'server_sockets'} }, $i, 1);
	    $old_sock->close();
	    $count_removed++;
	}
	$i++;
    }
    return ($count_removed);
}


#
# This routine tests to see if a DNS update is necessary (this encapsulates
# the TIMER UPDATES for the DNS resolution) - and if the DNS rotor IP list
# has changed, then it figures out the differences and removes/adds any
# sockets needed to change its current state to the new state.
#
sub _update_dns {
    my ($self) = @_;
    my $curtime = time();
    
    
    # Not time yet to do a DNS lookup.
    if ($curtime < $self->{'next_dns_update'}) {
	return (1);
    }

    # print STDERR "Updating DNS lookup...\n";
    
    my @new_ips = $self->_resolve_dns ($self->{'stethoscopeHost'});
    #
    # Handle case where the DNS lookup failed during this update.
    #
    if (scalar(@new_ips) == 0) {
	# Reschedule a DNS lookup for the DNS Failure Retry Interval
	$self->{'next_dns_update'} = $curtime + 60 * $self->{'dnsFailureRetryMinutes'};
	return (undef);
    }
    
    # So now we have the @new_ips list.  Now we must compare
    # the @new_ips with the @server_ips, and apply any ADD/REMOVE operations
    # to get the two lists in SYNC.
    
    # Step 1: make a copy of the old IP list, but sort it.
    my @old_ips = sort @{ $self->{'server_ips'} };
    
    # Step 2: sort our copy of the new ips so we can walk both.
    @new_ips = sort @new_ips;
    
    # Step 3: walk both lists and do add/remove as necessary
    my ($old_idx, $new_idx) = (0, 0);
    while ($old_idx <= $#old_ips && $new_idx <= $#new_ips) {
	
	# Case 1: old_idx is past the end of @old_ips.
	if ($old_idx > $#old_ips) {
	    # Simple case: @new_ips is longer. Add the IP from $new_idx
	    # and move the $new_idx pointer forward
	    $self->_add_udp_socket ($new_ips[$new_idx]);
	    $new_idx++;
	    next;
	}
	
	# Case 2: new_idx is past the end of @new_ips
	if ($new_idx > $#new_ips) {
	    # Simple case: @old_ips is longer. Remove the IP from $old_idx
	    # and move the $old_idx pointer forward
	    $self->_remove_udp_socket ($old_ips[$old_idx]);
	    $old_idx++;
	    next;
	}
	
	#
	# Case 3: neither old_idx nor new_idx are past the end of their
	# lists, so we have 2 possibilities, the 2 IPs are the same (no change)
	# or the 2 IPs are different (remove AND add and move forward.)
	# Case 3a: both ips are the same, do nothing but advance both pointers,
	#
	if ($old_ips[$old_idx] == $new_ips[$new_idx]) {
	    #
	    # IPs are the same, so do nothing except advance pointers.
	    #
	} else {
	    # Case 3b: the two IPs differ.  remove the old and add the new.
	    # and advance the pointers.
	    #
	    $self->_remove_udp_socket ($old_ips[$old_idx]);
	    $self->_add_udp_socket ($new_ips[$new_idx]);
	}
	# Advance both pointers.
       	$old_idx++;
	$new_idx++;
    }

    # And last but not least, update the object's list of its own IPs
    @{ $self->{'server_ips'} } = @new_ips;
    
    $curtime = time();
    $self->{'next_dns_update'} = $curtime + 60 * $self->{'dnsRefreshIntervalMinutes'} + rand(60);
    return (1);
}


# Internal function to perform a DNS lookup on a hostname, allowing
# for multiple IPs to be returned.
#
# If this successfully resolves, then return the list of ips
# otherwise return a list containing 0 values.  The caller must
# test the returned list's # of elements to determine the success or
# failure.
#
sub _resolve_dns {
    my ($self, $hostname) = @_;
    my ($name, $aliases, $addrtype, $length, @addrs) = gethostbyname( $hostname );
    my ($addr, @ips);

    @ips = ();

    # the @addrs is empty on a failed DNS lookup.  Return the empty @ips array
    # when this happens.
    if (scalar(@addrs) == 0) {
	return ( @ips );
    }

    # Now build a list of IPs as strings so the caller doesn't need to do it.
    foreach $addr (@addrs) {
	my $ip = inet_ntoa ($addr);
	if (defined ($ip)) {
	    push (@ips, $ip);
	}
    }

    return (@ips);
}

    
#
# This internal function is a wrapper that calls each individual
# validation routine and if ANY of them fail, then this function
# returns failure (undef).  Success is returned as 1
#
sub _validate_all {
    my ($self) = @_;
    my ($ret);
    
    $ret = $self->_validate_program_name($self->{'programName'});
    if (! $ret) {
	return (undef);
    }
    
    $ret = $self->_validate_id($self->{'uniqueID'});
    if (! $ret) {
	return (undef);
    }

    $ret = $self->_validate_groupID($self->{'groupID'});
    if (! $ret) {
	return (undef);
    }

    $ret = $self->_validate_maxheartbeatage($self->{'maxHeartbeatAge'});
    if (! $ret) {
	return (undef);
    }

    $ret = $self->_validate_minalarminterval($self->{'minAlarmInterval'});
    if (! $ret) {
	return (undef);
    }
    return (1);
}


#
# return the version string for this perl module, this comes
# from the CVS revision string (auto-updated)
#
sub getMyVersion {
    return ($VERSION);
}


#
# return the number of servers that were found in the DNS record
#
sub getNumServers {
    my ($self) = @_;
    return (scalar (@{ $self->{'server_ips'} }));
}



# getter/setter for programName
sub setProgramName {
    my ($self, $name) = @_;

    if (! $self->_validate_program_name($name)) {
	return (undef);
    }
    $self->{'programName'} = $name;
    return (1);
}

sub getProgramName {
    my ($self) = @_;
    return ($self->{'programName'});
}



# getter/setter for uniqueID
sub setUniqueID {
    my ($self, $id) = @_;

    if (! $self->_validate_id($id)) {
	return (undef);
    }
    $self->{'uniqueID'} = $id;
    return (1);
}

sub getUniqueID {
    my ($self) = @_;
    return ($self->{'uniqueID'});
}


# getter/setter for maxHeartbeatAge
sub setMaxHeartbeatAge {
    my ($self, $age) = @_;

    if (! $self->_validate_maxheartbeatage($age)) {
	return (undef);
    }
    $self->{'maxHeartbeatAge'} = $age;
    return (1);
}

sub getMaxHeartbeatAge {
    my ($self) = @_;
    return ($self->{'maxHeartbeatAge'});
}



# getter/setter for minAlarmInterval
sub setMinAlarmInterval {
    my ($self, $age) = @_;

    if (! $self->_validate_minalarminterval($age)) {
	return (undef);
    }
    $self->{'minAlarmInterval'} = $age;
    return (1);
}

sub getMinAlarmInterval {
    my ($self) = @_;
    return ($self->{'minAlarmInterval'});
}


# getter/setter for groupID
sub setBudgetCode {
    my ($self, $age) = @_;

    if (! $self->_validate_groupID($age)) {
	return (undef);
    }
    $self->{'groupID'} = $age;
    return (1);
}

sub getBudgetCode {
    my ($self) = @_;
    return ($self->{'groupID'});
}



#
# Internal input validation functions.
# _validate_*() - returns 1 on valid input, and undef on bad input.
#
# also prints to STDERR an explanation of what is wrong.
#
sub _validate_program_name {
    my ($self, $name) = @_;
    
    # Permit only characters that are:
    # a-z  A-Z  0-9  _ - / .
    
    if (! defined ($name)               ||
	length ($name) < 1              ||
	$name =~ /[^a-zA-Z0-9_\-\.\/]/  ||
	$name =~ /\s/) {
	print STDERR "Invalid programName: \"$name\" (must be 1 char or more with no spaces)\n";
	return (undef);
    }
    return (1);
}

sub _validate_id {
    my ($self, $id) = @_;

    if (! defined ($id) ||
	$id !~ /^\d+$/) {
	print STDERR "Invalid uniqueID: \"$id\"\n";
	return (undef);
    }
    return (1);
}

sub _validate_groupID {
    my ($self, $code) = @_;

#    if (! defined ($code) ||
#	$code !~ /^\d\d\d\d\d-\d\d\d$/) {
    if (! defined $code) {
	print STDERR "Invalid groupID: \"$code\"\n";
	return (undef);
    }
    return (1);
}


sub _validate_maxheartbeatage {
    my ($self, $age) = @_;

    if (! defined ($age) ||
	$age !~ /^\d+$/ ||
	$age < $MIN_TIME ) {
	print STDERR "Invalid maxHeartbeatAge: \"$age\" (Minimum value is $MIN_TIME milliseconds)\n";
	return (undef);
    }
    return (1);
}

sub _validate_minalarminterval {
    my ($self, $age) = @_;

    if (! defined ($age) ||
	$age !~ /^\d+$/ ||
	$age < $MIN_TIME ) {
	print STDERR "Invalid minAlarmInterval: \"$age\"  (Minimum value is $MIN_TIME milliseconds)\n";
	return (undef);
    }
    return (1);
}


1;
