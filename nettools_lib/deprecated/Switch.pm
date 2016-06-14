######################################################################################
# Package:  Nettools::Switch
# Author:  Dave Steinbrunn
# Date: 15 Sep 99
# Version:  1.5
#
# Description: oop way to talk to switches 
#
# NOTE:  module only works with foundry switches at the moment
#
# Available Methods:
#
#	boundReal()		returns hash keyed by port showing real servers
#				bound to that port number in a virtual server
#	configRealServer()	put real server (tfep) in or out of service
#					and/or change its weight	
#	configPort()		add or remove a port from a switch
#	debug()			turn on debuging. pass filehandle to send messages 
#					to 
#	do()			perform command on switch, multiple commands can be
#					seperated by a ;
#	enable()		sets and/or returns enable password
#	forceRefresh()		refreshs cached copy of switch config
#	getRealServer()		retrieves real server config information
#	listPorts()		list ports on a server (see method documentation)
#	listServers()		list servers configured on switch (real and virtual)
#	name()			returns name of switch
# 	new()			Constructor. 
#	operator()		sets and/or returns operator password
#	root()			sets and/or returns root password
#	serverCacheGroup()	query and enable/disable the sever Cache-Group
#	showConfig()		display results of running a show config command	
#	type()			sets and/or returns switch type
#	
# Private methods
#
#	login()			establish connection to switch
#	
#
# Note:  when object is initially created, this module will connect to switch
#	 and issue the "show conf" command, storing the results in @{$self->{config}}.
#	 All other methods will then access the data stored in this instance variable.
#	 This saves a lot of time from having to reconnect and issue multiple config term
#	 commands.  To force a refresh of the config stored, use the forceRefresh method. You
#	 can also disable retrieving the config.  see new() for details.
#	 
#			
#
# Changes
# 20 Sep 99	DJS	created inital script
#
# 22 Sep 99	RGM	added method serverCacheGroup()
#
# 11 Oct 99	DJS	autoflush the filehandle returned by Net::Telnet
#			modified do method to handle multiple commands
#			added listLocation param to new method
#			added switchlist method
#
# 14 Oct 99	DJS	modified changing real server status in realServer()
#			method
#
# 15 Oct 99	DJS	added configPort method
#			added listPorts() method
#			added listServers() method
#			added the boundReal() method
#
# 2 Feb 00	DJS	changed useList param and removed listLocation param in new()
#			tweaked code not to bitch when using perl -w (strict)
#			combined log and debug method, eliminating log method
#				alltogether
#			added caching of config into @{$self->{config}};
#			added showConfig method
#			added forceRefresh method
#			modified various list* methods to use cached config
#			added ping test to login method
#			added ability to pass multiple real servers in method realServer()
#			changed name of realServer method to configRealServer
#			added getRealServer method
#			
#


package Nettools::Switch;

use Net::Telnet;
use FileHandle;

######################################################################################
# method:  boundReal
# description:  returns hash keyed by port number listing real servers bound to 
#		that port in a virtual server
#
# params
#	virtual		virtual server name
#	port		specific port number (scalar or arrayref)
#	array		return data in array format (set to non-null)
#
#	Note:  If port number is not provided, all ports will be returned
#
# examples
#
# 	view realservers bound to port 4662 on virtual server sn-vip
#
#		%hash = $obj->boundReal( virtual => "sn-vip",
#					 port => "4662");
#		print "real servers on 4662: $hash{4662}\n";
#
#	view realservers bound to ports 4662 and 10407 on sn-vip
#
#		%hash = $obj->boundReal( virtual => "sn-vip",
#					 ports => ["4662","10407"]);
#		foreach $port (keys %hash){
#			print "$port   $hash{$port}\n";
#		}
#
#
#	view realservers bound to all ports on sn-vip in array format	
#
#		%hash = $obj->boundReal( virtual => "sn-vip",
#					 array => 1);
#		foreach $port (keys %hash){
#			print "$port:\n";
#			foreach $server (@{$hash{$port}){
#				print "\t$server\n";
#			}
#		}
#

sub boundReal{
	
	my $self = shift;
	my $param = { @_ };
	my $is_ref;
	my @ports;
	my $port;
	my $line_port;
	my $line;
	my @virtual_config;
	my @config;
	my $server;
	my $start;
	my %return_hash;
	my @temp;
	my $item;

	
	# determine virtual server name
	if ($param->{virtual}){
		$server = $param->{virtual};
	} else {
		print STDERR "Nettools::Switch error - You must provide a virtual server name for method boundReal";
		exit;
	}

	# determine port numbers requested
	if ($param->{port}){
		$is_ref = ref($param->{port});
		if ($is_ref){
			@ports = @{$param->{port}};
		} else {
			push(@ports, $param->{port});
		}
	}

	@config = @{$self->{config}};

	# pare down the config array to only contain the bound port info of 
	# the virtual server
	$| = 1;
	foreach $line (@config){
		if ($line =~ /server virtual $server/){
			$start = 1;
		}
		if ($start){ 
			if ($line =~ /\sbind/){
				push(@virtual_config, $line);
			} elsif ($line =~ /^!/){
				$start = 0;
				last;
			}
		}
	}

	# now sort out what is bound to what
	# user requested specific port numbers
	if ($param->{port}){
		foreach $port (@ports){ 
			foreach $line (@virtual_config){
				if ($line =~ /$port/){
					chop $line;
					if ($line =~ /^\sbind\s+(\S+)/){
						$port = $1;
						@temp = split(/\s+/,$line);
						foreach $item (@temp){
							if ($item){
								if ($item ne "bind" && $item ne $port){
									$return_hash{$port} .= "$item,";
								}
							}
						}
					}
				}
			}
		}

	# user wants to see all ports
	} else {
		foreach $line (@virtual_config){
			chop $line;
			if ($line =~ /^\sbind\s+(\S+)/){
				$port = $1;
				@temp = split(/\s+/,$line);
				foreach $item (@temp){
					if ($item){
						if ($item ne "bind" && $item ne $port){
							$return_hash{$port} .= "$item,";
						}
					}
				}
			}
		}
	}

	# either convert to array or remove trailing comma from each value of return_hash
	foreach $item (keys %return_hash){
		chop $return_hash{$item};
		if ($param->{array}){
			$return_hash{$item} = [split(/,/,$return_hash{$item})];
		}
	}	
	
	return %return_hash;

}

######################################################################################
# method:  configPort
# description:  add or remove a port number for a real or virtual server on 
#		a switch
#
# NOTE:  This method does not bind a real server to a port in a virtual server
#	 config, to do that use the realServer() method
# 
# params passed:
#
#	action		add or remove
#	all		set port number for all real and virtual servers
#	port		port number(s) (scalar or arrayref)
#	real		real server name (scalar or arrayref)
#	virtual	 	virtual server name
#
# return value:
#	none
#
# examples:
#	add port 742 to all servers on switch
#		$obj->configPort( port => "742",
#			          all => 1,
#				  action => "add");
#
#	remove ports 742 and 743 from real servers tfep-blah1 and 2
#		$obj->configPort( port => ["742", "743"],
#				  real => ["tfep-blah1","tfep-blah2"],
#				  action => "remove"); 
#

sub configPort{

	my $self = shift;
	my $param = { @_ };

	my $is_ref;
	my @ports;
	my @servers;
	my $port;
	my $server;
	my %servers;
	my $item;
	my $action;
	my $got_server;
	my @temp;
	my $type;
	
	# determine port numbers
	if ($param->{port}){
		$is_ref = ref($param->{port});
		if ($is_ref){
			@ports = @{$param->{port}};
		} else {
			push(@ports, $param->{port});
		}
	} else {
		print STDERR "Nettools::Switch error - You must provide a port number for method configPort()";
		exit;
	}

	# determine servers
	if ($param->{real}){
		$is_ref = ref($param->{real});
		if ($is_ref){
			$servers{real} = \@{$param->{real}};
		} else {
			push(@temp, $param->{real});
			$servers{real} = \@temp;
		}
		$got_server = 1;
	}
	if ($param->{virtual}){
		$servers{virtual} = ["$param->{virtual}"];
		$got_server = 1;
	}
	if ($param->{all}){
		%servers = &listServers($self, array => 1);
		$got_server = 1;
	}

	if (! $got_server){
		print STDERR "Nettools::Switch error:  You must provide server name for method configPort()";
		exit;
	}
		
	# determine action
	if ($param->{action}){
		$action = $param->{action};
	} else {
		print STDERR "Nettools::Switch error:  You must provide an action for method configPort()";
		exit;
	}
		
	# connect to switch and enter config mode	
	my $switch = login($self);

	# enter config mode
	$switch->cmd("conf term");

	# make changes
	foreach $type (keys %servers){
		foreach $server (@{$servers{$type}}){
			if ($type eq "real"){
				$switch->cmd("server real $server");
			} elsif ($type eq "virtual"){
				$switch->cmd("server virtual $server");
			}
			foreach $port (@ports){
				if ($action eq "add"){
					$switch->cmd("port $port");
				} elsif ($action eq "remove"){
					$switch->cmd("no port $port");
				}
			}
			$switch->cmd("exit");
		}
	}
	$switch->cmd("exit");

	# commit the change
	$switch->cmd("wr mem");
	$switch->waitfor("/Write startup-config done/");
	$switch->cmd("\n");
	$switch->print("exit");
	
	# close the connection
	$ok = $switch->close();

}

######################################################################################
# method: debug
# description:  activevates debug mode.  must pass filehandle  pass
#		null value to deactivate debug mode. See new() method for example
#

sub debug{

	my $self = shift;
	my $debug;

	if ($_[0]){
		$debug = $_;
		print $debug "\nDEBUG\tNettools::Switch is in debug mode\n\n";
		$self->{"debug"} = $debug;
	} else {
		print $debug "\nDEBUG\tNettools::Switch debug mode off\n\n";
		$self->{"debug"} = "";
	}

}

######################################################################################
# method: do
# description:  perform command on switch
#
# params:
#	command issued to switch, semi-colon delimated
#
# return:
#	array containg results of issuing command
# 
# example:
#
#	show config on switch
#		@output = $obj->do("sho conf");	
#		foreach $line (@output){
#			print $line;
#		}
#

sub do{

	my @output;
	my @return;
	my $line;
	my $push;
	my $self = shift;
	my $command;
	my $debug;

	if ($self->{"debug"}){
		$debug = $self->{"debug"};
	}


	my @command = split(/;/,$_[0]);

	# first login to switch
	my $switch = login($self);

	foreach $command (@command){
		print $debug "DEBUG\tperforming $command\n" if $debug;

		push(@output, $switch->cmd("$command"));
	}

	$switch->print("exit");

	$switch->close();

	return @output;
}
	

	

######################################################################################
# method:  enable
# description:  returns and/or sets enable password
#

sub enable{

	my $self = shift;
	my $debug;

	if ($self->{"debug"}){
		$debug = $self->{"debug"};
	}

	if ($_[0]){
		print $debug "DEBUG\tsetting self->{enable} to $_[0]\n" if $debug;
		$self->{enable} = $_[0];
	}

	return $self->{enable};
}

######################################################################################
# method:  forceRefresh
# description:  forces a refresh of the config store in cache (@{$self->{config}}).
#
# params 
#	none
#
# return value
#	config in array format
#


sub forceRefresh{

	my $self = shift;

	@{$self->{"config"}} = &do($self, "sho conf");

	return @{$self->{"config"}};

}	

######################################################################################
# method:  getRealServer
# description:  determines how a real server is configured on switch
#		and returns data
#
# params:
# 	real		real server name (scalar or arrayref)
#
# return value:
#	hash keyed by real server name with the following values
#
#	IP		IP address of real server
#	PORTS		comma delimated listing of ports supported
#	WEIGHT		weight of server	
#	
#
# example:
#
# 	get weight of real server sn1
#	%hash = $obj->getRealServer( real => "sn1");o
#	print "weight:  $hash{sn1}->{WEIGHT}\n";
#

sub getRealServer{

	my $self = shift;
	my $param = { @_ };

	my $collect;
	my $ip;
	my $is_ref;
	my $line;
	my @real;
	my $real;
	my $real_list;
	my $return;

	# determine how real servers were sent to us
	if ($param->{real}){
		$is_ref = ref($param->{real});
		if ($is_ref){
			@real = @{$param->{real}};
		} else {
			push(@real, $param->{real});
		}
	} else {
		print STDERR "Nettools::Switch error:  You must provider real server name for method getRealServer\n";
		exit;
	}

	# retrieve the config
	$real_list = join(",", @real);
	foreach $line (@{$self->{config}}){	
		if ($line =~ /^server\s+real\s+(\S+)\s+(\S+)/){
			$real = $1;
			$ip = $2;
			if ($real_list =~ /$real/){
				$collect = 1;
				$return{$real}->{IP} = $ip;
			}
		}
		if ($collect && $line =~ /weight\s+(\d+)/){
			$return{$real}->{WEIGHT} = $1;
		}
		if ($collect && $line =~/port\s+(\S+)/){
			$return{$real}->{PORT} .= "$1,";
		}
		if ($collect && $line =~ /!/){
			$collect = "";
		}
	}
	
	foreach $real (keys %return){
		chop $return{$real}->{PORT};
		if (! $return{$real}->{WEIGHT}){
			$return{$real}->{WEIGHT} = 1;
		}
	}

	return %return;
}

######################################################################################
# method:  listPorts
# description:  list configured ports on a switch.  Currently only works with foundry
#		switches
#
# NOTE:  this method only shows the protocols a virtual server supports overall,
#	 it does not show which real servers are bound to each port.  use
#	 the boundReal method to display that information
#
# params passed:
#	server		server name (pass all to display all)
#
# 	Note:	if no value is passed, all values will be returned
#
#	array 		return values in array format
#
# return values:
#	hash containing comma delimated port numbers, unless array format
# 	is requested
#
# examples:
# 
#	to retrieve configured ports for real server tfep-blah
#
#		%ports = $obj->listPorts( server => "tfep-blah");
#		print "ports: $ports{tfep-blah}\n";
#
#	to retrive configured ports for real servers tfep-blah1 and 2, and virtual
#	server blah-vip in array format
#
#		%ports = $obj->listPorts( server => ["tfep-blah1", "tfep-blah2","blah-vip"],
#					  array => 1);
#
#		foreach $server (keys %ports){
#			foreach $port (@{$port{$server}}){
#				print "$port\n";
#			}
#		}
#
#		 
#			

sub listPorts{

	my $self = shift;
	my $param = { @_ };
	my $is_ref;
	my @servers;
	my $server;
	my %servers;
	my $item;
	my @config;
	my $line;
	my %return_hash;
	my $start;

	if ($param->{server} eq "all" || ! $param->{server}){
		%servers = &listServers($self);
		foreach $item (keys %servers){
			push(@servers, split(/,/,$servers{$item}));
		}
	} else {
		$is_ref = ref($param->{server});
		if ($is_ref){
			@servers = @{$param->{server}};
		} else {
			push(@servers, $param->{server});
		}
	}

	# connect to switch	
	@config = @{$self->{config}};


	# pull port numbers out for each server requested
	foreach $server (@servers){
		foreach $line (@config){
			if ($line =~ /$server/){
				$start = 1;
			}
			if ($start){
				if ($line =~ /port\s+(\S+)/){
					$return_hash{$server} .= "$1,";
				} elsif ($line =~ /^!/){
					$start = "";
				}
			}
		}
	}


	if ($param->{array}){
		foreach $item (keys %return_hash){
			chop $return_hash{$item};
			$return_hash{$item} = [ split(/,/, $return_hash{$item}) ];
		}
	} else {
		foreach $item (keys %return_hash){
			chop $return_hash{$item};
		}
	}

	return %return_hash;
}
	




######################################################################################
# method:  listServers
# description:  returns hash listing of real and virtual servers configured on box
#
# params passed:
#	array		return values in array format (default is comma delimated)
# 
# return values:
#	hash listing of virtual and real servers (see example)
#
# example:
#
#      list servers on switch object
#		%servers = $obj->listServers();
#		print "virtual servers: $servers{virtual}\n";
#		print "real servers: $servers{real}\n";
#
#	list servers in array format
#		%servers = $obj->listServers( array => 1);
#		foreach $type (keys %servers){
#			foreach $server (@{$servers{type}}){
#				print "$type: $server\n";
#			}
#		}
#

sub listServers{

	my $self = shift;
	my $param = { @_ };
	my @config;
	my $line;
	my %return_hash;
	my $ok;
	my @temp;

	@config = @{$self->{"config"}};
	
	# loop through config looking for real and virtual servers
	foreach $line (@config){
		if ($line =~ /server real (\S+)/){
			$return_hash{real} .= "$1,";
		} elsif ($line =~ /server virtual (\S+)/){
			$return_hash{virtual} .= "$1,";
		}
	}
	chop $return_hash{real};
	chop $return_hash{virtual};

	if ($param->{array}){
		$return_hash{real} = [split(/,/,$return_hash{real})];
		$return_hash{virtual} = [split(/,/,$return_hash{virtual})];
	}

	return %return_hash;

}

######################################################################################
# method:  login  (private method)
# description:  login to switch and return reference to object created
#
  
sub login{

	my $self = shift;
	my $ping;
	my $debug;

	# see if we can ping switch before we try to connect.  if we can't, error out
	$ping = `/usr/sbin/ping $self->{name} -n 1`;
	if ($ping !~ /1 packets received/){

		print STDERR "Nettools::Switch error:  $self->{name} did not respond to ping.  Unable to connect to switch\n";
		exit;

	}

	
	# create Net::Telnet Object

	if ($self->{"debug"}){
		$debug = $self->{"debug"};
	}

	my $telnet = Net::Telnet->new( Timeout => 30,
                                       Host    => "$self->{name}");

	$telnet->autoflush();
	if ($debug){
		print $debug "DEBUG\tconnecting to $self->{name}\n";
	}
	# open log if necessary
	if ($debug){
		print $debug "DEBUG\topening $self->{'debug'} for logging with Net::Telnet\n";
		$telnet->input_log("$debug");
	}

	if ($self->{type} eq "foundry"){
		if (! $self->{"enable"}){
			print STDERR "Nettools::Switch error:  You must provide enable password";
		}		

		$telnet->open();
		$telnet->print("\n");
        	$telnet->print("en\n","$self->{'enable'}\n");
		$telnet->prompt('/\S+#$/');
		$telnet->print("skip-page-display");
	}

	return $telnet;

}

######################################################################################
# method: name
# description:  returns name of switch
#

sub name{

	my $self = shift;
	return $self->{name};

}

######################################################################################
# method:  new
# description:  object constructor.  The following arguments can be passed on 
#		object initialization:
#
#			debug		put in debug mode.  filehandle must be passed
#			enable		enable mode password
#			name		hostname of switch or ip address 
#					(required)
#			noConfig	do not get config (see note2 below).  set to
#					non-null
#			operator	operator password
#			root		root password
#			type		switch type (foundry, bay, etc)
#			useList		path to switch list file to obtain data.
#
#		note:  only name is required.  You must either provide
#		       the neccessary info or use the switchlist file
#		       for this module to work properly (duh!)
#
#		note2:  getting the config of the switch is a major time consuming
#			task (30 seconds for a large config).  By default, when you 
#			instantiate the switch object it pulls the config and caches
#			it to use later.  If you do not need to check the config
#			or use methods in this module that check the config, by setting
#			the noConfig flag you can substantially speed up the script.
#
#		$switch = new Nettools::Switch(
#			  name => blah.blah.aol.com,         #  switch name
#      		          debug  => *FILE,                   #  print to filehandle FILE
#               	  useList => "/path/switchlist.db"); #  use switchlist
#

sub new{

	# object init
	my $classname = shift;
	my $self = { @_ };
	bless($self, $classname);

	# set up method variables
	my $config_line;
	my $debug;
	my $grep_name;
	my $item;
	my $line;
	my $end;
	my $server;

	if ($self->{"debug"}){
		$debug = $self->{"debug"};
	}

	if (! $self->{"name"}){
		print STDERR "Nettools::Switch error:  you must provide switch name\n";
		exit;
	}

	if ($debug){
		print $debug "\nDEBUG\tNettools::Switch is in debug mode\n\n";
	}
		

	# determine if we need to get info from switchlist
	if ($self->{"useList"}){

		if (-e "$self->{useList}"){
			$self->{switchlist} = $self->{useList};
			delete $self->{useList};
			print $debug "DEBUG\tusing switchlist:  $self->{switchlist}\n" if $debug;
		} else {
			print STDERR "Nettools::Switch error:  Cannot access $self->{useList}: $!";
			exit;
		}
		
		# now grep out info on switch from switchlist
		if ($self->{"name"} =~ /^([^.]+)\./){
			$grep_name = $1;
		}
		$config_line = `/usr/bin/grep $grep_name $self->{switchlist}`;
		
		print $debug "DEBUG\tconfig_line:  $config_line\n" if $debug;

		if (! $config_line){
			print STDERR "Nettools::Switch error:  $grep_name not in $switch_file\n";
			exit;
		}

		chop $config_line;

		# break out config info
		# format in switchlist:
		# switch name, location, switch type, model, login, enable, budget code, budget name
		if ($config_line =~ /^([^,]+)?,([^,]+)?,([^,]+)?,([^,]+)?,([^,]+)?,([^,]+)?,/){
			$self->{"type"} = lc($3);
			$self->{"login"} = $5;
			$self->{"enable"} = $6;
		}
		
	}
	
	# retrieve config info, cache in @{$self->{config}}
	if (! $self->{"noConfig"}){
		@{$self->{"config"}} = &do($self, "sho conf"); 
	}
	
	if ($debug){
		print $debug "\nDEBUG\tvalues after init:\n";
		foreach $item (keys %{$self}){
			if ($self->{$item}){
				print $debug "DEBUG\t\tself->{$item} = $self->{$item}\n";
			}
		}
		print $debug "DEBUG\n";
	}		

	return $self;
}
			
######################################################################################
# method:  operator
# description:  sets and/or returns operator password
#

sub operator{

	my $self = shift;
	my $debug;

	if ($self->{"debug"}){
		$debug = $self->{"debug"};
	}
	
	if ($_[0]){
		print $debug "DEBUG\tsetting operator password to $_[0]\n" if $debug;
		$self->{operator} = $_[0];
	}
	
	return $self->{operator};
}

######################################################################################
# method: configRealServer
# description:  make status change (in or out) and/or change weight of real server
#		
# parameters passed:
#
#	real		name of real server  (scalar or arrayref)
#	virtual		name of virtual server
#	status		value to change status to (in or out)
#	weight 		value to change weight to
#       port		port number (required for status change).  This can be
#				scalar or arrayref.
#
# examples
#  
#	put tfep-blah into service with a weight of 3
#		object->configRealServer( real => "tfep-blah",
#			            	  virtual => "virtual name",
#	        	            	  weight => 3,
#				    	  port => "4662",
#				    	  status => "in");
#
#	change tfep-blah's status to out:
#		object->configRealServer( real => "tfep-blah",
#				    	  virtual => "virtual name",
#		    		    	  port => "4662",
#				    	  status => "out");
#

sub configRealServer{

	my $self = shift;
	my $param = { @_ };

	my $debug;
	my $is_ref;
	my $item;
	my $port;
	my @ports;
	my $status;
	my @real;
	my $real;
	my $virtual;

	if ($self->{"debug"}){
		$debug = $self->{"debug"};
	}
	
	# verify that a server name was passed
	if ($param->{real}){
		$is_ref = ref($param->{real});
		if ($is_ref){
			@real = @{$param->{real}};
		} else {
			push(@real, $param->{real});
		}
	} else {
		print STDERR "Nettools::Switch error:  You must provide real server name in method configRealServer()\n";
		exit;
	}

	if (! $param->{virtual}){
		print STDERR "Nettools::Switch error:  You must provide virtual server name in method configRealServer()\n";
		exit;
	}

	# verify that we got a port if status change was requested
	if ($param->{status}){
		if (! $param->{port}){
			print STDERR "Nettools::Switch error:  You must provide a port number for status change in method configRealServer()\n";
			exit;
		} else {
			$is_ref = ref($param->{port});
			if ($is_ref){
				@ports = @{$param->{port}};
			} else {
				push(@ports, $param->{port});
			}
		}
		$status = $param->{status};
		delete $param->{port};
	}

	$virtual = $param->{virtual};
	delete $param->{real};
	delete $param->{virtual};
	
	if ($self->{"debug"}){
		print $debug "DEBUG\tAttempting to make the following changes to real server(s) @real:\n";
		foreach $item (keys %{$param}){
			if ($item eq "status"){
				print $debug "DEBUG\tchanging status to $status for the following ports:\n";
				my $debug_port = join(",", @ports);
				print $debug "DEBUG\t\t$debug_port\n";
			} else {
				print $debug "DEBUG\tchanging $item to $param->{$item}\n";
			}
		}
	} 

	# connect to switch
	my $switch = login($self);
	
	# enter the correct config mode on switch
	$switch->cmd("conf term");

	# make config change
	if ($status){
		$switch->cmd("server virtual $virtual");
		foreach $port (@ports){
			foreach $real (@real){
				if ($status eq "in"){
					$switch->cmd("bind $port $real $port");
				} else {
					$switch->cmd("no bind $port $real $port");
				}
			}
		}
		$switch->cmd("exit");
	}

	if ($param->{weight}){
		foreach $real (@real){
			$switch->cmd("server real $real");
			$switch->cmd("weight $param->{weight}");
			$switch->cmd("exit");
		}
	}	

	# exit config mode
	$switch->cmd("exit");

	# commit the change
	$switch->cmd("wr mem");
	$switch->waitfor("/Write startup-config done/");
	$switch->cmd("\n");
	$switch->print("exit");
	
	# close the connection
	$ok = $switch->close();

	$switch = "";

}

######################################################################################
# method: root
# description:  sets and/or returns root password
#

sub root{

	my $self = shift;
	my $debug;

	if ($self->{"debug"}){
		$debug = $self->{"debug"};
	}

	if ($_[0]){
		print $debug "DEBUG\tsetting root password to $_[0]\n" if $debug;
		$self->{root} = $_[0];
	}

	return $self->{root};
}

################################################################################
# method: serverCacheGroup
# description:  get/set status (enable or disable) for a server cache-group
#		
# parameters passed:
#
#	group		(req) group number
#	status		value to change status to (enable or disable)
#
# examples
#  
#	enable Cache-group 1
#		object->serverCacheGroup( group => 1,
#				    status => "enable");
#
#	disable Cache-group 1
#		object->serverCacheGroup( group => 1,
#				    status => "disable");
#
#
#	query stats of Cache-group 1
#		object->serverCacheGroup( group => 1);
#

sub serverCacheGroup
{
	my $self = shift;
	my $param = { @_ };
	my $status;
	my $group;
	my $results = $param->{status};
	
	# verify that a group was passed
	if (! $param->{group}){
		print STDERR "Nettools::Switch error:  You must provide group number in method serverCacheGroup()\n";
		exit;
	} else {
		$group = $param->{group};
		delete $param->{group};
	}

	# check if we got status
	if ($param->{status}){
		if ($param->{status} eq "disable") {
			$status = $param->{status};
			} else {
			$status = "no disable";
		}
	}

	
	# connect to switch
	my $switch = login($self);
	
	# make config change
	if ($status){	# set the status
		# enter the correct config mode on switch
		$switch->cmd("conf term");
		$switch->cmd("server cache-group $group");
		$switch->cmd("$status");
		$switch->cmd("wr mem");

		# commit the change
		$switch->cmd("wr mem");
		$switch->waitfor("/Write startup-config done/");
		$switch->cmd("\n");
		$switch->print("exit");
	} else {	# get the current status

		my $line;
		my @output = $switch->cmd("show cache $group");

		foreach $line (@output){
			if ($line =~ /Admin-status/){
				chomp $line;
				$results = (split (/=/, $line))[1];
				last;
			} else {
				$results = "unknown";
			}
		}
	}

        # close the connection
	$ok = $switch->close();

	$switch = "";
	return $results;
}


######################################################################################
# method:  showConfig
# description:  shows config of switch.  this value is cached when object instance is
#		initialized.  to update this, use the forceRefresh method
#
# params:   
#	none
#
# return:
#	config in array format
#

sub showConfig{

	my $self = shift;

	return @{$self->{config}};

}

######################################################################################
# method: switchlist
# description:  returns location of switchlist used to obtain switch configuration
#		information.  This will only return a value if useList or 
#		listLocation parameters were used during object initialization
#

sub switchlist{

	my $self = shift;

	return $self->{switchlist};

}

######################################################################################
# method:  type
# description: 	sets and/or returns switch type (foundry, bay, etc)
#

sub type{

	my $self = shift;
	my $debug;

	if ($self->{"debug"}){
		$debug = $self->{"debug"};
	}

	if ($_[0]){
		print $debug "DEBUG\tsetting type to $_[0]\n" if $debug;
		$self->{type} = $_[0];
	}

	return $self->{type};
}












# required true return value


1

