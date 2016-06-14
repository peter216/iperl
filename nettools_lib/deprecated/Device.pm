######################################################################################
# Package:  Nettools::Device
# Author:  Wes Gurney
# Date: 22 Sep 1999
#
# Modified: Dave Steinbrunn code
#
# Description: Convienant way to talk to network devices
#
# Available Methods:
#
#	debug()			turn on (1) or off (0) debug mode.  prints out 
#				diagnositc messages to STDOUT
#	send()			perform command on device
#	enablepw()		sets and/or returns enable password
#	loginpw()		sets and/or returns login password
#	log()			sets and/or returns log 
#	name()			returns name of device
# 	new()			Constructor. 
#	type()			sets and/or returns device type (router, switch)
#	make()			sets and/or returns device make (cisco, foundry)
#	
# Private methods
#
#	login()			establish connection to switch
#	logout()		close connection to switch
#	
#			
#
package Nettools::Device;
use Net::Telnet;
use FileHandle;
######################################################################################
# method: debug
# description:  turns on (1) or off (0) debug mode
#

sub debug{

	my $self = shift;

	if ($_[0]){
		print "\nDEBUG\tNettools::Device is in debug mode\n\n";
		$self->{debug} = 1;
	} else {
		print "\nDEBUG\tNettools::Device debug mode off\n\n";
		$self->{debug} = "";
	}

}

######################################################################################
# method: send
# description:  perform command on a device
#

sub send{

	my @output;
	my $self = shift;

	my $command = $_[0];

	my $device = $self->{connection};
	print "DEBUG\tperforming $command\n" if $self->{debug};

	@output = $device->cmd("$command");
	
	return @output;
}
	

	

######################################################################################
# method:  enablepw
# description:  returns and/or sets enable password
#

sub enablepw{

	my $self = shift;
	if ($_[0]){
		print "DEBUG\tsetting self->{enable} to $_[0]\n" if $self->{debug};
		$self->{enablepw} = $_[0];
	}

	return $self->{enablepw};
}

######################################################################################
# method:  log
# description:  returns and/or sets log
# 
# examples
#  	to log to an already opened file handle:
#		$obj->log(*HANDLE);
#
#	to log to a file
#		$obj->log("log/location/file");
#
#

sub log{

	my $self = shift;
	if ($_[0]){
		print "DEBUG\tsetting self->{log} to $_[0]\n" if $self->{debug};
		$self->{log} = $_[0];
	}

	return $self->{log};
}


######################################################################################
# method:  login  (private method)
# description:  login to device and return reference to object created
#
 

sub login{
	# create Net::Telnet Object

	my $self = shift;
	
	if ($self->{timeout} eq "") {
		$self->{timeout} = 45;
	}

	my $telnet = Net::Telnet->new( Timeout => $self->{timeout},
				       Errmode => "return");
	$telnet->autoflush();
	if ( !($telnet->open($self->{name})) ) {
		return 0;
	}
	print "DEBUG\tconnecting to $self->{name}\n" if $self->{debug};
	# open log if necessary
	if ($self->{log}){
		print "DEBUG\topening $self->{log} for logging with Net::Telnet\n" if $self->{debug};
		$telnet->input_log("$self->{log}");
	}
	if ($self->{make} eq "foundry" && $self->{type} eq "router"){
		$telnet->open();
		$telnet->waitfor('/\S+>$/');
		$telnet->print("en");
                $telnet->waitfor('/Password:.*$/');
        	$telnet->print("$self->{enablepw}");
		$telnet->waitfor('/\S+#$/');
		$telnet->print("skip-page-display");
		$telnet->waitfor('/\S+#$/');
		$telnet->prompt('/\S+#$/');
	}
	elsif ($self->{make} eq "cisco") {
		$telnet->open();
		$telnet->waitfor('/Password:.*$/');
		$telnet->print("$self->{loginpw}");
		$telnet->waitfor('/\S+>$/');
		$telnet->print("en");
		$telnet->waitfor('/Password:.*$/');
		$telnet->print("$self->{enablepw}");
		$telnet->waitfor('/\S+#$/');
		$telnet->print("term len 0");	
		$telnet->waitfor('/\S+#$/');
		$telnet->prompt('/('.$name.'.*[#>]$|--More--)/i');
	}
	$self->{connection} = $telnet;
	return $self;

}
################################################################################
######
# method: logout
# description:  logsout of device
#
sub logout{

	my $self = shift;
	my $device = $self->{connection};
	$device->print("exit\n");
	$device->close;
}


######################################################################################
# method: name
# description:  returns name of device
#

sub name{

        my $self = shift;
        if ($_[0]){
                print "DEBUG\tsetting self->{name} to $_[0]\n" if $self->{debug};
                $self->{name} = $_[0];
        }
	
	return $self->{name};

}

######################################################################################
# method:  new
# description:  object constructor.  The following arguments can be passed on 
#		object initialization:
#
#			loginpw		login password
#			enablepw	enable password
#			log		log all activity.  to activate,
#					pass file name or handle
#			name		hostname of switch or ip address 
#					(required)
#			type		device type (router, switch)
#			make		device make (cisco, foundry)
#			debug		put in debug mode (set to non-null)
#
#		note:  only name is required.  You must either provide
#		       the neccessary info or use the switchlist file
#		       for this module to work properly (duh!)
#
#		$switch = new Nettools::Device(
#			name => blah.blah.aol.com,       #  switch name
#      		        log  => *FILE)                   #  print to filehandle FILE
#

sub new{

	# object init
	my $classname = shift;
	my $self = { @_ };
	bless($self, $classname);

	# set up method variables
	my $debug;

	if (! $self->{name}){
		print STDERR "Nettools::Device error:  you must provide device name\n";
		exit;
	}
	if (! $self->{type}) {
		print STDERR "Nettools::Device error:  you must provide a device type\n";
		exit;
	}

        if (! $self->{make}) {
                print STDERR "Nettools::Device error:  you must provide a device make\n";
                exit;
        }


	if ($self->{make} ne 'foundry' && $self->{make} ne 'cisco') {
		print STDERR "Nettools::Device error:  $self->{make} not a known type\n";
		exit;
	}

	if ($self->{debug}){
		$debug = 1;
		print "\nDEBUG\tNettools::Device is in debug mode\n\n";
	}

	if (! $self->{enablepw} && ! $self{loginpw}) {
		print STDERR "Nettools::Device error:  you must specify either an enable password or login password\n";
		exit;
	}	
	
	if ($debug){
		print "\nDEBUG\tvalues after init:\n";
		foreach $item (keys %{$self}){
			print "DEBUG\t\tself->{$item} = $self->{$item}\n";
		}
		print "DEBUG\n";
	}
	return $self;
}
			
######################################################################################
# method:  loginpw
# description:  sets and/or returns login password
#

sub loginpw{

	my $self = shift;
	
	if ($_[0]){
		print "DEBUG\tsetting login password to $_[0]\n" if $self->{debug};
		$self->{loginpw} = $_[0];
	}
	
	return $self->{loginpw};
}


######################################################################################
# method:  type
# description: 	sets and/or returns switch type (router, switch, etc)
#

sub type{

	my $self = shift;
	if ($_[0]){
		print "DEBUG\tsetting type to $_[0]\n" if $self->{debug};
		$self->{type} = $_[0];
	}

	return $self->{type};
}

################################################################################
######
# method:  make
# description:  sets and/or returns switch type (cisco, foundry)
#

sub make{

        my $self = shift;
        if ($_[0]){
                print "DEBUG\tsetting type to $_[0]\n" if $self->{debug};
                $self->{make} = $_[0];
        }

        return $self->{make};
}


# required true return value


1
