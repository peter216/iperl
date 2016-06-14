#####################################################################
# package:  Nettools::Network
# author:  Wes Gurney
# date:  10 Oct 2001
# version: 0.1
#
# description:  a way to get information about an IP address in the AOL network.  All information is gathered from networks.dat, switches.dat, and ports.dat
#		the current list of variables are:
#		{IP}->{oct}				octet IP address
#		{IP}->{dec}				decimal IP address
#		{IP}->{DNS}				DNS name according to ports.dat
#		{NetworkName}				network name IP address is on
#		{NetworkSubnetIP}			network subnet IP address is on in octet notation
#		{NetworkBroadcastIP}			network broadcast IP address is on in octet notation
#		{RouterName}->{[number]}		router name network is on
#		{RouterInterface}->{[number]}		router interface network is on
#		{RouterInterfaceIP}->{[number]}		router interface IP address in octet notation
#		{SwitchName}				switch name IP address is connected to
#		{SwitchVersion}				version of Foundry code for switch IP is connected to
#		{LowerNetworkIP}->{oct}			lower bound IP address for octet notation
#		{LowerNetworkIP}->{dec} 		lower bound IP address for dec notation
#               {UpperNetworkIP}->{oct} 		upper bound IP address for octet notation       
#               {UpperNetworkIP}->{dec} 		upper bound IP address for dec notation
#		{SwitchPort}				port on the switch IP is connected to 
#		{PortDuplex}				duplex of link between IP and switch 
#		{PortSpeed}				speed of link between IP and switch
#		{HostName}				hostname of the IP address
#		{MACAddress}				MAC Address of IP address
#	 	{LastUpdate}				epoch time port information was last collected		
#
#
# methods available:
#
#	new():				constructor
#	setoctIP():			sets the current IP address (octet notation)
#	setdecIP():			sets the current IP address (decimal notation)
#
# private methods:
#	getDecIP();			returns the decimal version of the IP address
#	getOctIP();			returns the octet version of the IP address
#	getHostName():			returns the DNS name of the IP addresses based on ports.dat
#	getNetworkName():		returns the network name of the IP address
#	getNetworkSubnetIP():		returns the network subnet of the IP address in octet notation
#	getNetworkBroadcastIP():	returns the networks broadcast of the IP address in octet notation
#	getRouterInfo():		gets the router name, router interface name, and router interface IP address and stores it in the $self object
#	getRouterInterfaceName():	returns the router interface name IP address is connected to
#	getRouterInterfaceIP():		returns the router interface IP that the IP address is connected to
#	getLowerNetworkIP():		returns the lower network IP
#	getUpperNetworkIP():		returns the upper network IP
#	getSwitchName():		returns the switch name the IP address is connected to
#	getSwitchPort():		returns the switch port the IP address is connected to
#	getMACAddress():		returns the MAC Address
#	getPortDuplex():		returns the Duplex
#	getPortSpeed():			returns the Speed
#	getLastUpdate():		returns the last time the information was updated in epoch
#	updateValues():			updates all variables based on current set IP address

######################################################################
package Nettools::Network;


########################################################################
# method:  getRouterInfo
# description:  gets the router name, router interface and router interface IP that the IP address is connected to in octet notation
#		it does this for all routers supporting the network and stores it in the $self object.
#
# example:
#
#       $IP->setRouterInfo();
sub getRouterInfo {
        my $self = shift;
	my $lineinfo, $line, $count=1;
	foreach $line (@{$network{$self->{IP}->{dec}}}) {
        	@lineinfo = split(/,/, $line);
		$self->{RouterName}->{$count} = $lineinfo[1];
		$self->{RouterInterfaceName}->{$count} = $lineinfo[9];
		$self->{RouterInterfaceIP}->{$count} = $lineinfo[2];
		$count++;
	}
        return $self;
}


########################################################################
# method:  getNetworkBroadcastIP
# description:  returns the network broadcast of the IP address in octet notation
#
# example:
#
#       $broadcast = $IP->getNetworkBroadcastIP();
sub getNetworkBroadcastIP {
        my $self = shift;
	foreach $line (@{$network{$self->{IP}->{dec}}}) {
        	my @lineinfo = split(/,/, $line);
		last;
	}
        return $lineinfo[6];
}

########################################################################
# method:  get NetworkSubnetIP    
# description:	returns the network subnet of the IP address in octet notation
#
# example:
#
#	$subnet = $IP->getNetworkSubnetIP();
sub getNetworkSubnetIP {
	my $self = shift;
	foreach $line (@{$network{$self->{IP}->{dec}}}) {
		my @lineinfo = split(/,/, $line);
		last;
	}
	return $lineinfo[3];
}

########################################################################
# method:  getLastUpdate
# description:  returns the epoch time of when the information aobut an IP address in ports.dat was last updated
#
# example:
#
#	$epochtime = $IP->getLastUpdate();
sub getLastUpdate {
	my $self = shift;
	my @lineinfo = split(/,/, $port{$self->{IP}->{oct}});
	return $lineinfo[3];
}
########################################################################
# method:  getMACAddress
# description:	returns the MAC Address of the IP address based on ports.dat
#
# example:
#
#	$MACAddress = $IP->getMACAddress();
sub getMACAddress {
	my $self = shift;
	my @lineinfo = split(/,/, $port{$self->{IP}->{oct}});
	return $lineinfo[8];
}

########################################################################
# method:  getHostName
# description:  returns the hostname of the IP address based on ports.dat
#
# example:
#
#	$hostname = $IP->getHostName();
sub getHostName {
	my $self = shift;
	my @lineinfo = split(/,/, $port{$self->{IP}->{oct}});
	return $lineinfo[2];
}	

########################################################################
# method:  getPortSpeed
# description:	returns the speed of the port the IP address is connected to based on ports.dat
#
# example:
#
#	$speed = $IP->getPortSpeed();
sub getPortSpeed {
	my $self = shift;
	my @lineinfo = split(/,/, $port{$self->{IP}->{oct}});
	return $lineinfo[5];
}
########################################################################
# method:  getPortDuplex
# description:	returns the duplex of the port the IP address is connected to based on ports.dat
#
# example:
#
#	$duplex = $IP->getPortDuplex();
sub getPortDuplex {
	my $self = shift;
	my @lineinfo = split(/,/, $port{$self->{IP}->{oct}});
	return $lineinfo[4];
}

########################################################################
# method:  getSwitchPort
# description:	returns the name of the port the IP address is connected to based on ports.dat
#
# example:
#
#	$switchname = $IP->getSwitchPort();
sub getSwitchPort {
	my $self = shift;
	 my @lineinfo = split(/,/, $port{$self->{IP}->{oct}});
	 return $lineinfo[1];
}

########################################################################
# method:  getSwitchPort
# description:	returns the name of the port the IP address is connected to based on ports.dat
#
# example:
#
#	$switchname = $IP->getSwitchPort();
sub getSwitchPort {
	my $self = shift;
	my @lineinfo = split(/,/, $port{$self->{IP}->{oct}});
	return $lineinfo[1];
}

########################################################################
# method:  getSwitchName
# description:  returns the name of the switch the IP address is connected to based on switches.dat
# 
# example:
#
#	$switchname = $IP->getSwitchName();
sub getSwitchName {
	my $self = shift;
	my @lineinfo = split(/,/, $switch{$self->{LowerNetworkIP}->{oct}});
	return $lineinfo[0];
}

########################################################################
# method:  getSwitchVersion
# description:  returns the version of Foundry code running on the switch
#
# example:
#
#	$switchversion = $IP->getSwitchVersion();
sub getSwitchVersion {
        my $self = shift;
        my @lineinfo = split(/,/, $switch{$self->{LowerNetworkIP}->{oct}});
        return $lineinfo[2];
}

	
########################################################################
# method:  getLowerNetworkOctIP
# description:  returns lower network IP address in octet notation
#
# example:
#
#	$lowerOctIP = $IP->getLowerNetworkOctIP
#
sub getLowerNetworkOctIP {
	my $self = shift;
	foreach $line (@{$network{$self->{IP}->{dec}}}) {
		my @lineinfo = split(/,/, $line);
		last;
	}	
	return $lineinfo[4];
}

########################################################################
# method:  getUpperNetworkOctIP
# description:  returns upper network IP address in octet notation
#
# example:
#
#       $upperOctIP = $IP->getUpperNetworkOctIP
#
sub getUpperNetworkOctIP {
        my $self = shift;
	foreach $line (@{$network{$self->{IP}->{dec}}}) {
        	my @lineinfo = split(/,/, $line);
		last;
	}
	return $lineinfo[6];
}

########################################################################
# method:  getLowerNetworkDecIP
# description:	returns lower network IP address in decimal notation
#
# example:
#
#	$lowerDecIP = $IP->getLowerNetworkDecIP
#
sub getLowerNetworkDecIP {
	my $self = shift;
	foreach $line (@{$network{$self->{IP}->{dec}}}) {
		my @lineinfo = split(/,/, $line);
		last;
	}
	return $lineinfo[5];
}

########################################################################
# method:  getUpperNetworkDecIP
# description:	returns upper network IP address in decimal notation
#
# example:
#
#	$upperOctIP = $IP->getUpperNetworkDecIP
#
sub getUpperNetworkDecIP {
	my $self = shift;
	foreach $line (@{$network{$self->{IP}->{dec}}}) {
		my @lineinfo = split(/,/, $line);
		last;
	}
	return $lineinfo[7];
}
   
########################################################################
# method:  getNetworkName
# description:  returns the AOL Network Name based on an IP and information in networks.dat
#
# example:
#
#	$networkname = $IP->getNetworkName();
#
sub getNetworkName {
	my $self = shift;
	foreach $line (@{$network{$self->{IP}->{dec}}}) {
		my @lineinfo = split(/,/, $line);
		last;
	}
	return $lineinfo[8];
}
	
########################################################################
# method:  getDecIP
# description:	returns a decimal version of an IP address  - useful for comparing IP address ranges
#
# example:
#
#	$decip = $IP->getDecIP();
sub getDecIP {
	my $self = shift;
	my @octs = split(/\./, $self->{IP}->{oct});
	return (256**3)*$octs[0]+(256**2)*$octs[1]+256*$octs[2]+$octs[3];
}
	
########################################################################
# method:  getOctIP
# description:  returns a octet version of an IP address
#
# example:
#	$octip = $IP->getOctIP();
sub getOctIP {
	my $self = shift;
	my $currentvalue, $tempvalue , $tempip;
	$currentvalue = $self->{IP}->{dec};
	$tempvalue = int $currentvalue / (256**3);
	$tempip = $tempvalue.".";
	$currentvalue = $currentvalue - $tempvalue*(256**3);
	$tempvalue = int $currentvalue / (256**2);
	$tempip .= $tempvalue.".";
	$currentvalue = $currentvalue - $tempvalue*(256**2);
	$tempvalue = int $currentvalue / 256;
	$tempip .= $tempvalue.".";
	$currentvalue = $currentvalue - $tempvalue*256;
	$tempip .= $currentvalue;
	return $tempip;
}

########################################################################
# method getHashInfo
# description:  sets $network, $switch, and $port hash with correct key information based on the set IP address
#
# example:
#
#	$self->getHashInfo();
sub getHashInfo	{
	my $self = shift;
	my $networksfile = "/opstools/prod/data/ip_info/networks.dat";
	my $switchesfile = "/opstools/prod/data/ip_info/switches.dat";
	my $line, $lowerhex, $upperhex, $i;
	my @lineinfo;
	
	if ($network{$self->{IP}->{dec}} eq "") {
		open (IN, "<$networksfile") || die "Error opening $networksfile";
		while (<IN>) {
			$line = $_;
                	chomp $line;
	 		if ($line !~ /^#/) {
	 			@lineinfo = split(/,/, $line);
	 			$lowerdec = $lineinfo[5];
	 			$upperdec = $lineinfo[7];
				if ($self->{IP}->{dec}>=$lowerdec && $self->{IP}->{dec}<=$upperdec) {
	 				for ($i = $lowerdec; $i<=$upperdec; $i++) {
	                        		push @{$network{$i}}, $line;
					}
	 			}
	 		}
        	}	
		close IN;
	}

	$self->updateValues(); # Update values before executing next block of code

	if ($switch{$self->{LowerNetworkIP}->{oct}} eq "") {
		open (IN, "<$switchesfile") || die "Error opening $switchesfile";
		while (<IN>) {
			$line = $_;
	 		chomp $line;
	 		if ($line !~ /^#/) {
	 			@lineinfo = split(/,/, $line);
				if ($self->{LowerNetworkIP}->{oct} eq $lineinfo[1]) {
	 				$switch{$lineinfo[1]} = $line;
				}
			}
	 	}
        }
	close IN;

	$self->updateValues(); # Update values again now that we have switch data

	return $self;
}

########################################################################
# method:  new
# description:	creates a new instance of the Network object
#
# example:
#
#	$IP = new Nettools::Network();	#creates a new instance
#	$IP = new Nettools::Network(IP=>oct=>"152.163.33.1");  #creates a new instance and initializes the IP address to 152.163.33.1
#
# params
#	IP		set initial IP to use
sub new {
	my $portsfile = "/opstools/prod/data/ip_info/ports.dat"; 
	my @lineinfo;
	my $line;

	open (IN, "<$portsfile") || die "Error opening $portsfile";
	while (<IN>) {
		$line = $_;
		chomp $line;
		if ($line !~ /^#/ ) {
	                @lineinfo = split(/,/, $line);
			$port{$lineinfo[7]} = $line;
		}
	}
        close IN;
	
	my $classname = shift;
	my $self = { @_ };
	bless($self, $classname);

	if (!$self->{IP}->{oct} && !$self->{IP}->{dec}) {
			$self->{IP}->{oct} = "0.0.0.0";
			$self->setOctIP($self->{IP}->{oct});
	}
	elsif ($self->{IP}->{oct} && !$self->{IP}->{dec}) {
		$self->setOctIP($self->{IP}->{oct});
	}
	elsif ($self->{IP}->{dec} && !$self->{IP}->{oct}) {
		$self->setDecIP($self->{IP}->{oct});
	}
	return $self;
}	

########################################################################
# method:  setOctIP
# description:  sets the IP addresses for the Network object (using octet notation)
#
# example:
#
#	$IP->setOctIP("152.163.33.1");  #sets the IP address to 152.163.33.1
#
# params
#	IP		IP address octet notation

sub setOctIP {
	my $self = shift;
	#$self->{IP} = $_[0];
	$self->{IP}->{oct} = $_[0];
	$self->{IP}->{dec} = $self->getDecIP();	
	$self->getHashInfo();
	return $self;
}

########################################################################
# method:  setDecIP
# description:  sets the IP addresses for the Network object (using decimal notation)
#
# example:
#
#	$IP->setDecIP("1876891");	#sets the IP address to 1876891 (152.163.33.1)
#
# params
#	IP		IP address octet notation
sub setDecIP {
	my $self = shift;
	#$self->{IP} = $_[0];
	$self->{IP}->{dec} = $_[0];
	$self->{IP}->{oct} = $self->getOctIP();
	$self->getHashInfo();
	return $self;
}

#########################################################################
# method:  updateValues
# description:  updates all variables with information based on current set IP address
#
# example:
#	$self->updateValues;
sub updateValues {
	my $debug = 0;
	my $self = shift;
	$self->getRouterInfo(); # Moved to top of method by GJONES
	$self->{HostName} = $self->getHostName();
	print "Hostname: " . $self->{HostName} . "\n" if $debug;;
	$self->{MACAddress} = $self->getMACAddress();
	print "MACAddress: " . $self->{MACAddress} . "\n" if $debug;;
	$self->{NetworkName} = $self->getNetworkName();
	print "NetworkName: " . $self->{NetworkName} . "\n" if $debug;;
	$self->{NetworkSubnetIP} = $self->getNetworkSubnetIP();
	print "NetworkSubnetIP: " . $self->{NetworkSubnetIP} . "\n" if $debug;;
	$self->{NetworkBroadcastIP} = $self->getNetworkBroadcastIP();
	print "NetworkBroadcastIP: " . $self->{NetworkBroadcastIP} . "\n" if $debug;;
	$self->{LowerNetworkIP}->{oct} = $self->getLowerNetworkOctIP();
	print "LowerNetworkIP(oct): " . $self->{LowerNetworkIP}->{oct} . "\n" if $debug;;
	$self->{LowerNetworkIP}->{dec} = $self->getLowerNetworkDecIP();
	print "LowerNetworkIP(dec): " . $self->{LowerNetworkIP}->{dec} . "\n" if $debug;;
	$self->{UpperNetworkIP}->{oct} = $self->getUpperNetworkOctIP();
	print "UpperNetworkIP(oct): " . $self->{UpperNetworkIP}->{oct} . "\n" if $debug;;
	$self->{UpperNetworkIP}->{dec} = $self->getUpperNetworkDecIP();
	print "UpperNetworkIP(dec): " . $self->{UpperNetworkIP}->{dec} . "\n" if $debug;;
	$self->{SwitchPort} = $self->getSwitchPort();
	print "SwitchPort: " . $self->{SwitchPort} . "\n" if $debug;;
	$self->{PortSpeed} = $self->getPortSpeed();
	print "PortSpeed: " . $self->{PortSpeed} . "\n" if $debug;;
	$self->{PortDuplex} = $self->getPortDuplex();
	print "PortDuplex: " . $self->{PortDuplex} . "\n" if $debug;;
	$self->{LastUpdate} = $self->getLastUpdate();
	print "LastUpdate: " . $self->{LastUpdate} . "\n" if $debug;;
	$self->{SwitchName} = $self->getSwitchName();
	print "SwitchName: " . $self->{SwitchName} . "\n" if $debug;;
	$self->{SwitchVersion} = $self->getSwitchVersion();
	print "SwitchVersion: " . $self->{SwitchVersion} . "\n" if $debug;;

	print "----------------------------------------------------------------------\n" if $debug;;

	return $self;
}

1;
