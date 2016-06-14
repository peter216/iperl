#############################################################################################################
# Package:  Nettools::Rotor
# author:   Dave Steinbrunn
# date: 29 Jul 99
#
# Version:  4.1
#
# description:  oop method of obtaining data from DNS Rotor Database
#
# NOTE:  this package requires NDBM_File to work
#
# generic methods:
#		
#		addConfigValue():  adds generic data to config database
#
#		calcPodUser():  calculate the max users a pod supports
#
#		calcPodWeight(): retrieve and summarize tfep weight info for a pod
#
#		calcSuggestedWeight(): calculates the suggested weight for tfeps
#			in a specified pod
#
#		changeTransit():  modifies transit provider config information
#
#		configDb(): sets and/or returns config database location
#
#		genLock():  generate lock file for rotor
#
#		getConfigData():  retrieve generic config data
#
#		getElements():  returns form elements for data categories
#
#		getLnsConfig():  returns lns config info
#
#		getMaxUsers():  returns string containing max user capcity of all tfeps
#
#		getNetId():  returns hash keyed by AT Provider of network ids
#
#		getPodConfig():  returns hash containing pod configs
#
#		getSiteConfig(): returns site config info
#
#		getSwitch():  searchs for switch name and ip info for a pod
#	
#		getTfepConfig():  returns hash containing tfep configs
#
#		getTfepUser():	return current user count on tfep
#
#		getTransit():  returns hash containing transit provider config info
#
#		listAccessProvider():  returns array listing of access providers
#
#		listCountry():  returns hash containing country codes keyed on country name
#
#		listClient(): returns array listing available clients (AOL,CS)
#
#		listL4():  returns array listing of all pods with l4 support configured
#
#		listLns():  returns array listing of lns servers
#			
#		listPods():  returns array of active pods
#
#		listPorts():  returns array listing of port numbers
#
#		listProtocol(): returns array listing of available protocols
#
#		listRaspServer():  returns a list of rasp server hosts
#
#		listRealm():  returns array listing of realms
#
#		listServers(): returns array listing available dns servers for
#			rotor to copy files to
#
#		listSite():  returns array listing service sites (i.e. Reston)
#
#		listTfeps():  returns array of tfeps
#
#		listTransit(): returns array listing of transit providers
#
#               listTransitPods():  returns hash of each provider and the pods that support them
#
#		lockFile():  sets and/or returns log file location
#
#		logEvent():  logs event to rotor event log
#
#		logFile():  sets and/or returns log file location
#
#		new():  object constructor
#
#		podDb(): sets and/or returns config database location
#
#		removeConfigValue:  removes a port number from the database
#
#		testlock():  tests to see if rotor is locked
#
#
#
# access/transit provider related methods
#
#		addAccessTransit(value):  adds access/transit provider with all initial values
#				 set to null
#
#		addATvalue(provider, category, value):  adds value to access provider config category
#
#		getAccessTransit(value): returns data on access tranit provider
#			        see method for further details
#
#		getDialZone():  retrieve zone name of dial provider.
#				see method for further details 
#
#		listAccessTransit():  array listing of access/transit providers
#
#		removeAccessTransit():  deletes access/transit provider
#
#		removeATvalue(provider, category, value): removes value from access provider config category		
#	
#
# Pod/Tfep/LNS configuration methods
#
#		changeAccess():  change whether or not a pod/tfep supports a dial provider
#
#		changeClient():  add/remove support for a client (aol, cs, etc)
#
#		changeIP():	change ip of device in database
#		
#		changeL2tp():  change l2tp provider support for lns
#
#		changeL4():  add/remove support for switching for a pod
#
#		changeProtocol(): add/remove support for a protocol
#
#		changeRealm():  add/remove support for a realm on a lns
#
#		changeStatus():  change the status of a pod or tfep
#
#		changeWeight():  change the actual weight (tfep only)
#
# Private methods:
#		changePod():   change pod info in config database 
#		changeTfep():  change tfep info in config database 
#
# Pod Database Setup
#
#	The pod database is a reflection of the data stored in the tih master file.
#	Data config:
#		Pod Fields:
#			transit provider; list of tfeps in pod; list of lnss in pod
#		Transit Provider Fields:
#			list of pods that support transit provider
#		berp/ipt fields:
#			transit provider; berp ip address (actual or vip of switch); ipt ip; max users; name 
#			of device as it appears in tih file
#		L2TP_POD:  listing of all pods that support l2tp
#		MAX_USER:  total max users that tfeps can support
#		POD:  list of all pods in tih file
#
# Config Database Setup
#	
#	The config database contains all configuration data for the rotor tool
#  	Data config (fields containg multiple values only):
#
#		Data Types available:
#			ACCESS			list of access providers
#			ACCESS/TRANSIT		list of access/transit providers
#			CLIENT			list of all clients (AOL, CS)
#			COUNTRY			list of countries
#			DNS			list of dns servers that host zone files
#			INACTIVE_POD  		listing of pods not currently in tih file, but were
#						at one time
#			L4_PODS			list of pods with switches
#			POD  			listing of all active pods (pods listed in tih file)
#			PORT			listing of all active ports rotor supports
#			PROTOCOL		list of all protocols
#			PROVIDER		list of all transit providers
#			RASP			list of all hosts running rasp process
#			REALM			list of all l2tp realms
#			SITE			list of data center locations
#			
#			Note:  data types are in all caps.  foreach data type, there is a database
#			       entry keyed by the data type in all lower caps that contains a 
#			       comma delimated list of the element names in the data type
#			
#		country fields:
#			country code
#		access provider fields:
#			name of dial provider.  all dial provider keys have _dp attached to the name
#			to help differentiate a dial provider from a transit provider of the same name
#		access/transit fields:
#			access provider/country = transit provider; services support; protocols supported;
#			nameservers provider uses; threshold alarms; P3 zone names; network id
#		pod fields:
#			status; service supported; protocol supported; dial providers not supported (not_dial);
#			;realms not supported (not_realm); l2tp providers not supported (not_l2tp); l4 switch name
#		site fields:
#			first octet of ip address range used at site, used when creating site specific
#			zone files
#		berp/ipt fields:
#			status; service supported; protocol supported; actual weight; 
#			dial providers not supported (not_dial); realms not supported (not_realm);
#			l2tp providers not supported (not_l2tp); date last change (epoch time in seconds)
#		Transit Provider Fields:
#			zone file name; resource ttl; cname usage; rotor config; rotor number; gcd usage
#		
# Changes:
#
#       Date            Author  Ver     Description
#       8/4/99          DJS     1.0     added getDialProvider, listDialProvider, addDialTransit,addDTvalue,
#                                               getDialTransit, getDialZone, listDialTransit,
#                                               removeDialTransit, removeDTvalue
#                                       changed name of old getDialTransit to listDialTransit
#                                       changed getDialZone to use values store in rotor databse
#
#       9/14/99         DJS             fixed internal reference bug, changed method of invocation to use hashes
#
#       9/21/99         DJS     1.1     added logEvent, lockFile, genLock, and testLock methods
#
#       9/22/99         DJS     1.2     added getPodConfig
#
#       9/23/99         DJS     1.3     added getTfepConfig, modified listTfeps to use named parameters
#
#       10/15/99        DJS     1.4     added listPorts 
#
#       10/18/99        DJS     2.0     added changeL4 and listL4 methods
#
#       10/19/99        DJS     2.1     added listLns, getLnsConfig
#
#       10/20/99        DJS     2.2     added listRealm, getElements, changed getDialProvider to getConfigData
#
#       10/27/99        DJS     2.3     changed naming of Dial methods to Access and Service values to Client
#
#       10/28/99        DJS     2.4     added net id field to AT data, added listNetId
#
#       11/5/99         DJS     2.5     added changeL2tp, modified changeStatus to config lns status
#
#       11/16/99        DJS     2.6     modified getPodConfig and getTfepConfig to use listAccessTransit method
#
#       11/22/99        DJS     2.7     modified getPodConfig and getTfepConfig to match exactly access providers
#                                               item supports
#
#       12/1/99         DJS             Fixed getPodConfig DIAL property to work better with split transit pods
#                                       Fixed getAccessTransit to accept transit and subset params at the same time
#
#       12/14/99        DJS     2.8     Added LAST_CHANGE parameter to tfep and lns configs.
#                                       added getTfepUser routine
#
#       12/20/99        DJS             Tightened up code to work with use strict
#
#       1/4/00          DJS     3.0     changed code to work with new database format (removed lns and tfep
#                                               designators)
#                                       added transit parameter to listPods method
#                                       added changePod and changeTfep, modified other change* methods to use
#                                               them
#                                       added pod parameter to changeL2tp and changeRealm
#                                       removed getName method
#
#	1/26/00		DJS	3.1	added TIH_NAME value to getTfepConfig method
#					fixed bug in getPodConfig in listing multiple values in REALM
#					fixed bug in changeRealm dealing with modifying pod_not_realm
#					added l2tp param to listPods
#					added l2tp param to getPodConfig
#					added listRealmPods	
#
#	2/4/00		DJS	4.0	started adding l4 code to Rotor.pm
#					added switch_list param to new method
#					added getSwitch method
#					removed action parameter in changeL4 method
#					added GCD field to transit provider data
#
#	3/4/00		DJS	4.1	added fields param to getPodConfig method
#
# 	4/11/00		DJS	4.2	added filed handle passing for getTfepConfig debug parameter
# 					added filed handle passing for listPods debug parameter
#					added changeIP method
#					added filehandle use for debug param in getPodConfig
#
#	5/23/00		DJS	4.3	added file handle passing for getLnsConfig debug parameter
#
#	5/25/00		DJS	4.4	tweaked getTfepConfig(), getPodConfig(), and getLnsConfig()
#						to work faster by eliminating some loops
#					added transit param to getLnsConfig
#
# 	6/9/00		DJS	4.5	fixed calcSuggestedWeight to work with 40K pods
#
#	6/20/00		DJS	4.6	added transit provider param to listL4 method
#					
#

package Nettools::Rotor;

use NDBM_File;
use POSIX;
use Socket;
use Time::Local;

###############################################################################
# sub addAccessTransit
# description:  creates new access transit provider relationship with all
#		fields set to null
#
# required parameter:  name of relationship to create
#

sub addAccessTransit{

	my $self = shift;

	my $dp;
	my %config;
	my $config_db = $self->{config_db};

	$dp = $_[0];

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	

	# create record
	$config{$dp} = ";;;;;";

	# add to access/transit list
	if ($config{"ACCESS/TRANSIT"} !~ /$dp/){
		$config{"ACCESS/TRANSIT"} .= ",$dp";	
	}

	dbmclose %config;
}


###############################################################################
# sub addATvalue
# description:  add a value to dt config
#
# required parameters:  provider, category, value
#		
# example:
#		addATvalue("Test/us","PROTOCOL","PPP");
#			adds ppp protocol to test/us 
#		
#		addATvalue("Test/us","ZONE_NAME","test.aol.com");
#			changes zone_name for Test/us to test.aol.com
#
#		addATvalue("Test/us","ALARM","PPP-AOL:5");
#			changes alarm threshold for the ppp aol zone file
#			to 5 percenet for test/us
#

sub addATvalue{
	
	my $self = shift;
	my $config_db = $self->{config_db};
	my ($dp, $category, $value);
	my %dp;
	my %config;
	my ($transit,$service,$protocol,$dns,$alarm,$zone_name, $net_id);
	my (@temp, $item);
	my ($pair, $threshold);
	my ($search);
	my $change_made;


	$dp = $_[0];
	$category = $_[1];
	$value = $_[2];

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	
        ($transit,$service,$protocol,$dns,$alarm,$zone_name,$net_id) = split(/;/,$config{"$dp"});


	# make change
	if ($category eq "TRANSIT"){
		if ($transit !~ /$value/){
			$transit = $value;
		}
	} elsif ($category eq "CLIENT"){
		if (! $service){
			$service = "$value";
		} elsif ($service !~ /$value/){
			$service .= ",$value";
		}
	} elsif ($category eq "PROTOCOL"){
		if (! $protocol){
			$protocol= "$value";
		} elsif ($protocol !~ /$value/){
			$protocol .= ",$value";
		}
	} elsif ($category eq "DNS"){
		if (! $dns){
			$dns = "$value";
		} elsif ($dns !~ /$value/){
			$dns .= ",$value";
		}
	} elsif ($category eq "ALARM"){
		($pair,$threshold) = split(/:/,$value); 
		@temp = split(/,/,$alarm);
		$alarm = "";
		foreach $item (@temp){
			if ($item =~ /$pair/){
				$alarm .= "$value,";
				$change_made = 1;
			} else {
				$alarm .= "$item,";
			}
		}
		if (! $change_made){
			if (! $alarm){
				$alarm = $value;
			} else {
				$alarm .= "$value";
			}
		} else {
			chop $alarm;
		}
	} elsif ($category eq "ZONE_NAME"){
		if ($value =~ /\.aol\./){
			$search = "aol";
		} elsif ($value =~ /\.cs\./){
			$search = "cs";
		}
		@temp = split(/,/, $zone_name);
		$zone_name = "";
		foreach $item (@temp){
			if ($item =~ /$search/){
				$zone_name .= "$value,";
				$change_made = 1;
			} else {
				$zone_name .= "$item,";
			}
		}
		if (! $change_made){
			if (! $zone_name){
				$zone_name = $value;
			} else {
				$zone_name .= "$value";
			}
		} else {
			chop $zone_name;
		}
	} elsif ($category eq "NET_ID"){
		if (! $net_id){
			$net_id= "$value";
		} elsif ($net_id !~ /$value/){
			$net_id .= ",$value";
		}
	}
		

	$config{"$dp"} = "$transit;$service;$protocol;$dns;$alarm;$zone_name;$net_id";
	dbmclose %config;
}

###############################################################################
# sub:  addConfigValue
# description:  adds a generic value to config database
#
# parameters
#	data_set	data set to modify (i.e.  PORT, COUNTRY, etc)
#	hash_value	hash value of new data added (optional)
#	name		name of data
#

sub  addConfigValue{

	my $self = shift;
	my $param = { @_ };

	my %config;
	
	dbmopen(%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	

	if ($param->{data_set} eq "ACCESS"){
		$param->{name} .= "_dp";
	}

	if ($config{"$param->{data_set}"} !~ /$param->{name}/){
		$config{"$param->{data_set}"} .= ",$param->{name}";
	}

	if ($param->{hash_value}){
		$config{"$param->{name}"} = "$param->{hash_value}";
	}

	dbmclose %config;

}

###############################################################################
# sub calcPodUser
# description:  summarize tfep max user information for a pod or pods
#
# parameters
#	pod		pod name(s), can be scalar or list if arrayref
#	transit 	retrieve info on pods belonging to a specific
#			transit provider
#
#	NOTE:  if no parameters are passed, all pods will be returned
#
# return values
#	hash keyed by pod name containing max user count
#
# examples
#
#	to view weight info on pod ba
#	%hash = $obj->calcPodUser( pod => "ba" );
#	print "pod ba max users: $hash{ba}\n";
#
# 	

sub calcPodUser{
	
	my $self = shift;
	my $param = { @_ };
	my $is_ref;
	my @transit;
	my @pods;
	my $pod;
	my %tfep_info;
	my $tfep;
	my %return_hash;


	# determine what data user has requested
	if ($param->{pod}){
		$is_ref = ref($param->{pod});
		if ($is_ref){
			@pods = @{$param->{pod}};
		} else {
			push(@pods, $param->{pod});
		}
	} elsif ($param->{transit}){
		$is_ref = ref($param->{transit});
		if ($is_ref){
			@transit = @{$param->{transit}};
		} else {
			push(@transit, $param->{transit});
		}
		@pods = &listPods($self, transit => \@transit);
	} else {
		@pods = &listPods($self);
	}

	foreach $pod (@pods){
		# retrieve tfep configs for pod
		%tfep_info = &getTfepConfig($self,pod => "$pod");	
		foreach $tfep (keys %tfep_info){
			$return_hash{$pod} += $tfep_info{$tfep}->{MAX_USER};
		}
	}

	return %return_hash;
}
					

###############################################################################
# sub calcPodWeight
# description:  summarize tfep weight information for a pod or pods
#
# parameters
#	pod		pod name(s), can be scalar or list if arrayref
#	transit 	retrieve info on pods belonging to a specific
#			transit provider
#
#	NOTE:  if no parameters are passed, all pods will be returned
#
# return values
#	hash keyed by pod name with following references to values:
#
#		ACTUAL		actual total weight of tfeps in pod
#		SUGGESTED	combined suggested weight of tfeps in pod
#
#		values are scalar
#
# examples
#
#	to view weight info on pod ba
#	%hash = $obj->calcPodWeight( pod => "ba" );
#	print "pod ba actual weight: $hash{ba}->{ACTUAL}\n";
#	print "pod ba suggested weight: $hash{ba}->{SUGGESTED}\n";
#
# 	

sub calcPodWeight{

	my $self = shift;
	my $param = { @_ };

	my $is_ref;
	my $num_tfeps;
	my @pods;
	my $pod;
	my %return_hash;
	my %suggested;
	my $tfep;
	my %tfep_info;
	my @transit;

	# determine what data user has requested
	if ($param->{pod}){
		$is_ref = ref($param->{pod});
		if ($is_ref){
			@pods = @{$param->{pod}};
		} else {
			push(@pods, $param->{pod});
		}
	} elsif ($param->{transit}){
		$is_ref = ref($param->{transit});
		if ($is_ref){
			@transit = @{$param->{transit}};
		} else {
			push(@transit, $param->{transit});
		}
		@pods = &listPods($self, transit => \@transit);
	} else {
		@pods = &listPods($self);
	}


	foreach $pod (@pods){

		#retrieve tfep configs for pods
		%tfep_info = &getTfepConfig($self, pod => $pod);
		$num_tfeps = scalar keys %tfep_info;

	        #sum up the actual weights for the tfeps in pod
        	foreach $tfep (keys %tfep_info){
                        if ($tfep_info{$tfep}->{STATUS} =~ /in/){
				$return_hash{$pod}->{ACTUAL} += $tfep_info{$tfep}->{AWEIGHT};
                        }
                }
        	if (! $return_hash{$pod}->{ACTUAL}){
        		$return_hash{$pod}->{ACTUAL} = 0;
		}

	        #calculate suggested weight
		# get the suggested weight for tfeps
		%suggested = &calcSuggestedWeight($self,pod=>"$pod");
		$return_hash{$pod}->{SUGGESTED} = $suggested{$pod};
		
        	#multiply suggested weight by the number of tfeps
                $return_hash{$pod}->{SUGGESTED} *= $num_tfeps;
		
	}

	return %return_hash;
}

		
###############################################################################
# sub: calcSuggestedWeight
# description:  calculates the suggested weight for tfeps in a pod
#
# parameters:
#
#	pod		name of pod(s), can be scalar or arrayref containing
#				list
#
#	transit		use all pods belonging to transit provider(s).
#				can be scalar or arrayref of list
#
# return values:
#	
#	hash keyed by pod name containing the suggested weight for each
#       tfep in a pod
#
#

sub calcSuggestedWeight{

	my $self = shift;
	my $param = { @_ };
	my @pods;
	my $is_ref;
	my @transit;
	my $pod;
	my %return_hash;
	my $num_tfeps;
	my @tfeps;

	# determine what data user requested
	# determine what data user has requested
	if ($param->{pod}){
		$is_ref = ref($param->{pod});
		if ($is_ref){
			@pods = @{$param->{pod}};
		} else {
			push(@pods, $param->{pod});
		}
	} elsif ($param->{transit}){
		$is_ref = ref($param->{transit});
		if ($is_ref){
			@transit = @{$param->{transit}};
		} else {
			push(@transit, $param->{transit});
		}
		@pods = &listPods($self, transit => \@transit);
	} else {
		@pods = &listPods($self);
	}

	foreach $pod (@pods){

		# retrieve list of tfeps for pod
		@tfeps = &listTfeps($self,pod=>"$pod");
		
        	$num_tfeps = @tfeps;

        	# If $pod is a SuperPod(only has 8 tfeps) then suggested weight = 3
        	if ($num_tfeps == 8) {
			$return_hash{$pod} = 3;

        	# If the pod is a Sun pod (has 6 tfeps) then suggested weight = 4
        	} elsif ($num_tfeps == 6) {
			$return_hash{$pod} = 4;

		# if the pod has ten tfeps, its a 40K pod.  suggested weight is also 4
		} elsif ($num_tfeps == 10){
			$return_hash{$pod} = 4;

        	} else {
			if ($num_tfeps){
				$return_hash{$pod} = 16/$num_tfeps;
			} else {
				$return_hash{$pod} = 0;
			}
        	}

	}

	return %return_hash;
}


###############################################################################
# sub changeAccess
# description:  add/remove support for a access provider for a pod or tfep
#
# parameters:
#	pod		pod name (changes all tfep in a pod)
#	tfep		tfep name
#	action		add or remove
#	access		access/country relationship to modify
#	debug		turn on debug information
#
#  NOTE:  log_file must be defined for this method to work.
#	  both pod and tfep cannot be passed at once
#
# return value:  none
#
#  example:
#	remove support for SPRINT/us for tfep-bg1
#
#	$obj->changeAccess( tfep => "tfep-bg1",
#			  access => "SPRINT/us",	
#			  action => "remove");
# 

sub changeAccess{

	my $self = shift;
	my $param = { @_ };

	my $change_made;
	my %config;
	my $debug;
	my $dial;
	my $item;
	my @not_dial;
	my $not_dial;
	my @pods;
	my $pod;
	my %pod_info;
	my $pod_list;
	my $pod_not_dial;
	my $supported;
	my @tfeps;
	my $tfep;
	my %tfep_info;

	# determine if we are changing a tfep or pod.  If the change is
	# for a pod, the change affects every tfep in the pod
	if ($param->{pod}){
		@tfeps = &listTfeps($self, pod => "$param->{pod}");
	} elsif ($param->{tfep}){
		push(@tfeps, $param->{tfep});
	} else {
		print STDERR "Nettools::Rotor error:  you must provide a pod or tfep name for method changeAccess()\n";
		exit;
	}

	if ($param->{"debug"}){
		$debug = 1;
	}


	%tfep_info = &getTfepConfig($self, tfep => \@tfeps);
	foreach $tfep (@tfeps){

		$not_dial = $tfep_info{$tfep}->{NOT_DIAL};

		if ($param->{action} =~ /add/){
			if ($not_dial =~ /$param->{'access'}/){
				&logEvent($self, cat => "TFEP CONFIG",
				                 message => "$param->{action} $param->{'access'} for $tfep");
				@not_dial = split(/,/,$not_dial);
				$not_dial = "";
				foreach $item (@not_dial){
					if ($item ne $param->{'access'}){
						$not_dial .= "$item,";
					}
				}
				chop $not_dial;
			}
		} elsif ($param->{action} =~ /remove/){
			if ($not_dial !~ /$param->{'access'}/){
				if ($not_dial){
					$not_dial .= ",$param->{'access'}";
				} else {
					$not_dial = "$param->{'access'}";
				}
				&logEvent($self, cat => "TFEP CONFIG",
				         	 message => "$param->{action} $param->{'access'} for $tfep");
			}
		}

		&changeTfep( $self, 
			     tfep => "$tfep",
			     not_dial => "$not_dial"); 
		
		# store pod name so we can check its config after this loop
		if ($tfep =~ /^(\D{2})\d+$/){
			$pod = $1;
			if ($pod_list !~ /$pod/){
				$pod_list .= "$pod,";
			}
		}
	}
	chop $pod_list;
	@pods = split(/,/,$pod_list);
	%pod_info = &getPodConfig( $self, pod => \@pods);
	%tfep_info = ();
	
	foreach $pod (@pods){
		$supported = "";
		$change_made = "";
		$pod_not_dial = $pod_info{$pod}->{NOT_DIAL};
		%tfep_info = &getTfepConfig($self, pod => $pod);
		
		# first, check to see if there is at least one tfep in the pod that
		# supports the dial provider we modified.  if so, ensure that the
		# pod shows that is supports that dial provider
		foreach $tfep (keys %tfep_info){
			if ($tfep_info{$tfep}->{NOT_DIAL} !~ /$param->{'access'}/){
				$supported = 1;
				last;
			}
		}

		if ($supported){
			if ($pod_not_dial =~ /$param->{'access'}/){
				# one tfep does support dial provider, change the pod
				# not dial value to reflect this
				@not_dial = split(/,/,$pod_not_dial);
				$pod_not_dial = "";
				foreach $item (@not_dial){
					if ($item ne $param->{'access'}){
						$pod_not_dial .= "$item,";
					}
				}
				chop $pod_not_dial;
				$change_made = 1;
				&logEvent($self, cat => "POD CONFIG",
				 	         message => "added $param->{'access'} support for $pod");
			}	
		} else {
			if ($pod_not_dial !~ /$param->{'access'}/){
				# no tfeps in this pod support access provider,
				# so add the value to not dial 
				if ($pod_not_dial){
					$pod_not_dial .= ",$param->{'access'}";
				} else {
					$pod_not_dial = "$param->{'access'}";
				}
				$change_made = 1;
				&logEvent($self, cat => "POD CONFIG",
				 	         message => "removed $param->{'access'} support for $pod");
			}
		}
		if ($change_made){
			&changePod( $self, 
				    pod => "$pod",
				    not_dial => "$pod_not_dial");
		}
	}
				
}

###############################################################################
# sub:  changeIP
# description:  temporariliy change tfep or lns ip until next time
#		rotor_db_maint.pl is run
#
#
# params
#	debug 		debug mode.  pass filehandle to print debug messages 
#			to
#	name		tfep or lns name
#	type		tfep or lns (required) 
#	ip		ip address
#
# return:
#	none
#
#

sub changeIP{

	my $self = shift;
	my $param = { @_ };

	my $debug;
	my $lns_ip;
	my $max_user;
	my %pod;
	my $provider;
	my $tfep_ip;
	my $tfep_name;

	if ($param->{"debug"}){
		$debug = $param->{"debug"};
	}

	if ($param->{"name"}){

		print $debug "changeIP:  name passed:  $param->{name}\n" if $debug;

		dbmopen (%pod, "$self->{pod_db}", 0666) or die "Cannot open $self->{pod_db}: $!\n";	
		($provider,$tfep_ip, $lns_ip,$max_user,$tfep_name) = split(/;/,$pod{$param->{"name"}});

		
		print $debug "changeIP:  ip passed:  $param->{ip}\n" if $debug;

		if ($param->{"type"} eq "tfep"){
			print $debug "changeIP:  type passed:  $param->{type}\n" if $debug;
			$tfep_ip = $param->{"ip"};
		} elsif ($param->{"type"} eq "lns"){
			print $debug "changeIP:  type passed:  $param->{type}\n" if $debug;
			$lns_ip = $param->{"ip"};
		} else {
			dbmclose %pod;
			print STDERR "Nettools::Rotor error:  you must provide type for method changeIP\n";
			exit;
		}
	} else {
		print STDERR "Nettools::Rotor error:  you must provide name for method changeIP\n";
		exit;
	}

	$pod{$param->{"name"}} = "$provider;$tfep_ip;$lns_ip;$max_user;$tfep_name";

	dbmclose %pod;

}

###############################################################################
# sub: changeClient
# description: adds/removes service support in pod/tfep configuration
#
# params
#	pod		pod name
#	tfep		tfep name
#	action		add/remove
#	client		service value to be modified 
#
# return values:
#	none
#
# example
#
#	add AOL support to pod ba
#		$obj->changeClient( pod => "ba",
#				    action => "add",
#				    client => "AOL");
#
#

sub changeClient{

	my $self = shift;
	my $param = {@_};

	my @client;
	my $client;
	my %config;
	my $is_ref;
	my $item;
	my $pod;
	my @pods;
	my $pod_client;
	my %pod_info;
	my $pod_list;
	my $supported;
	my @tfeps;
	my $tfep;
	my %tfep_info;

	# determine if we are changing a tfep or pod.  If the change is
        # for a pod, the change affects every tfep in the pod
        if ($param->{pod}){
                @tfeps = &listTfeps($self, pod => "$param->{pod}");
        } elsif ($param->{tfep}){
                push(@tfeps, $param->{tfep});
        } else {
                print STDERR "Nettools::Rotor error:  you must provide a pod or tfep name for method changeAccess()\n";
                exit;
        }

	%tfep_info = &getTfepConfig($self, tfep => \@tfeps);	
	foreach $tfep (@tfeps){

		$client = $tfep_info{$tfep}->{CLIENT};
		
		# add pod name of tfep to list to check later
		if ($tfep =~ /^(\D{2})\d+$/){
			$pod = $1;
			if ($pod_list !~ /$pod/){
				$pod_list .= "$pod,";
			}
		}
		
		if ($param->{action} =~ /add/){
			if ($client !~ /$param->{client}/){
				if ($client){
					$client .= ",$param->{client}";
				} else {
					$client = "$param->{client}";
				}
				&logEvent($self, cat => "TFEP CONFIG",
				 	         message => "added $param->{client} support for $tfep");
			}
		} elsif ($param->{action} =~ /remove/){
			if ($client =~ /$param->{client}/){
				&logEvent($self, cat => "TFEP CONFIG",
				 	         message => "removed $param->{client} support for $tfep");
				@client = split(/,/,$client);
				$client = "";
				foreach $item (@client){
					if ($item ne $param->{client}){
						$client .= "$item,";
					}
				}
				chop $client;
			}
		}
		changeTfep( $self,
			    tfep => "$tfep",
			    client => "$client");
	}
	chop $pod_list;
	@pod_list = split(/,/,$pod_list);
	%pod_info = &getPodConfig( $self, pod => \@pod_list);
	foreach $pod (@pod_list){
		$supported = "";
		$pod_client = $pod_info{$pod}->{CLIENT};

		# if at least one tfep supports the service we modfied, pod will
		# also be configured to support it
		%tfep_info = &getTfepConfig($self,pod => "$pod");

		foreach $tfep (keys %tfep_info){
			if ($tfep_info{$tfep}->{CLIENT} =~ /$param->{client}/){
				$supported = 1;
				last;
			}
		}
		if ($supported){
			if ($pod_client !~ /$param->{client}/){
				if ($pod_client){
					$pod_client .= ",$param->{client}";
				} else {
					$pod_client = "$param->{client}";
				}
				&logEvent($self, cat => "POD CONFIG",
				 	         message => "added $param->{client} support for $pod");
				&changePod( $self,
			    		    pod => "$pod",
			    		    client => "$pod_client");
			}
		} else {
			if ($pod_client =~ /$param->{client}/){
				@client = split(/,/,$pod_client);
				$pod_client = "";
				foreach $item (@client){
					if ($item ne $param->{client}){
						$pod_client .= "$item,";
					}
				}
			}
			chop $pod_client;
			&logEvent($self, cat => "POD CONFIG",
			 	         message => "removed $param->{client} support for $pod");
			&changePod( $self,
				    pod => "$pod",
			    	    client => "$pod_client");
		}

	}
}


###############################################################################
# sub: changeL2tp
# description:  add/remove support for l2tp provider on a lns
#
# parameters:
#
#	lns		lns name
#	pod		pod name
#	l2tp		l2tp provider
#	action  	add/remove
#
# return values:
#	none
#
# Note:  changeL2tp works just like changeDial.  When you are removing support
#	 for a l2tp provider, you are actually adding the name to the not_l2tp
#	 value for the lns in the database.  When you are adding support, you
#	 are removing it from not_l2tp
#

sub changeL2tp{

	my $self = shift;
	my $param = { @_ };

	my @l2tp;
	my $item;
	my $pod;
	my @lns;
	my $lns;
	my $lns_count;
	my %lns_info;
	my $not_spt;
	my $not_l2tp;
	my %pod_info;
	my $pod_not_l2tp;
	my @temp;

	if ($param->{pod}){
		@lns = &listLns( $self, pod => $param->{pod});
	} elsif ($param->{lns}){
		push(@lns, $param->{lns});
	} else {
		print STDERR "Nettools::Rotor error:  You must provide pod or lns name for method changeL2tp\n";
		exit;
	}

	%lns_info = &getLnsConfig($self, lns => \@lns);
	foreach $lns (@lns){
		$not_l2tp = $lns_info{$lns}->{NOT_L2TP};
		# determine pod name to check later	
		if ($lns =~ /(\D{2})(\d+)/){
			$pod = $1;
		}
		if ($param->{action} =~ /add/){
			if ($not_l2tp =~ /$param->{l2tp}/){
				@l2tp = split(/,/,$not_l2tp);
				$not_l2tp = "";
				foreach $item (@l2tp){
					if ($item ne "$param->{l2tp}"){
						$not_l2tp .= "$item,";
					}
				}
				chop $not_l2tp;
				&changeTfep( $self,
					     tfep => "$lns",
				     	     not_l2tp => "$not_l2tp");
			}

		} elsif ($param->{action} =~ /remove/){
			if ($not_l2tp !~ /$param->{l2tp}/){
				if ($not_l2tp){
					$not_l2tp .= ",$param->{l2tp}";
				} else {
					$not_l2tp = "$param->{l2tp}";
				}
				&changeTfep( $self,
					     tfep => "$lns",
				     	     not_l2tp => "$not_l2tp");
			}
		} else {
			print STDERR "Nettools::Rotor error:  You must provide an action for method changeL2tp\n";
			exit;
		}
	}


	# now we need to check the overall status of not_l2tp for the pod lns belongs to
	%pod_info = &getPodConfig($self, pod => "$pod");
	%lns_info = &getLnsConfig($self, pod => "$pod");
	$pod_not_l2tp = $pod_info{$pod}->{NOT_L2TP};
	@lns = split(/,/,$pod_info{$pod}->{LNS_LIST});
	$lns_count = @lns;

	# the only place that the value would be listed is in the not_dial parameter,
	# so if it is in the lns config, it does not support the l2tp provider
	foreach $lns (@lns){
		if ($lns_info{$lns}->{NOT_L2TP} =~ /$param->{l2tp}/){
			$not_spt++;
		}
	}
	if ($not_spt == $lns_count){
		# no lns in pod supports this l2tp, add it to pod not_l2tp
		if ($pod_not_l2tp !~ /$param->{l2tp}/){
			if (! $pod_not_l2tp){
				$pod_not_l2tp = "$param->{l2tp}";
			} else {
				$pod_not_l2tp .= ",$param->{l2tp}";
			}
			&changePod( $self,
			    	    pod => "$pod",
			    	    not_l2tp => "$pod_not_l2tp");
		}
	} else {
		# at least one lns supports l2tp provider, remove it from pod not l2tp
		if ($pod_not_l2tp =~ /$param->{l2tp}/){
			@temp = split(/,/,$pod_not_l2tp);
			$pod_not_l2tp = "";
			foreach $item (@temp){	
				if ($item ne $param->{l2tp}){
					$pod_not_l2tp .= "$param->{l2tp},";
				}
			}
			chop $pod_not_l2tp;
			&changePod( $self,
			    	    pod => "$pod",
			    	    not_l2tp => "$pod_not_l2tp");
		}
	}
}

###############################################################################
# sub: changeL4
# description:  add/removes swtich support for a pod (pod only)
#
# params:
#	pod		pod name
#	switch		switch name (ip or hostname) (only required for add)
#
# return values:  none
#
# example
#
#	add l4 support to pod ba
#	$obj->changeL4( name => "ba",
#			switch => "10.3.2.1",
#
#	remove l4 support to pod ba
#	$obj->changeL4( name => "ba",
#			switch => "",
#

sub changeL4{

	my $self = shift;
	my $param = { @_ };

	if ($param->{pod}){
		&changePod($self, pod => $param->{"pod"}, l4 => $param->{"switch"}); 
	} else {
		print STDERR "Nettools::Rotor error:  you must provide a pod name for method changeL4\n";
		exit;
	}
}

###############################################################################
# method:  changePod (Private Method)
# description:  change pod data in config database.  Any param passed (except
# 		for name) will be changed.  Other values are left intact.
#
# params:
#	pod		pod name (required)
#	debug		turn on debug messages
#	status		status of pod
#	client		clients supported
#	protocol	protocols supported
#	not_dial	dial providers not supported
#	not_realm	realms not supported
#	not_l2tp	l2tp providers not supported
#	l4		host name of switch
#
# return value:
#	none
#
# example:
#	change status field to down for pod ft
#	&changePod($self, pod => $pod, status => "down");
#

sub changePod{

	my $self = shift;
	my $param = { @_ };

	my $client;
	my %config;
	my $debug;
	my $item;
	my $l4;
	my $not_dial;
	my $not_l2tp; 
	my $not_realm; 
	my $pod;
	my $protocol;
        my $status; 
	my @temp;

	if ($param->{debug}){
		$debug = 1;
	}

	if ($param->{pod}){
		$pod = $param->{pod};
	} else {
		print STDERR "Nettools::Rotor error:  you must provide pod name for method changePod\n";
		exit;
	}

	dbmopen(%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	

        ($status, $client, $protocol,$not_dial,$not_realm,$not_l2tp,$l4) = split(/;/,$config{$pod},7);
	if (exists $param->{status}){
		$status = $param->{status};
	}
	if (exists $param->{client}){
		$client = $param->{client};
		print "changePod:  changing $pod client to $client\n" if $debug;
	}
	if (exists $param->{protocol}){
		$protocol = $param->{protocol};
	}
	if (exists $param->{not_dial}){
		$not_dial = $param->{not_dial};
	}
	if (exists $param->{not_realm}){
		$not_realm = $param->{not_realm};
	}
	if (exists $param->{not_l2tp}){
		$not_l2tp = $param->{not_l2tp};
		print "changePod:  changing $pod not_l2tp to $not_l2tp\n" if $debug;
	}
	if (exists $param->{l4}){
		$l4 = $param->{l4};
		# see if we need to add or remove pod in L4_PODS
		if ($l4){
			if ($config{"L4_PODS"} !~ /$pod/){
				if (! $config{"L4_PODS"}){
					$config{"L4_PODS"} .= "$pod";
				} else {
					$config{"L4_PODS"} .= ",$pod";
				}
			}
		} else {
			if ($config{"L4_PODS"} =~ /$pod/){
				@temp = split(/,/,$config{"L4_PODS"});
				$config{"L4_PODS"} = "";
				foreach $item (@temp){
					if ($item ne $pod){
						$config{"L4_PODS"} .= "$pod,";
					}
				}
				chop $config{"L4_PODS"};
			}
		}
	}

        $config{$pod} = "$status;$client;$protocol;$not_dial;$not_realm;$not_l2tp;$l4";

	dbmclose %config;
}

###############################################################################
# sub: changeProtocol
# description: adds/removes protocol support in pod/tfep configuration
#
# params
#	pod		pod name
#	tfep		tfep name
#	action		add/remove
#	protocol	protocol value to be modified 
#
# return values:
#	none
#
# example
#
#	add PPP support to pod ba
#		$obj->changeProtocol( pod => "ba",
#				      action => "add",
#				      protocol => "PPP");
#
#

sub changeProtocol{

	my $self = shift;
	my $param = {@_};

	my $is_ref;
	my $item;
	my $protocol;
	my $pod;
	my @pods;
	my %pod_info;
	my $pod_protocol;
	my @protocols;
	my $supported;
	my @tfeps;
	my %tfep_info;
	my $tfep;

	# determine if we are changing a tfep or pod.  If the change is
        # for a pod, the change affects every tfep in the pod
        if ($param->{pod}){
                @tfeps = &listTfeps($self, pod => "$param->{pod}");
        } elsif ($param->{tfep}){
                push(@tfeps, $param->{tfep});
        } else {
                print STDERR "Nettools::Rotor error:  you must provide a pod or tfep name for method changeProtocol()\n";
                exit;
        }

	%tfep_info = &getTfepConfig($self, tfep => \@tfeps);
	foreach $tfep (@tfeps){

		$protocol = $tfep_info{$tfep}->{PROTOCOL};	

		# add pod name of tfep to list to check later
		if ($tfep =~ /(\D{2})\d+/){
			$pod = $1;
		}
		
		if ($param->{action} =~ /add/){
			if ($protocol !~ /$param->{protocol}/){
				if ($protocol){
					$protocol .= ",$param->{protocol}";
				} else {
					$protocol = "$param->{protocol}";
				}
				&logEvent($self, cat => "TFEP CONFIG",
				 	         message => "added $param->{protocol} support for $tfep");
				&changeTfep( $self,
					     tfep => "$tfep",
					     protocol => "$protocol");
			}
		} elsif ($param->{action} =~ /remove/){
			if ($protocol =~ /$param->{protocol}/){
				&logEvent($self, cat => "TFEP CONFIG",
				 	         message => "removed $param->{protocol} support for $tfep");
				@protocols = split(/,/,$protocol);
				$protocol = "";
				foreach $item (@protocols){
					if ($item ne $param->{protocol}){
						$protocol .= "$item,";
					}
				}
				chop $protocol;
				&changeTfep( $self,
					     tfep => "$tfep",
					     protocol => "$protocol");
			}
		}
	}

	# check to see if any tfep in pod supports protocol
	%pod_info = &getPodConfig( $self, pod => "$pod");
	$pod_protocol = $pod_info{$pod}->{PROTOCOL};
	%tfep_info = &getTfepConfig($self,pod => "$pod");
	$supported = "";

	# if at least one tfep supports the protocol we modfied, pod will
	# also be configured to support it

	foreach $tfep (keys %tfep_info){
		if ($tfep_info{$tfep}->{PROTOCOL} =~ /$param->{protocol}/){
			$supported = 1;
			last;
		}
	}

	if ($supported){
		if ($pod_protocol !~ /$param->{protocol}/){
			$pod_protocol .= ",$param->{protocol}";
			&logEvent($self, cat => "POD CONFIG",
			 	         message => "added $param->{protocol} support for $pod");
			&changePod( $self,
				    pod => "$pod",
				    protocol => "$protocol");
		}
	} else {
		if ($pod_protocol =~ /$param->{protocol}/){
			@protocols = split(/,/,$pod_protocol);
			$pod_protocol = "";
			foreach $item (@protocols){
				if ($item ne $param->{protocol}){
					$pod_protocol .= "$item,";
				}
			}
			chop $pod_protocol;
			&changePod( $self,
				    pod => "$pod",
				    protocol => "$pod_protocol");
			&logEvent($self, cat => "POD CONFIG",
		 		         message => "removed $param->{protocol} support for $pod");
		}
	}
}
			
###############################################################################
# sub: changeRealm
# description:  add/remove support for a realm on a lns
#
# parameters:
#
#	debug		print debug info to filehandle provided, set to 
#				1 if stdoout	
#	pod		pod name		
#	lns		lns name
#	realm		realm name	
#	action  	add/remove
#
# return values:
#	none
#
# Note:  changeRealm works just like changeDial.  When you are removing support
#	 for a realm, you are actually adding the name to the not_realm
#	 value for the lns in the database.  When you are adding support, you
#	 are removing it from not_realm
#

sub changeRealm{

	my $self = shift;
	my $param = { @_ };

	my $debug;
	my $item;
	my @lns;
	my $lns;
	my $lns_count;
	my %lns_info;
	my $not_spt;
	my $pod;	
	my %pod_info;
	my $pod_realm;
	my $realm;
	my @realm;
	my @temp;


	if ($param->{lns}){
		push(@lns, $param->{lns});
	} elsif ($param->{pod}){
		@lns = &listLns($self, pod => "$param->{pod}");
	} else {
		print STDERR "Nettools::Rotor error:  You must provide a pod or lns name for method changeRealm\n";
		exit;
	}

	if ($param->{debug}){
		if ($param->{debug} == 1){
			$debug = *STDOUT;
		} else {
			$debug = $param->{debug};
		}
		print $debug "changeRealm:  params passed:\n";	
		foreach $item (sort keys %{$param}){
			print $debug "changeRealm\t\t$item\t\t$param->{$key}\n";
		}
			
	}

	%lns_info = &getLnsConfig( $self, lns => \@lns);

	foreach $lns (@lns){

		$not_realm = $lns_info{$lns}->{NOT_REALM};

		# get pod name to use later
		if ($lns =~ /(\D{2})\d+/){
			$pod = $1;
		}

		if ($param->{action} =~ /add/){
			if ($not_realm =~ /$param->{realm}/){
				@realm = split(/,/,$not_realm);
				$not_realm = "";
				foreach $item (@realm){
					if ($item ne "$param->{realm}"){
						$not_realm .= "$item,";
					}
				}
				chop $not_realm;
				&changeTfep( $self,
					     tfep => "$lns",
					     not_realm => "$not_realm");
			}
		} elsif ($param->{action} =~ /remove/){
			if ($not_realm !~ /$param->{realm}/){
				if ($not_realm){
					$not_realm .= ",$param->{realm}";
				} else {
					$not_realm = "$param->{realm}";
				}
				&changeTfep( $self,
					     tfep => "$lns",
					     not_realm => "$not_realm");
			}
		}
	}

        # now we need to check the overall status of not_realm for the pod lns belongs to
	%pod_info = &getPodConfig( $self, pod => "$pod");
	%lns_info = &getLnsConfig( $self, pod => "$pod");
	@lns = split(/,/,$pod_info{$pod}->{LNS_LIST});	
        $lns_count = @lns;
	$pod_not_realm = $pod_info{$pod}->{NOT_REALM};

        # the only place that the value would be listed is in the not_dial parameter,
        # so if it is in the lns config, it does not support the realm provider
        foreach $lns (@lns){
        	if ($lns_info{$lns}->{NOT_REALM} =~ /$param->{realm}/){
                	$not_spt++;
                }
        }
	print $debug "changeRealm:  pod_not_realm: >$pod_not_realm<,  lns_count: $lns_count,  not_spt: $not_spt\n" if $debug;
        if ($not_spt == $lns_count){
        	# no lns in pod supports this realm, add it to pod not_realm
		print $debug "changeRealm:  removing $param->{realm} from $pod pod_not_realm\n" if $debug;
                if ($pod_not_realm !~ /$param->{realm}/){
                	if (! $pod_not_realm){
                		$pod_not_realm = "$param->{realm}";
                        } else {
                                $pod_not_realm .= ",$param->{realm}";
                        }
			&changePod( $self,
				    pod => "$pod",
				    not_realm => "$pod_not_realm");
                }
        } else {
        	# at least one lns supports realm provider, remove it from pod not realm
                if ($pod_not_realm =~ /$param->{realm}/){
			print $debug "changeRealm:  adding $param->{realm} to $pod pod_not_realm\n" if $debug;
                	@temp = split(/,/,$pod_not_realm);
                        $pod_not_realm = "";
                        foreach $item (@temp){
                        	if ($item ne $param->{realm}){
                                	$pod_not_realm .= "$param->{realm},";
                                }
                        }
                        chop $pod_not_realm;
			&changePod( $self,
				    pod => "$pod",
				    not_realm => "$pod_not_realm");
                }
        }
}

###############################################################################
# sub changeStatus
# description:  change status of pod/tfep/lns
#
# params:
#	pod		pod name
#	name		lns or tfep name
#	status  	in/out/down
#
# return value:
#	none
#
# example:
#
#	change status of pod bj to out
#		$obj->changeStatus( pod => "bj",
#				    status => "out");
# 

sub changeStatus{

	my $self = shift;
	my $param = { @_ };

	my $change_made;
	my $in_service;
	my $is_tfep;
	my @lns;
	my @pods;
	my $pod;
	my %pod_info;
	my $pod_list;
	my $pod_status;
	my $status;
	my $tfep;
	my @tfeps;
	my %tfep_info;
	
	# determine if we are changing a tfep or pod.  If the change is
        # for a pod, the change affects every tfep in the pod
        if ($param->{pod}){
                @tfeps = &listTfeps($self, pod => "$param->{pod}");
        } elsif ($param->{name}){
                push(@tfeps, $param->{name});
        } else {
                print STDERR "Nettools::Rotor error:  you must provide a pod, tfep or lns name for method changeStatus()\n";
                exit;
        }

	%tfep_info = getTfepConfig( $self, tfep => \@tfeps);
	foreach $tfep (@tfeps){
		
		$status = $tfep_info{$tfep}->{STATUS};

		# add pod to list to check later
		if ($tfep =~ /(\D{2})\d+/){
			$pod = $1;
		}

		if ($status ne $param->{status}){
			$status = $param->{status};
			changeTfep( $self,
				    tfep => "$tfep",
				    status => "$status");
		}
			
	}

	# check pod status, if one tfep is in, pod is in service
	$change_made = "";
	$in_service = "";
	%tfep_info = &getTfepConfig($self,pod => "$pod");
	%pod_info = &getPodConfig($self, pod => "$pod");
	$pod_status = $pod_info{$pod}->{STATUS};

	foreach $tfep (keys %tfep_info){
		if ($tfep_info{$tfep}->{STATUS} eq "in"){
			$in_service = 1;
			last;
		}
	}

	if ($in_service){
		if ($pod_status ne "in"){
			$change_made = 1;
			$pod_status = "in";
		}
	} else {
		if ($pod_status ne "out"){
			$pod_status = "out";
			$change_made = 1;
		}
	}

	if ($change_made){
		&changePod( $self,
			    pod => "$pod",
			    status => "$status");
	}
}
	
	
###############################################################################
# method:  changeTfep (Private Method)
# description:  change tfep/lns data in config database.  Any param passed (except
# 		for name) will be changed.  Other values are left intact.
#
# params:
#	tfep		pod name (required)
#	debug		turn on debugging (set to non-null)
#
#	client		clients supported
#	not_dial	dial providers not supported
#	not_realm	realms not supported
#	not_l2tp	l2tp providers not supported
#	protocol	protocols supported
#	status		status of pod
#	weight		actual weight of device
#
# return value:
#	none
#
# example:
#	change status field to down for pod ft
#	&changePod($self, status => "down");
#

sub changeTfep{

	my $self = shift;
	my $param = { @_ };

	my $client;
	my %config;
	my $debug;
	my $not_dial;
	my $not_l2tp; 
	my $not_realm; 
	my $tfep;
	my $protocol;
        my $status; 
	my $weight;
	my $last_change;

	if ($param->{debug}){
		$debug = 1;
	}

	if ($param->{tfep}){
		$tfep = $param->{tfep};
	} else {
		print STDERR "Nettools::Rotor error:  you must provide tfep name for method changeTfep\n";
		exit;
	}

	dbmopen(%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	

        ($status,$client,$protocol,$weight,$not_dial,$not_realm,$not_l2tp,$last_change) = split(/;/,$config{$tfep},8);

	print "changeTfep:\n" if $debug;

	if (exists $param->{status}){
		$status = $param->{status};
	}
	if (exists $param->{client}){
		$client = $param->{client};
	}
	if (exists $param->{protocol}){
		$protocol = $param->{protocol};
	}
	if (exists $param->{weight}){
		$weight = $param->{weight};
	}
	if (exists $param->{not_dial}){
		print "\tchanging >$not_dial< to >$param->{not_dial}<\n" if $debug; 
		$not_dial = $param->{not_dial};
	}
	if (exists $param->{not_realm}){
		$not_realm = $param->{not_realm};
	}
	if (exists $param->{not_l2tp}){
		$not_l2tp = $param->{not_l2tp};
	}

	$last_change = time;

        $config{$tfep} = "$status;$client;$protocol;$weight;$not_dial;$not_realm;$not_l2tp;$last_change";

	dbmclose %config;
}
		
		
###############################################################################
# sub changeTransit
# description:  modifies, adds, or deletes transit provider config info
#
# params
#	name		transit provider name
#	zone		zone_name (abbreviation used for zone file name)
#	res_ttl		ttl value
#	use_cname	cname usage value (Y or N)
#	use_gcd		use gcd method of zone file generation  (set to 1 or 0)
#	num_rotor	number of rotors 
#	rotor_config	either MAX (number of rotors is le num_rotor) or
#			num (number of rotors equals num_rotor)
#	delete		delete transit provider from database (set to non-null)
#
#	NOTE:  when adding a new transit provider, all values (except delete, duh!)
#	       must be present.  when changing a value, only name and the value
#	       that is changing is required.  
#	
#
# return value:
#	none
#
#
# examples:
#
# 	add a new transit provider
#		$obj->changeTransit( name => "BLAH",
#				     zone => "blah",
#				     res_ttl => "300",
#				     use_cname => "Y",
#				     num_rotor => "18",
#				     use_gcd => "1",
#				     rotor_config => "NUM");
#
#	change blah's ttl to 900
#		$obj->changeTransit( name => "BLAH",
#				     ttl => "900");
#
#	delete blah
#		$obj->changeTransit( name => "BLAH",
#				     delete => 1);
#

sub changeTransit{

	my $self = shift;
	my $param = { @_ };
	my %config;
	my @providers;
	my $item;
	my ($zone,$ttl,$cname_use,$num_rotor,$rotor_config,$gcd_use);

	# determine name of transit provider
	if (! $param->{name}){
		print STDERR "Nettools::Rotor error:  You must provider a transit provider name for method changeTransit()\n";
		exit;
	}	

	dbmopen(%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	

	# check to see if we are deleting a provider
	if ($param->{"delete"}){
		if ($config{PROVIDER} =~ /$param->{name}/){
			@providers = split(/,/,$config{PROVIDER});
			$config{PROVIDER} = "";
			foreach $item (@providers){
				if ($item ne $param->{name}){
					$config{PROVIDER} .= "$item,";
				}
			}
			chop $config{PROVIDER};
		}
		delete $config{$param->{name}};
		&logEvent( $self,cat => "ROTOR_DB",
			   message => "deleted transit provider $param->{name}");

	# check to see if this is a new transit provider
	} elsif ($config{PROVIDER} !~ /$param->{name}/){
			
		# add it to the provider list
		$config{PROVIDER} .= ",$param->{name}";

		# add it to database
		$config{$param->{name}} = "$param->{zone};$param->{res_ttl};$param->{use_cname};$param->{rotor_config};$param->{num_rotor}";

		&logEvent( $self,cat => "ROTOR_DB",
			   message => "added transit provider $param->{name}");
	
	# just making a change to an existing value
	} else {
	
		($zone,$ttl,$cname_use,$rotor_config,$rotor_num,$gcd_use) = split(/;/,$config{$param->{name}});
		if ($param->{zone}){
			$zone = $param->{zone};
			&logEvent( $self,cat => "ROTOR_DB",
				   message => "changing zone for $param->{name} to $param->{zone}");
		}
		if ($param->{res_ttl}){
			$ttl = $param->{res_ttl};
			&logEvent( $self,cat => "ROTOR_DB",
				   message => "changing res_ttl for $param->{name} to $param->{res_ttl}");
		}
		if ($param->{use_cname}){
			$cname_use = $param->{use_cname};
			&logEvent( $self,cat => "ROTOR_DB",
				   message => "changing use_cname for $param->{name} to $param->{use_cname}");
		}
		if ($param->{rotor_config}){
			$rotor_config = $param->{rotor_config};
			&logEvent( $self,cat => "ROTOR_DB",
				   message => "changing rotor_config for $param->{name} to $param->{rotor_config}");
		}
		if ($param->{num_rotor}){
			$rotor_num = $param->{num_rotor};
			&logEvent( $self,cat => "ROTOR_DB",
				   message => "changing num_rotor for $param->{name} to $param->{num_rotor}");
		}
		if (exists $param->{use_gcd}){
			$gcd_use = $param->{use_gcd};
			&logEvent( $self,cat => "ROTOR_DB",
				   message => "changing gcd usage for $param->{name} to $param->{use_gcd}");
		}
			
		
		$config{$param->{name}} = "$zone;$ttl;$cname_use;$rotor_config;$rotor_num;$gcd_use";
	}
}

###############################################################################
# sub changeWeight
# description:  change the weight of a tfep
#
# params:
#	tfep 		tfep name or arrayref of tfep names
#	weight		new weight
#
# return value:
#	none
#
# example:
#	change weight of tfep-ba1 and tfep-ba2 to 4
#		$obj->changeWeight( tfep => ["tfep-ba1","tfep-ba2"],
#				    weight => 4);
#
#

sub changeWeight{

	my $self = shift;
	my $param = { @_ };

	my $actual_weight;
	my $is_ref;
	my @tfeps;
	my $tfep;

	if ($param->{tfep}){
		$is_ref = ref($param->{tfep});
		if ($is_ref){
			@tfeps = @{$param->{tfep}};
		} else {
			push(@tfeps, $param->{tfep});
		}
	} else {
		print STDERR "Nettools::Rotor error:  You must provide a tfep name for changeWeight()\n";
		exit;
	}

	if ($param->{weight} ne ""){
		%tfep_info = &getTfepConfig( $self, tfep => \@tfeps );
		foreach $tfep (@tfeps){
			$actual_weight = $param->{weight};
			&logEvent($self, cat => "TFEP CONFIG",
		 	         	 message => "changed status of $tfep to $param->{weight}");
			&changeTfep( $self,
				     tfep => "$tfep",
				     weight => "$actual_weight");
		}
	} else {
		print STDERR "Nettools::Rotor error:  You must provider a weight for changeWeight()\n";
		exit;
	}
}
		
###############################################################################
# sub configDb
# description: sets and/or returns location of config databse
#

sub configDb{

	my $self = shift;

	if ($_[0]){
		$self->{config_db} = $_[0];
	}
	
	return $self->{config_db};

}	

###############################################################################
# sub genLock
# Description:  this function will generate a lock file for the rotor.  This will
#               prevent multiple users from updating the rotor files and keep
#               pod_db.pl from updating the rotor databases when changes are being
#               made
#
# Required Parameters:
#       user:   userid of the person setting the lock
#
# Data Returned:
#       none
#
# example:
#		$obj->genLock( user => "user");
#

sub genLock{

	my $self = shift;
	my $param = { @_ };

	if (! exists $param->{user}){
		print STDERR "Nettools::Rotor error:  You must provide user name for method genLock()\n";
		exit;
	}
	
	if (! exists $self->{lock_file}){
		print STDERR "Nettools::Rotor error:  You must provide lock file location for method genLock()\n";
		exit;
	}


	
        my $user_id = $param->{user};
        my $lock_file = $self->{lock_file};

        my ($sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);
        my $lock_time;
        my $data_dir;


        ($sec,$min,$hour,$mday,$mon,$year,$wday,$isdst) = localtime(time);
        $lock_time = strftime("%m/%d/%Y %H:%M",$sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);

        open (LOCK_FILE, ">$lock_file");
        print LOCK_FILE "LOCK SET       $lock_time\nUSERID      $user_id\n";
        close LOCK_FILE;
}


###############################################################################
# sub getAccessTransit
# description:  returns config info on access/transit provider in following.
#
# values passed to method:
#	name:  name of access/transit provider (either in scalar,
#			arrayref, or anon array format)
#
#	subset:  subset of dts to return. either L2TP or DIAL
#
#	transit:  get access transit providers for specific transit provider
#
#	NOTE: if no parameters are passed, all access/transit providers 
#	      will be returned 
#
#
# values returned:  hash keyed by provider name and the following config values
#
#
#	ABBREV			Abbreviation, eg ba for bell atlantic
#	ALARM			alarm thresholds configured for each protocol-service pair.
#				for example {ALARM}->{P3-AOL} = value;
#	CLIENT			clients supported, comma delimated
#	DNS			dns service names used by provider, comma delimated
#	NET_ID			Network ID used by dial transit provider
#	PROTOCOL		Protocols support, comma delimated
#	TRANSIT			Transit Provider Used
#	ZONE_NAME		P3 zone names used
#
# examples
#		
#	to view the protocols supported by each access/transit provider:
#		%hash = $obj->getAccessTransit();
#		foreach $provider (keys %hash){
#			print "$hash{$provider}->{PROTOCOL}\n";
#		}
#				
#	to view the threshold alarm for P3-AOL with ANS/us
#		%hash = $obj->getAccessTransit( name => "ANS/us");
#		print "$hash->{"ANS/us"}->{ALARM}->{P3-AOL}\n"l
#
#	to view the same for ANS/us and British Telecom/gb
#		@providers = ("ANS/us","British Telecom/gb");
#		%hash = $obj->getAccessTransit( name => \@providers);
#				or
#		%hash = $obj->getAccessTransit( name => ["ANS/us","British Telecom/gb"]);
#		foreach $provider (keys %hash){
#			print "$hash{$provider}->{ALARM}->{P3-AOL}\n";
#		}
#


sub getAccessTransit{

	my $self = shift;
	my $param = { @_ };
	my $config_db = $self->{config_db};

	my $abbrev;
	my $access;
	my ($dp, %dp);
	my (@dial, $dial);
	my $calling_package;
	my $debug;
	my ($transit,$service,$protocol,$dns,$alarm,$zone_name,$net_id);
	my %config;
	my (@temp, $item);
	my ($pair, $threshold);
	my %zone_names;

	undef %dp;

	if ($self->{debug}){
		$debug = $self->{debug};
		$calling_package = caller();
		print $debug "\ngetAccessTransit called by $calling_package\n";
		print $debug "\tparams passed to getAccessTransit:\n";
		foreach $item (sort keys %{$param}){
			print $debug "\t\t$item   $param->{$item}\n";
		}
	}		

	# figure out what access providers we need to retrieve data on
	if ($param->{name}){
		my $is_ref = ref($param->{name});
		if ($is_ref){
			@dial = @{$param->{name}};
		} else {
			@dial = "$param->{name}";
		}
	} elsif ($param->{subset}){
		print $debug "\t\tdetermining subset required ($param->{subset})\n" if $debug;
		if ($param->{transit}){
			print $debug "\t\ttransit $param-{transit} passed\n" if $debug;
			if ($param->{subset} eq "L2TP"){
				@dial = &listAccessTransit($self, subset => "L2TP", transit => $param->{transit});
			} elsif ($param->{subset} eq "DIAL"){
				@dial = &listAccessTransit($self, subset => "DIAL", transit => $param->{transit});
			}
		} else {
			if ($param->{subset} eq "L2TP"){
				@dial = &listAccessTransit($self, subset => "L2TP");
			} elsif ($param->{subset} eq "DIAL"){
				@dial = &listAccessTransit($self, subset => "DIAL");
			}
		}
	} elsif ($param->{transit}){
		@dial = &listAccessTransit($self, transit => $param->{transit});
	} else {
		@dial = &listAccessTransit($self);
	}

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	

	print $debug "\t\tretrieving config data:\n" if $debug;

	# retrieve file name abbreviations for providers	
	%abbrev = getConfigData( $self, cat => "ACCESS" );

	foreach $dial (@dial){	
		print $debug "\t\t\t$dial\n" if $debug;
		# retrieve info
		($transit,$service,$protocol,$dns,$alarm,$zone_name,$net_id) = split(/;/,$config{"$dial"});

		#store in hash to return
		$dp{$dial}->{TRANSIT} = $transit;	
		$dp{$dial}->{CLIENT} = $service;
		$dp{$dial}->{PROTOCOL} = $protocol;
		$dp{$dial}->{DNS} = $dns;
		$dp{$dial}->{NET_ID} = $net_id;
		$dp{$dial}->{ZONE_NAME} = $zone_name;

		# get abbreviation
		if ($dial =~ /(.*)\/\S+/){
			$access = $1;
			$dp{$dial}->{ABBREV} = $abbrev{$access};
		}	
	
		# break out alarms
		@temp = split(/,/,$alarm);
		foreach $item (@temp){
			($pair, $threshold) = split(/:/,$item);
			$dp{$dial}->{ALARM}->{$pair} = $threshold;
		}
	}

	dbmclose %config;

	if ($debug){
		print $debug "\t\tproviders returned:\n";
		foreach $item (sort keys %dp){
			print $debug "\t\t\t$item\n";
		}
	}

	print $debug "exiting getAccessTransit\n" if $debug;
	
	return %dp;
}
		
###############################################################################
# sub getConfigData
# description:  returns data for generic data in config database
#
# params:  
#	cat		category of data requested.  available data
#			categories are:
#			
#			COUNTRY
#			ACCESS	
#			SITE
#
# return values:
#	hash containing config data 
#
# NOTE:  this method is used to retrieve data types that have only one config
#	 value in the database, unlike ACCESS/TRANSIT for example
#

sub getConfigData{
	
	my $self = shift;
	my $param = { @_ };

	my %config;
	my %return;
	my @temp;
	my %temp;
	my $item;
	

	
	if (! $param->{cat}){
		print STDERR "Nettools::Rotor error:  You must provide a data category for method getConfigData\n";
		exit;
	} else {
		dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	
		if ($param->{cat} eq "COUNTRY"){
			@temp = &listCountry($self)
		} elsif ($param->{cat} eq "ACCESS"){
			@temp = &listAccessProvider($self);
		} elsif ($param->{cat} eq "SITE"){
			@temp = &listSite($self);
		}

		foreach $item (@temp){
			$return{$item} = $config{$item};
		}

		dbmclose %config;

		if ($param->{cat} eq "ACCESS"){

			# Note:  to differentiate between dial providers and transit providers
			# 	 in database, all dial providers are keyed by adding a "_dp"
			#	 to its name.  We need to remove the _dp extension on the keys	

			foreach $item (keys %return){
				if ($item =~ /(\S+(.*)?)_dp/){
					$return{$1} = $return{$item};
					delete $return{$item};
				}
			}
		}

		return %return;
	}
}
		 

###############################################################################
# sub getDialZone
# description:  returns zone name(s)
#
# required parameters:
#	zone_file	zone file name (db.us.ans.p3.aol)
#	dial		dial provider name (ANS/us)
# 	NOTE:  only one of the above parameters needs to be passed
#
# return value:
# 	if zone file name was passed, string containing zone name is returned
#	if access/transit was passed, hash containing zone names is returned, 
#	keyed by {CLIENT}->{PROTOCOL}.  For example:
#
#		$hash{AOL}->{PPP} = aolnet.aol.com
#

sub getDialZone{

	my $self = shift;
	my $param = { @_ };

	my $dp;			
	my %hash;
	my %return_hash = ();
	my ($db,$country,$dial,$protocol,$client);
	my ($transit,$service,$protocol2,$dns,$alarm,$zone_name,$net_id);
	my @dp;
	my @temp;
	my $item;
	my %config_hash;
	my %config;
	my $return_value;

	undef $dial;
	if ($param->{zone_file}){
		($db,$country,$dial,$protocol,$client) = split(/\./,$param->{zone_file});
		# build dial provider name
		%hash = &getConfigData($self, cat => "ACCESS");
		%hash = reverse %hash;
		$dial = "$hash{$dial}/$country";
		$protocol = uc($protocol);
		$client = uc($client);
	} 

	if ($param->{dial} || $dial){
		
		if (! defined $dial || ! $dial){
			$dial = $param->{dial};
		}
		# ppp zone name is always the same, depending
		# only on service used
		$return_hash{AOL}->{PPP} = "aolnet.aol.com";
		$return_hash{CS}->{PPP} = "csnet.access.compuserve.com";
		$return_hash{AOL}->{DSL} = "americaonline.aol.com";
		$return_hash{CS}->{DSL} = "compuserve.cs.com";
		$return_hash{AOL}->{K2} = "k2beta.aol.com";
		$return_hash{CS}->{K2} = "k2beta.cs.com";
		
		# retrieve the p3 zone name
		dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	
		($transit,$service,$protocol2,$dns,$alarm,$zone_name,$net_id) = split(/;/,$config{"$dial"});
		@temp = split(/,/,$zone_name);
		foreach $item (@temp){
			if ($item =~ /\.aol\./){
				$return_hash{AOL}->{P3} = $item;
			} elsif ($item =~ /\.cs\./ || $item =~ /compu/){
				$return_hash{CS}->{P3} = $item;
			}
		}
		dbmclose %config;
	}

	# if we got a specific zone file, return the appropriate zone name, else
	# return the whole hash
	
	if ($client && $protocol){
		return "$return_hash{$client}->{$protocol}";
	} else {
		return %return_hash;
	}
}
	
###############################################################################
# sub getElements
# descripton:  returns form elements/column headings for data types
#
# param:
#	cat	data category (e.g. COUNTRY, REALM, etc)
#
# return values:
#	array containing elements
#
# 

sub getElements{

	my $self = shift;
	my $param = { @_ };
	my @headings;
	my %config;
	my $cat;

	if ($param->{cat}){
		dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	
		$cat = lc($param->{cat}); 
		@headings = split(/,/,$config{"$cat"});
		dbmclose %config;
		return @headings;
	} else {
		print STDERR "Nettools::Rotor error:  You must provide a data category for getElements method\n";
		exit;
	}
}
		

	
###############################################################################
# sub getLnsConfig
# description:  returns lns configuration information
#
# params:
#	debug		pass filehandle for debug messages
#	lns		lns name (scalar or arrayref)
#	pod 		pod name (scalar or arrayref)
#	transit		return lns devices belong to provider
#				(scalar or arrayref)
#
#	NOTE:  if no params are passed, all lns configs will be returned
#
# return values: 
#	hash keyed by lns name with the following categories
#	
#		IP		IP Address
#		L2TP		L2TP Providers supported
#		LAST_CHANGE	epoch seconds when last change was made to lns
#		NOT_L2TP	l2tp providers not supported
#		NOT_REALM 	realms not supported by lns
#		PROVIDER	transit provider
#		REALM		comma seperated list of Realms supported
#		STATUS		status of lns
#
# examples
#
# 	to view lns ip information for lnses in pod ft:
#		%hash = $obj->getLnsConfig( pod => "ft");
#		foreach $lns (keys %hash){
#			print "$lns ip:  $hash{$lns}->{IP}\n";
#		}	
#		

sub getLnsConfig{

	my $self = shift;
	my $param = { @_ };

	my %access;
	my $actual_weight;
	my %config;
	my $debug;
	my $ip; 
	my $is_ref;
	my $item;
	my $item2;
	my $l2tp;
	my $last_change;
	my @lns;
	my $lns;
	my $lns_ip; 
	my $max_user;
	my $not_dial;
	my $not_l2tp;
 	my $not_realm;
	my %pod;
	my @pods;
	my $protocol;
        my $provider;
	my @realms;
	my $realm;
	my %return;
	my $service; 
        my $status;
	my $tfep;
	my @tfeps;
	my %temp;
	my @temp;
	my $temp;
	my @transit;
	my %transit;

        if ($param->{debug}){
                if ($param->{debug} =~ /\*/){
                        # filehandle, send debug messages to it
                        $debug = $param->{debug};
                } else {
                        $debug = *STDOUT;
                }
                print $debug "getLnsConfig:\tgetLnsConfig is in debug mode, sending messages to $debug\n";
        }


	if ($param->{pod}){
		$is_ref = ref($param->{pod});
		if ($is_ref){
			@pods = @{$param->{pod}};
		} else {
			push(@pods, $param->{pod});
		}
		@lns = &listLns( $self, pod => \@pods);
	} elsif ($param->{lns}){
		$is_ref = ref($param->{lns});
		if ($is_ref){
			@lns = @{$param->{lns}};
		} else {
			push(@lns, $param->{lns});
		}
	} elsif ($param->{transit}){
		$is_ref = ref($param->{transit});
		if ($is_ref){
			@transit = @{$param->{transit}};
		} else {
			push(@transit, $param->{transit});
		}
		foreach $transit (@transit){
			$transit{$transit} = 1;
		}

		@pods = &listPods($self, transit => \@transit);
		@lns = &listLns( $self, pod => \@pods);
	} else {
		@lns = &listLns($self);
	}

	# get listing of realms and providers to use later
	@realms = &listRealm($self);
	%access = &getAccessTransit($self, subset => "L2TP");

	dbmopen (%pod, "$self->{pod_db}", 0666) or die "Cannot open $self->{pod_db}: $!\n";	
	dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	
	foreach $lns (@lns){
		if (! exists $return{$lns}){
        		($provider, $ip, $lns_ip, $max_user) = split(/;/,$pod{$lns});
			# if the lns does not have an ip, don't return its config
			if ( $lns_ip){
				# if transit param was passed, make sure this device belongs to provider requested
				if (! $param->{transit} || $transit{$provider}){
					($status,$service,$protocol,$actual_weight,$not_dial,$not_realm,$not_l2tp,$last_change) = split(/;/,$config{$lns});

					$return{$lns}->{PROVIDER} = $provider;
					$return{$lns}->{IP} = $lns_ip;
					$return{$lns}->{STATUS} = $status;
					$return{$lns}->{NOT_REALM} = $not_realm;
					$return{$lns}->{NOT_L2TP} = $not_l2tp;
					$return{$lns}->{LAST_CHANGE} = $last_change;

					# build list of realms lns supports
					foreach $realm (@realms){
						if ($return{$lns}->{NOT_REALM} !~ /$realm/){
							$return{$lns}->{REALM} .= "$realm,";
						}
					}
					chop $return{$lns}->{REALM};
	
					# build list of l2tp providers lns supports
					foreach $item (keys %access){
						if ($return{$lns}->{PROVIDER} eq $access{$item}->{TRANSIT} && $return{$lns}->{NOT_L2TP} !~ /$item/){
							$return{$lns}->{L2TP} .= "$item,";
						}
					}
					if ($return{$lns}->{L2TP}){
						chop $return{$lns}->{L2TP};	
					}
				}
			}
		}
	}

	dbmclose %pod;
	dbmclose %config;

	if ($debug){
		print $debug "getLnsConfig:\tdata returned by getLnsConfig:\n\n";
		foreach $item (sort keys %return){
			print $debug "getLnsConfig:\t$item\n";
			foreach $item2 (sort keys %{$return{$item}}){
				print $debug "getLnsConfig:\t\t$item2\t$return{$item}->{$item2}\n";
			}
		}
	}

	return %return;
}

###############################################################################
# sub getMaxUsers
# description:  returns current maxium user capacity of tfeps
#

sub getMaxUsers{

	my $self = shift;
	my %pod;
	my $max;
	
	dbmopen (%pod, "$self->{pod_db}", 0666) or die "Cannot open $self->{pod_db}: $!\n";	
	$max = $pod{MAX_USER};
	dbmclose %pod;
	
	return $max;
}

###############################################################################
# sub getNetId
# description:  returns hash keyed by AT provider listing network id(s)
#
# parameters:
#	name		AT Provider name  (scalar or arrayref)
#	array		return data in array format (set to non-null)
#
#	Note:  if no name parameter is passed, all ATs will be returned
#
# return values:
#	comma delimated list of network ids.  If array param is passed,
#	hash will contain arrayref of data instead
#
# examples: 
#	view net ids of ANS/us in array format
#		%hash = $obj->getNetId( name => "ANS/us",
#				        array => 1);
#		foreach $id (@{$hash{"ANS/us"}}){
#			print "$id\n";
#		}
#	
#	get net ids of ANS/us and BBN2/us
#	@providers = ("ANS/us", "BBN2/us");
#	%hash = $obj->getNetId( name => \@providers);
#		or
#	%hash = $obj->getNetId( name => ["ANS/us","BBN2/us"]);
#

sub getNetId{
	my $self = shift;
	my $param = { @_ };
	
	my $is_ref;
	my @access;
	my %config_hash;
	my %return;
	my $item;
        my ($transit,$service,$protocol,$dns,$alarm,$zone_name,$net_id);

	# determine which providers were requested
	if ($param->{name}){
		$is_ref = ref($param->{name});
		if ($is_ref){
			@access = @{$param->{name}};
		} else {
			push(@access, $param->{name});
		}

		%config_hash = &getAccessTransit($self,name => \@access);
		
	} else {
		%config_hash = &getAccessTransit($self);
	}

	foreach $item (keys %config_hash){
		$return{$item} = $config_hash{$item}->{NET_ID};
	}

	# put in array format if requested
	if ($param->{array}){
		foreach $item (keys %return){
			$return{$item} = [split(/,/,$return{$item})];
		}
	}

	return %return;
}

###############################################################################
# sub getPodConfig
# description:  retrieves pod config info from database
#
# optional parameter:
#
#	debug 	  	turn on debug messages.  pass filehandle
#	l2tp		return only l2tp capable pods (set to non-null)
# 	pod  		return only information on a specific pod or pods
#	transit		return only information on pods for a specific transit
#		  	provider(s)
#	fields		return only fields specified.  comma delimated.  If
#			this parameter is not passed, all fields are returned.
#			requesting a NOT or a field that has a NOT opposite
#			automatically returns its opposite.  e.g. requesting
#			NOT_DIAL returns NOT_DIAL and DIAL
#
#
# return values:
#       hash keyed by pod name with the following reference values:
#	
#		DIAL            dial (DNS) providers supported by pod
#		L2TP		l2tp providers supported by pod
#		L4		if pod supports l4 switching, this
#				field will contain switch ip
#		LAST_CHANGE	last time (epoch) when tfep in pod was changed
#		LNS_LIST	comma delimated listing of lns in pod
#		NOT_L2TP	l2tp providers not supported by pod
#      		NOT_DIAL        dial providers not supported by pod. 
#		NOT_REALM	realms not supported by pod
#      	 	PROTOCOL        protocol(s) supported by pod
#       	PROVIDER        Transit Provider
#		REALM		Realms supported by pod
#       	CLIENT          client(s) supported by pod
#       	STATUS          status of pod (in or out)
#		TFEP_LIST	comma delimated listing of tfeps in pod
#
#	data is comma delimated
#
# examples:
#
#	method invocation
#		return info on pod ba only
#		%hash = $obj->getPodConfig(pod => "ba");
#
#		return info on all pods
#		%hash = $obj->getPodConfig();
#
#		return info on pods ba and ce
#		@pods = ("ba","ce");
#		%hash = $obj->getPodConfig( pod => \@pods );
#			or
#		%hash = $obj->getPodConfig( pod => ["ba","bj"] );
#
#		return only STATUS and PROVIDER values for ba
#		%hash = $obj->getPodConfig( pod => "ba",
#					    fields => "STATUS,PROVIDER");
#
#	return values
#		list clients pod cg supports
#		%hash = $obj->getPodConfig(pod => "cg");
#		@clients = split(/,/,$hash{ba}->{CLIENT});
#		

sub getPodConfig{

	my $self = shift;
	my $param = { @_ };

	my $calling_package;
        my %config;
	my $debug;
        my %dial;
	my %fields;
	my $is_ref;
        my $item;
	my $l4;
	my $lns_list;
        my @not_dial;
        my $not_dial;
        my %not_hash;
	my @not_realm;
	my $not_realm;
	my @not_l2tp;
	my $not_l2tp;
	my $l2tp_supported;
	my $l2tp;
        my @pods;
        my $pod;
        my %pod;
	my %pod_info;
        my $protocol;
	my @providers;
	my $provider;
	my $realm;
        my $search;
	my @search;
        my $service;
        my @service_info;
        my $supported;
	my @temp;
	my @temp_dial;
	my $tfep_list;
	my $tfep;
	my %tfep_info;
	my %tfep_supported;
	my @transit;

        dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";
	
	if ($param->{"debug"}){
		$debug = $param->{"debug"};
		print $debug "getPodConfig:\tgetPodConfig is in debug mode, sending messages to $debug\n";
		print $debug "getPodConfig:\tpod database used:  $self->{pod_db}\n" if $debug;
		print $debug "getPodConfig:\tconfig database used:  $self->{config_db}\n" if $debug;
		print $debug "getPodConfig:\tparams passed:\n";
		foreach $item (sort keys %{$param}){
			print $debug "getPodConfig:\t\t$item\t$param->{$item}\n";
		}
	}

	# determine which pods are requested
	if ($param->{pod}){
		$is_ref = ref($param->{pod});	
		if ($is_ref){
			@pods = @{$param->{pod}};
		} else {
			push(@pods, "$param->{pod}");
		}
	} elsif ($param->{transit}){
		$is_ref = ref($param->{transit});	
		if ($is_ref){
			@providers = @{$param->{transit}};
		} else {
			push(@providers, "$param->{transit}");
		}
		@pods = &listPods($self, transit => \@providers);
	} elsif ($param->{l2tp}){
		@pods = &listPods($self, l2tp => 1);
	} else {
        	@pods = split(/,/,$config{POD});
	}

	# determine which fields are requested.  if param->{fields} does not exist,
	# store "all" in the %fields hash
	if ($param->{"fields"}){
		@temp = split(/,/,$param->{"fields"});
		foreach $item (@temp){
			$fields{$item} = $item;
		}
		# if we have a "NOT" value, we need its opposite
		if ($fields{"NOT_DIAL"} || $fields{"DIAL"}){
			$fields{"NOT_DIAL"} = "NOT_DIAL";
			$fields{"DIAL"} = "DIAL";
			$fields{"PROVIDER"} = "PROVIDER";
		}
		if ($fields{"NOT_L2TP"} || $fields{"L2TP"}){
			$fields{"NOT_L2TP"} = "NOT_L2TP";
			$fields{"L2TP"} = "L2TP";
			$fields{"PROVIDER"} = "PROVIDER";
		}
		if ($fields{"NOT_REALM"} || $fields{"REALM"}){
			$fields{"NOT_REALM"} = "NOT_REALM";
			$fields{"REALM"} = "REALM";
		}
		if ($debug){
			print $debug "getPodConfig:\tfields requested:\n";
			foreach $item (sort keys %fields){
				print $debug "getPodConfig:\t\t$item\n";
			}
		}

	} else {
		$fields{"all"} = "all";
		print $debug "getPodConfig:\tfields set to all\n" if $debug;
	}

        # open pod database and get pod providers
        dbmopen (%pod, "$self->{pod_db}", 0666) or die "Cannot open $self->{pod_db}: $!\n";
        foreach $pod (@pods){
		($provider,$tfep_list,$lns_list) = split(/;/,$pod{$pod});
                ($status, $service, $protocol,$not_dial,$not_realm,$not_l2tp,$l4) = split(/;/,$config{$pod});

		if ($lns_list){
			$l2tp_supported = 1;
		}
		if ($fields{"all"} || $fields{"PROVIDER"}){
        		$pod_info{$pod}->{PROVIDER} = $provider;
		}
		if ($fields{"all"} || $fields{"TFEP_LIST"}){
			$pod_info{$pod}->{TFEP_LIST} = $tfep_list;
		}
		if ($fields{"all"} || $fields{"LNS_LIST"}){
			$pod_info{$pod}->{LNS_LIST} = $lns_list;
		}

		if ($fields{"all"} || $fields{"DIAL"}){
			if ($pod_info{$pod}->{PROVIDER} =~ /,/){
				@temp_dial = split(/,/,$pod_info{$pod}->{PROVIDER});
        			%dial = &getAccessTransit($self, transit => \@temp_dial);
			} else {
        			%dial = &getAccessTransit($self, transit => "$pod_info{$pod}->{PROVIDER}");
			}
		}

                %not_hash = ();

		if ($fields{"all"} || $fields{"STATUS"}){
                	$pod_info{$pod}->{STATUS} = $status;
		}
		if ($fields{"all"} || $fields{"CLIENT"}){
                	$pod_info{$pod}->{CLIENT} = $service;
		}
		if ($fields{"all"} || $fields{"PROTOCOL"}){
               		$pod_info{$pod}->{PROTOCOL} = $protocol;
		}
		if ($fields{"all"} || $fields{"DIAL"}){
               		$pod_info{$pod}->{NOT_DIAL} = $not_dial;
		}
		if ($fields{"all"} || $fields{"L4"}){
			$pod_info{$pod}->{L4} = $l4;
		}

                #retrieve dial providers using this pod
		if ($fields{"all"} || $fields{"DIAL"}){

			#first get dial providers using transit providers configured for pod
                	if ($pod_info{$pod}->{PROVIDER} =~ /,/){
               			@search = split(/,/,$pod_info{$pod}->{PROVIDER});
                	} else {
                        	@search = $pod_info{$pod}->{PROVIDER};
                	}


			# look at the config entry for each dial provider (@dial), if it contains 
			# the transit provider (in @search), add it to the list of available 
			# dial providers 

			foreach $search (@search){ 
				foreach $item (keys %dial){ 
					if ($dial{$item}->{TRANSIT} eq $search){
                                        	$pod_info{$pod}->{DIAL} .= "$item,";
                                	}
                        	}
                	}
                	chop $pod_info{$pod}->{DIAL};

                	@dial_providers = split(/,/,$pod_info{$pod}->{DIAL});
                	# then remove dial providers not supported by this pod
                	@not_dial = split(/,/,$pod_info{$pod}->{NOT_DIAL});
                	foreach $item (@not_dial){
                        	$not_hash{$item} = $item;
                	}

			# check to see if pod is split between multiple transit providers.  If it
			# is, we need to do a more thorough check of not_dial
			$calling_package = caller();
			if ($calling_package ne "Nettools::Rotor"){
				if ($pod_info{$pod}->{PROVIDER} =~ /,/){
					# get TFEP info for pod, we need the dial providers supported for each tfep.
					%tfep_info = &getTfepConfig($self, pod => $pod);
					# see if at least one tfep suppports dial provider
					foreach $item (keys %dial){ 
						foreach $tfep (keys %tfep_info){
							if ($tfep_info{$tfep}->{DIAL} =~ /$item/){
								$tfep_supported{$item} = $item;
							}
						}
					}
					# now see what is supported
					foreach $item (keys %dial){
						if (! $tfep_supported{$item}){
							# no tfep supports dial provider
							$not_hash{$item} = $item;
							if ($pod_info{$pod}->{NOT_DIAL}){
								$pod_info{$pod}->{NOT_DIAL} .= ",$item";
							} else {
								$pod_info{$pod}->{NOT_DIAL} = "$item";
							}
						}
					}
				}
			}

                	foreach $item (keys %dial){
                        	if (! exists $not_hash{$item}){
                                	$supported .= "$item,";
                        	}
                	} 
			chop $supported;
                	$pod_info{$pod}->{DIAL} = $supported;
                	$supported = "";
		}

		# only do l2tp stuff if pod has lns devices in it

		if ($fields{"all"} || $fields{"REALM"}){
			if ($l2tp_supported){
				# now figure out which realms pod supports
				@temp = &listRealm($self);
				@not_realm = split(/,/,$not_realm);
				%not_hash = ();
				foreach $item (@not_realm){
					$not_hash{$item} = $item;
				}
				foreach $item (@temp){
					if (! $not_hash{$item}){
						$pod_info{$pod}->{REALM} .= "$item,";
					}
				}
				chop $pod_info{$pod}->{REALM};
				$pod_info{$pod}->{NOT_REALM} = $not_realm;
			}
		}
		if ($fields{"all"} || $fields{"L2TP"}){
			if ($l2tp_supported){
				# figure out what l2tp providers are supported
				@transit = split(/,/,$pod_info{$pod}->{PROVIDER});
				@temp = &listAccessTransit($self, transit => \@transit,
							subset => "L2TP");
				foreach $item (@temp){
					if ($not_l2tp !~ /$item/){	
						$pod_info{$pod}->{L2TP} .= "$item,";
					}
				}
				if ($pod_info{$pod}->{L2TP}){
					chop $pod_info{$pod}->{L2TP};
				}
				$pod_info{$pod}->{NOT_L2TP} = $not_l2tp;
			}
		}

		if ($fields{"all"} || $fields{"LAST_CHANGE"}){

			# check and see last time tfep in pod was modified
			%tfep_info = &getTfepConfig($self, pod => "$pod");
			$pod_info{$pod}->{LAST_CHANGE} = "";
			foreach $tfep (keys %tfep_info){
				if ($pod_info{$pod}->{LAST_CHANGE} && $tfep_info{$tfep}->{LAST_CHANGE}){
					if ($tfep_info{$tfep}->{LAST_CHANGE} > $pod_info{$pod}->{LAST_CHANGE}){
						$pod_info{$pod}->{LAST_CHANGE} = $tfep_info{$tfep}->{LAST_CHANGE};
					}
				} else {
					$pod_info{$pod}->{LAST_CHANGE} = $tfep_info{$tfep}->{LAST_CHANGE};
				}
			}
		}
		
		
        }
        dbmclose %config;
        dbmclose %pod;

	if ($debug){
		print $debug "getPodConfig:\tdata returned by getPodConfig:\n";
		foreach $pod (sort keys %pod_info){
			print $debug "getPodConfig:\t\t$pod\n";
			foreach $item (sort keys %{$pod_info{$pod}}){
				print "getPodConfig:\t\t\t$item\t\t$pod_info{$pod}->{$item}\n";
			}
		}
	}

        return %pod_info;

}

###############################################################################
# sub getSwitch
# description:  search switch list for l4 switch that supports pod and 
#		and determine ip info
#
# params:
#	pod	pod name(s).  can be scalar or arrayref
#
# return value:
#	hash keyed by pod name with values stored by reference.  the following
#	values are returned:
#
#		NAME		actual name of switch
#		IP		actual ip address of switch
#		VIP_NAME	virtual ip name of swich
#		VIP		virtual ip of switch
#		
# example:
#	to get virtual hostname of switch for pod cc
#		%hash = $obj->getSwitch(pod => "cc");
#		print "VIP_NAME:  $hash{cc}->{VIP_NAME}\n";
#
#

sub getSwitch{

	my $self = shift;
	my $param = { @_ };
	
	my @addresses;
	my $host;
	my $is_ref;
	my $item;
	my @pods;
	my $pod;
	my $result;
	my %return;

	if ($param->{"pod"}){
		$is_ref = ref($param->{"pod"});
		if ($is_ref){
			@pods = @{$param->{"pod"}};
		} else {
			push(@pods, $param->{"pod"});
		}
	} else {
		print STDERR "Nettools::Rotor error:  You must provide pod name for method get switch\n";
		exit;
	}

	# check and make sure switchlist location is defined
	if (! $self->{"switch_list"}){
		print STDERR "Nettools::Rotor error:  switch_list location not defined\n";
		exit;
	}

	foreach $pod (@pods){
		$result = `/usr/bin/grep \"\\-$pod\\-\" $self->{"switch_list"}`;
		# format in switchlist:
		# switch name, location, switch type, model, login, enable, budget code, budget name
		if ($result =~ /^([^,]+)?,([^,]+)?,([^,]+)?,([^,]+)?,([^,]+)?,([^,]+)?,/){
			$return{$pod}->{NAME} = $1;
			if ($return{$pod}->{NAME} !~  /\.aol\.com/){
				$return{$pod}->{NAME} .= ".aol.com";
			}
		}

		if ($return{$pod}->{NAME}){
			# save some typing
			$host = $return{$pod}->{NAME};
			# find out IP of switch for the pod

			# get actual ip address
                	@addresses = gethostbyname($host);
			@addresses = map {inet_ntoa($_)} @addresses[4 .. $#addresses];
			foreach $item (@addresses){
				$return{$pod}->{IP} = $item;
			}

			# get virtual ip
			$return{$pod}->{VIP_NAME} = "dial-$pod-l4.dial.aol.com";
			$host = $return{$pod}->{VIP_NAME};
                	@addresses = gethostbyname($host);
			@addresses = map {inet_ntoa($_)} @addresses[4 .. $#addresses];
			foreach $item (@addresses){
				$return{$pod}->{VIP} = $item;
			}
		} else {
			$return{$pod}->{NAME} = "not listed";
		}
	}

	return %return;
}

###############################################################################
# sub getSiteConfig
# description:  return config info on a site
#

sub getSiteConfig{

	my $self = shift;
	my @sites;
	my $site;
	my %return_hash;

        dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";
	
	@sites = split(/,/,$config{SITE});

	foreach $site (@sites){
		$return_hash{$site} = $config{$site};
	}

	return %return_hash;
}

###############################################################################
# subroutine:  getTfepConfig
# Description:  retrive tfep config info from config.db
#
# parameters:
#
#	debug		debug mode.  if filehandle is passed, messages will be 
#			sent to it
#
#	pod     	return the configs for all tfeps in pod name passed (can either
#			be single pod or array reference containing pod names)
#
#	tfep		return config for specific tfep
#
#	transit		return tfeps for a specific transit provider (scalar, or arrayref)	
#
#	NOTE:  if no parameters are passed, all tfep configs will
#	       be returned
#
# return values:
# 	this method will return a hash containing tfeps and config info for
#	the tfep. The format is
#
#               $hash{$tfep_name}->{VALUE}
#
# 	where VALUE can be one of the following keys
#
#       AWEIGHT         actual weight of tfep
#       CLIENT          client(s) supported by tfep
#       DIAL            dial providers supported by tfep. This is determined by
#                       the dial providers supported by the tfeps transit provider
#       IP              IP address of tfep
#	LAST_CHANGE	time (epoch) when last change to tfep was made
#       MAX_USER        maximum # of users that can connect to tfep
#       NOT_DIAL        dial providers not supported by tfep.
#       PROTOCOL        protocol(s) supported by tfep
#       PROVIDER        Transit Provider
#       STATUS          status of tfep (in or out)
#	TIH_NAME	name of tfep as it appears in tih master list
#
#
#  examples
#
#  to get the config info for tfeps in pod ba:
#	%hash = $obj->getTfepConfig( pod => "ba");
#
#  to retrieve tfep configs for pods ba, ce, and bj:
#	@pods = ("ba", "ce", "bj");
#	%hash = $obj->getTfepConfig( pod => \@pods );
#
#  	alternate method:
#	%hash = $obj->getTfepConfig( pod => ["ba","ce","bj"] );
#
#  to display max user capacity of tfep-ba1:
#	%hash = $obj->getTfepConfig( tfep => "tfep-ba1");
#	print "max: $hash{tfep-ba1}->{MAX_USER}\n";
#
#  to retrieve all tfep configs:
#	%hash = $obj->getTfepConfig();
#


sub getTfepConfig{

	my $self = shift;
	my $param = { @_ };

        my %config;
	my $debug;
        my $ip;
        my $max_user;
	my %dial;
	my $ipt_list;
	my $ipt_ip;
	my $item;
	my $last_change;
	my $multiple;
        my $not_dial;
	my $not_realm;
	my $not_l2tp;
        my @pods;
        my $pod;
	my %pod;
        my $protocol;
        my $provider;
	my @providers;
        my $service;
        my $status;
	my %temp_hash;
	my $tih_name;
        my %tfep_config;
        my $tfep;
        my @tfeps;

	# determine what was passed to the script and build
	# array containg tfeps we need to get config data
	# on

	if ($param->{debug}){
		if ($param->{debug} =~ /\*/){
			# filehandle, send debug messages to it
			$debug = $param->{debug};
		} else {
			$debug = *STDOUT;
		}
		print $debug "getTfepConfig:\tgetTfepConfig is in debug mode, sending messages to $debug\n";
	}

	if ($param->{pod}){

		# test to see if pod param is a reference

		if ($param->{pod}){
			my $is_ref = ref($param->{pod});
			if ($is_ref){
				# user passed array reference to an array containing the
				# pods they want to view
				@pods = @{$param->{pod}};
			} else {
				push(@pods, $param->{pod});
			}
		}
	} elsif ($param->{transit}){
		$is_ref = ref($param->{transit});	
		if ($is_ref){
			@providers = @{$param->{transit}};
		} else {
			push(@providers, "$param->{transit}");
		}
		print $debug "getTfepConfig:\ttransit param passed, value:  @providers\n" if $debug;
		if ($debug){
			@pods = &listPods($self, transit => \@providers, debug => $debug);
		} else {
			@pods = &listPods($self, transit => \@providers);
		}
		print $debug "getTfepConfig:\tpods returned by listPods:  @pods\n" if $debug;
	} elsif ($param->{tfep}){
		$is_ref = ref($param->{tfep});	
		if ($is_ref){	
			@tfeps = @{$param->{tfep}};
		} else {
			push(@tfeps,"$param->{tfep}");
		}

	} else {

		# user wants all tfep configs
		@tfeps = &listTfeps($self);
	}

	if ($pods[0]){
		# now retrive the list of tfeps we need
		@tfeps = listTfeps($self,pod => \@pods); 
	}

	# get dial provider info to use later
        %dial = &getAccessTransit($self);

        #retrieve info from pod db
        dbmopen (%pod, "$self->{pod_db}", 0666) or die "Cannot open $self->{pod_db}: $!\n";
        dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";
	print $debug "getTfepConfig:  pod database used:  $self->{pod_db}\n" if $debug;
	print $debug "getTfepConfig:  config database used:  $self->{pod_db}\n" if $debug;

	# get tfep config information from databases
        foreach $tfep (@tfeps){
		if (! exists $tfep_config{$tfep}){
			# pod db values
        		($provider, $ip, $lns_ip, $max_user, $tih_name) = split(/;/,$pod{$tfep});
               		$tfep_config{$tfep}->{PROVIDER} = $provider;
               		$tfep_config{$tfep}->{IP} = $ip;
                	$tfep_config{$tfep}->{MAX_USER} = $max_user;
			$tfep_config{$tfep}->{TIH_NAME} = $tih_name;

			# config database values
       		 	($status,$service,$protocol,$actual_weight,$not_dial,$not_realm,$not_l2tp,$last_change) = split(/;/,$config{$tfep});
       		        $tfep_config{$tfep}->{STATUS} = $status;
			$tfep_config{$tfep}->{CLIENT} = $service;
			$tfep_config{$tfep}->{PROTOCOL} = $protocol;
			$tfep_config{$tfep}->{AWEIGHT} = $actual_weight;
			$tfep_config{$tfep}->{NOT_DIAL} = $not_dial;
			$tfep_config{$tfep}->{LAST_CHANGE} = $last_change;

			#retrieve dial providers using tfeps
        		#first get dial providers using transit providers configured for tfep
        		%not_hash = ();
			@search = ();
			if ($tfep_config{$tfep}->{PROVIDER} =~ /,/){
                		@search = split(/,/,$tfep_config{$tfep}->{PROVIDER});
                	} else {
                		@search = ("$tfep_config{$tfep}->{PROVIDER}");
                	}
                	foreach $search (@search){
                		foreach $item (keys %dial){
					if ($dial{$item}->{TRANSIT} eq $search){
                                		$tfep_config{$tfep}->{DIAL} .= "$item,";
                                	}
                        	}
                	}
                	chop $tfep_config{$tfep}->{DIAL} if defined $tfep_config{$tfep}->{DIAL};
                	# then remove dial providers not supported by this tfep
                	@dial_providers = split(/,/,$tfep_config{$tfep}->{DIAL}) if defined $tfep_config{$tfep}->{DIAL};
                	@not_dial = split(/,/,$tfep_config{$tfep}->{NOT_DIAL});
                	foreach $item (@not_dial){
                		$not_hash{$item} = $item;
                	}
                	$supported = "";
                	foreach $item (@dial_providers){
                		if (! $not_hash{$item}){
                        		$supported .= "$item,";
                        	}
                	}
                	chop $supported;
                	$tfep_config{$tfep}->{DIAL} = $supported;
        	}

	}
        dbmclose %pod;
        dbmclose %config;

	if ($debug){
		print $debug "getTfepConfig:\tvalues returned by getTfepConfig:\n";
		foreach $tfep (sort keys %tfep_config){
			print $debug "getTfepConfig:\ttfep:  $tfep\n";
			foreach $item (sort keys %{$tfep_config{$tfep}}){
				print $debug "getTfepConfig:\t\t$item\t\t$tfep_config{$tfep}->{$item}\n";
			}
		}
	}
				
	print $debug "\n" if $debug;

        return(%tfep_config);
}


###############################################################################
# sub:  getTfepUser
# description:  returns current user load on tfep
#
# parameters:  
#	tfep		tfep name  (scalar or arrayref)
#	pod		pod name (returns all tfeps in pod, can be scalar or
#			arrayref)
#
# NOTE:  if no params are passed, all tfeps are returned
#
# return value:
#	hash keyed by tfep name with user count as value
#
# NOTE:  user_data must be defined for this method to work
#


sub getTfepUser{
	
	my $self = shift;
	my $param = { @_ };
	my $is_ref;
	my @tfeps;
	my @pods;
	my $tfep;
        my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst,$file_date,$yest_date);
	my $raw_data;
	my $user_data;
	my $search_tfep;
	my %return;

	# check to see if user_data is defined, if not, error and exit
	if (! $self->{user_data}){
		print STDERR "Nettools::Rotor error:  You must provide a user data file location for method getTfepUser\n";
		exit;
	}

	# determine what we are retrieving data on
	if ($param->{tfep}){
		$is_ref = ref($param->{tfep});
		if ($is_ref){
			@tfeps = @{$param->{tfep}};
		} else {
			push(@tfeps, $param->{tfep});
		}
	} elsif ($param->{pod}){
		$is_ref = ref($param->{pod});
		if ($is_ref){
			@pods = @{$param->{pod}};
		} else {
			push(@pods, $param->{pod});
		}
		# get tfep list
		@tfeps = &listTfeps($self, pod => \@pods);
	} else {
		@tfeps = &listTfeps($self);
	}
		
	# file name is details.
	$user_data = $self->{user_data} . "details.";

        # determine current date
        ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
        $file_date = strftime("%Y%m%d",$sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);

        ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time - 86400);
        $yest_date = strftime("%Y%m%d",$sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);


        # there is a problem with obtaining current user data at midnight each
        # night due to the sapi scripts.  We need to check to make sure the current
        # dates file exists, if not, use previous days data

        if (-e "$user_data$file_date"){
                $raw_data = `/usr/bin/tail -n 1 $user_data$file_date`;
        } elsif (-e "$user_data$yest_date") {
                $raw_data = `/usr/bin/tail -n 1 $user_data$yest_date`;
        } else {
		print STDERR "Nettools::Rotor error:  Can't locate user data file\n";
		exit;
	}

	# pull out info
	foreach $tfep (@tfeps){	
        	if ($raw_data =~ /$tfep=(\d+);/){
                	$return{$tfep} = $1;
        	}
	}

	return %return;

}

###############################################################################
# sub getTransit
# description:  returns transit provider configuration
#
# parameters
#	name	name of transit provider
#		this can be in scalar, or an arrayref or anon array
#
#	NOTE:  if no name is provided, all transit provider configs will
#	       be returned
#
# return values:
#
#	hash keyed by transit name and following ref values:
#               ZONE            zone name
#               RES_TTL         resource record TTL
#               USE_CNAME       cname use (Y or N)
#		USE_GCD		use gcd method when generating rotors (1 is yes, 0 no
#               ROTOR_CONFIG    Either MAX (number of rotors must be le ROTOR_NUM) or NUM
#                               (number of rotors must eq ROTOR_NUM)
#               ROTOR_NUM       number of rotors, used in conjunction with ROTOR_CONFIG
#
# examples
#
#	to print the number of rotors ANS uses:
#		%hash = $obj->getTransit( name=> "ANS" );
#		print "$hash{ANS}->{ROTOR_NUM}\n";
#
#	to retrieve info on ANS and Sprint
#		@providers = ("SPRINT","ANS");
#		%hash = $obj->getTransit( name => \@providers);
#			or
#		%hash = $obj->getTransit( name => ["ANS","SPRINT");
#

sub getTransit{
	
	my $self = shift;
	my $param = { @_ };
	my @providers;
	my $provider;
	my ($zone, $res_ttl, $use_cname, $rotor_config, $rotor_num, $gcd_use);
	my %config;
	my %return_hash;

	# figure out what providers to retrieve
	if ($param->{name}){
		my $is_ref = ref($param->{name});
		if ($is_ref){
			@providers = @{$param->{name}};
		} else {
			@providers = "$param->{name}";
		}
	} else {
		@providers = listTransit($self);
	}

	dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	
	foreach $provider (@providers){
		($zone_name,$res_ttl,$use_cname,$rotor_config,$rotor_num,$gcd_use) = split(/;/,$config{$provider});
		$return_hash{$provider}->{ZONE} = $zone_name;
		$return_hash{$provider}->{RES_TTL} = $res_ttl;
		$return_hash{$provider}->{USE_CNAME} = $use_cname;
		$return_hash{$provider}->{ROTOR_CONFIG} = $rotor_config;
		$return_hash{$provider}->{ROTOR_NUM} = $rotor_num;
		$return_hash{$provider}->{USE_GCD} = $gcd_use;
	}
	dbmclose %config;

	return %return_hash;
}
		

###############################################################################
# sub listAccessProvider
# description:  returns listing of dial providers in array format

sub listAccessProvider{

	my $self = shift;
	my $config_db = $self->{config_db};

	my (%config, @dp, @temp);	
	my $calling_package;
	my ($item, $item2);

	dbmopen (%config, "$config_db", 0666) || die "Cannot open $config_db: $!\n";	
	@dp = split(/,/,$config{ACCESS});


	# we need to find out what package called this.  if package is not 
	# Nettools::Rotor, we need to cut of the "_dp" extensions on the keys.  

	$calling_package = caller();

	if ($calling_package ne "Nettools::Rotor"){
		# remove the _dp
		foreach $item (@dp){
			if ($item =~ /(\S+(.*))\_dp/){
				push (@temp, $1);
			}
		}
		@dp = @temp;
	}
			
	dbmclose %config;

	return @dp;			

}	


###############################################################################
# sub listAccessTransit
# description:  returns listing of access/transit providers in array format
#
# params
#
#	transit		list dts that use specific transit provider
#			(can be arrayref or scalar)
#
#	subset		L2TP or DIAL.  Lists either ATs configured to support
#			L2TP or DIAL (P3, PPP, DSL, etc)
#
# NOTE:  if no param is sent, all ATs will be returned
#
# return value
#	array list of access transit providers
#
# examples
#	get a list of all ATs
#		@dial = $obj->listAccessTransit();
#
# 	list only L2TP ATs
#		@dial = $obj->listAccessTransit( subset => "L2TP");
#

sub listAccessTransit{

	my $self = shift;
	my $param = { @_ };
	my $config_db = $self->{config_db};

	my @dial;
	my $is_ref;
	my @transit;
	my $dial;
	my @temp;
	my @protocol;
	my $transit;
	my %temp;
	my %config;
	my $item;
	my %dial_info;
	
	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	

	if ($param->{subset}){
		@temp = split(/,/,$config{"ACCESS/TRANSIT"});
		if ($param->{subset} eq "L2TP"){
			# only return dts that support l2tp
			foreach $item (@temp){
				if ($config{$item} =~ /L2TP/){
					push(@dial, $item);
				}
			}
		} else {
			# want a list of "DNS" dts, i.e. any dt that supports any 
			# protocol other than l2tp
			@protocol = &listProtocol($self);

			foreach $item (@protocol){
				if ($item ne "L2TP"){
					$temp{$item} = $item;
				}
			}

			foreach $dial (@temp){
				foreach $item (keys %temp){
					if ($config{$dial} =~ /$item/){
						push(@dial, $dial);
						last;
					}
				}
			}
		}
	} else {
		@dial = split(/,/,$config{"ACCESS/TRANSIT"});
	}

	# now pull out transit specific (if requested)
	if ($param->{transit}){
		$is_ref = ref($param->{transit});
		if ($is_ref){
			@transit = @{$param->{transit}};
		} else {
			push(@transit, $param->{transit});
		}
			
		%temp = ();
		foreach $dial (@dial){
			foreach $item (@transit){
				if ($config{$dial} =~ /^([^;]+);/){
					$transit = $1;	
					if ($transit eq $item){
						$temp{$dial} = $dial;
					}
				}
			}
		}
		@dial = ();
		foreach $item (keys %temp){
			push(@dial, $item);
		}
	}
				
	dbmclose %config;

	return @dial;
}

###############################################################################
# sub listClient
# description:  returns array listing of clients

sub listClient{

	my $self = shift;
	my $config_db = $self->{config_db};
	my %config;

	my @service;

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	
	@service = split(/,/,$config{CLIENT});
	
	return @service;
	dbmclose %config;

}

###############################################################################
# sub listCountry
# description:  returns array of country names
#

sub listCountry{

	my $self = shift;
	my $config_db = $self->{config_db};

	my @countries;

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	
	@countries = split(/,/,$config{COUNTRY});
	dbmclose %config;

	return @countries;

}

###############################################################################
# sub listL4
# description:  returns array listing of l4 pods
#
# params
#	TRANSIT 	return only pods belonging to specific transit provider
#
# return
#	sorted array of pods that are l4 enabled

sub listL4{

	my $self = shift;
	my $param = { @_ };

	my %config;
	my %pod_config;
	my @l4;
	my $pod;
	my @temp;

	if ($param->{"TRANSIT"}){
		%pod_config = &getPodConfig($self, fields => "PROVIDER");
	}
	
	dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	
	@l4 = split(/,/,$config{L4_PODS});
	dbmclose %config;

	if ($param->{"TRANSIT"}){
		@temp_l4 = @l4;
		@l4 = ();
		foreach $pod (sort @temp_l4){
			if ($pod_config{$pod}->{PROVIDER} eq $param->{"TRANSIT"}){
				push(@l4, $pod);
			}
		}
	} else {
		@l4 = sort(@l4);
	}

	return @l4;

}

###############################################################################
# sub listLns
# description:  returns sorted array listing of LNS servers 
#
# params
#	pod	return lns in specified pod (can be scalar or arrayref)
#
#	NOTE: if no pod is specified, all lns will be returned
#
# return values
#	sorted array listing of lns
#

sub listLns{

	my $self = shift;
	my $param = { @_ };
	my $is_ref;
	my @pods;
	my $pod;
	my %pod;
	my $lns_list;
	my @lns;

	if ($param->{pod}){
		$is_ref = ref($param->{pod});
		if ($is_ref){
			@pods = @{$param->{pod}};
		} else {
			push(@pods, $param->{pod});
		}
	} else {
		@pods = &listPods($self);
	}

	
	dbmopen (%pod, "$self->{pod_db}", 0666) or die "Cannot open $self->{pod_db}: $!\n";	
	foreach $pod (@pods){
		if ($pod{$pod} =~ /^\S+;\S+;(\S+)$/){
			$lns_list .= "$1,";
		}
	}
	dbmclose %pod;

	chop $lns_list;

	@lns = split(/,/,$lns_list);
	@lns = sort(@lns);
	
	return @lns;
}

###############################################################################
# sub listPods
# description:  returns sorted array listing all active pods
#
# params
#
#	l2tp		return only pods that support l2tp (set to non-null)
#	transit		list all pods that belong to transit provider
#			(arrayref or scalar)
#	debug		turn on debug messages.  if filehandle is passed,
#			debug messages will be printed to it.
#
# return value:
#	array of pod names
#

sub listPods{

	my $self = shift;
	my $param = { @_ };

	my $debug;
	my $is_ref;
	my $key;
	my $pod;
	my @pods;
	my %pod;
	my %pod_config;
	my $pod_list;
	my @temp;
	my @transit;
	my $transit;


	if ($param->{debug}){
		if ($param->{debug} =~ /\*/){
			$debug = $param->{debug};
		} else {
			$debug = *STDOUT;
		}
	}


	dbmopen (%pod, "$self->{pod_db}", 0666) or die "Cannot open $self->{pod_db}: $!\n";	
	print $debug "listPods:  database used:  $self->{pod_db}\n" if $debug;

	# determine if we are getting pods only belonging to a transit provider
	if ($param->{transit}){
		$is_ref = ref($param->{transit});
		if ($is_ref){
			@transit = @{$param->{transit}};
		} else {
			push(@transit, $param->{transit});
		}
		print $debug "listPods:\ttransit providers passed:  @transit\n" if $debug;
		foreach $transit (@transit){
			$pod_list .= "$pod{$transit},";
			print $debug "listPods:\tpod_list{$transit}: $pod_list{$transit}\n" if $debug;
		}
		chop $pod_list;
		@pods = split(/,/,$pod_list);
	} elsif ($param->{l2tp}){
		@pods = split(/,/,$pod{L2TP_POD});
	} else {
		@pods = split(/,/,$pod{POD});
	}

	dbmclose %pod;

	if ($debug){
		print $debug "listPods:\tdata returned: ";
		foreach $pod (@pods){
			print $debug "$pod ";
		}
		print $debug "\n";
	}
	
	return @pods;

}

###############################################################################
# sub listPorts
# description:  returns sorted array list of ports
#

sub listPorts{

	my $self = shift;
	my %config;
	my @ports;
	my @sorted;


        dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";
	@ports = split(/,/,$config{PORT});
	@sorted = sort {$a <=> $b} @ports;
	dbmclose %config;
	return @sorted;

}
	
###############################################################################
# sub listProtocol
# description:  returns array listing of protocol

sub listProtocol{

	my $self = shift;
	my $config_db = $self->{config_db};
	my %config;

	my @protocol;

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	
	@protocol = split(/,/,$config{PROTOCOL});
	
	return @protocol;
	dbmclose %config;

}

###############################################################################
# sub listRaspServer
# description: returns a list of hostnames running the rasp process
#

sub listRaspServer{

	my $self = shift;
	my %config;
	my @rasp;

	dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	
	
	@rasp = split(/,/,$config{RASP});
	
	dbmclose %config;
	
	return @rasp;

}

###############################################################################
# sub listRealm
# description:  returns array listing of realms

sub listRealm{

	my $self = shift;
	my $config_db = $self->{config_db};
	my %config;

	my @realms;

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	
	@realms = split(/,/,$config{REALM});
	
	return @realms;
	dbmclose %config;

}

###############################################################################
# sub:  listRealmPods
# description:  return a listing of pods that support a specified realm
#
# params:
#	realm 		realm name (can be scalar or arrayref) pass "all" to
#			view all realms
#	array		return data in array format keyed by hash
#	live		return only pods currently in production (status is in)
#
# NOTE:  if no params are passed, all realms will be returned.
#
# return value:
#	hash keyed by realm name of pods.  values are comman delimated, unless
#	array format was requested
#

sub listRealmPods{
	
	my $self = shift;
	my $param = { @_ };

	my $is_ref;
	my %l2tp_status;
	my $lns;
	my @lns;
	my %lns_config;
	my $pod;
	my @pods;
	my %pod_info;
	my @realms;
	my $realm;
	my %realms_wanted;
	my %return_hash;
	my @temp;

	# determine which realms were requested
	if (! $param->{realm} || $param->{realm} eq "all"){
		@realms = &listRealm( $self );
	} else {
		$is_ref = ref($param->{realm});
		if ($is_ref){
			@realms = @{$param->{realm}};
		} else {
			push(@realms, $param->{realm});
		}
	}

	# build a hash of realms wanted
	foreach $realm (@realms){
		$realms_wanted{$realm} = $realm;
	}

	# retrieve a list of pod configs
	%pod_info = &getPodConfig( $self, l2tp => 1 );

	# build a hash for each pod containing the realms each pod supports
	foreach $pod (sort keys %pod_info){
		if ($pod_info{$pod}->{STATUS} eq "in" || ! $param->{live}){
			@temp = split(/,/,$pod_info{$pod}->{REALM});
			foreach $realm (@temp){
				if ($realms_wanted{$realm}){
					$return_hash{$realm} .= "$pod,";
				}
			}
		}
	}

	# make sure at least one ipt device in pod is in production
	# if live param is active
	if ($param->{live}){
		foreach $realm (keys %return_hash){
			@pods = split(/,/,$return_hash{$realm});
			delete $return_hash{$realm};
			foreach $pod (@pods){
				if (! $l2tp_status{$pod}){
					%lns_config = &getLnsConfig($self, pod => "$pod");
					foreach $lns (keys %lns_config){
						if ($lns_config{$lns}->{STATUS} eq "in"){
							# at least on ipt is in service
							$l2tp_status{$pod} = "in";
							last;
						}	
					}
					if (! $l2tp_status{$pod}){
						$l2tp_status{$pod} = "out";
					}
				}
				if ($l2tp_status{$pod} eq "in"){
					$return_hash{$realm} .= "$pod,";
				}
			}
		}
	}

	# chop off any extra commas and convert to array if necessary
	foreach $realm (keys %return_hash){
		chop $return_hash{$realm};
		if ($param->{array}){
                        $return_hash{$realm} = [split(/,/, $return_hash{$realm})];
		}
	}

	return %return_hash;
}

		
	
	


###############################################################################
# sub listServers
# description:  returns array listing of dns servers for zone files to be 
#		copied to.
#

sub listServers{

	my $self = shift;
	my $config_db = $self->{config_db};

	my @server;

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	
	@server = split(/,/,$config{DNS});
	
	return @server;
	dbmclose %config;

}


###############################################################################
# sub listSite()
# description:  return array listing of sites
#
#

sub listSite{

	my $self = shift;
	my %config;
	my @site;

	dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	
	
	@site = split(/,/,$config{SITE});
	
	dbmclose %config;
		
	return @site;

}
	

###############################################################################
# sub listTfeps
# description:  returns sorted array of tfeps.
#
# parameters passed:
#	pod	pod name or array reference containing a list of pods
#
#	NOTE:  if no parameters are passed, a list of all tfeps will
#	       be returned
#
# return values:  sorted array listing of tfeps
#
# examples:
#       return listing of all tfeps
#		@array = $obj->listTfeps();
#
#	return listing of tfeps in pod ba
#		@array = $obj->listTfeps( pod => "ba");
#
#	return listing of tfeps in pods ba and bj
#		@pods = ("ba", "bj");
#		@array = $obj->listTfeps( pod => \@pods);
#
#		alternate method:
#		@array = $obj->listTfeps( pod => ["ba","bj"]);
#		
#

sub listTfeps{

	my $self = shift;

	my $param = { @_ };

	my @pods;
	my $pod;
	my %pod;
	my @tfeps;
	my $tfep_list;
	my $list;
	my $junk;
	my $junk2;

	# determine what parameters were passed (if any)
	if ($param->{pod}){
		my $is_ref = ref($param->{pod});
		if ($is_ref){
			@pods = @{$param->{pod}};
		} else {
			@pods = ("$param->{pod}");
		}
	} else {
		@pods = &listPods($self);
	}

	my $config_db = $self->{config_db};
	my $pod_db = $self->{pod_db};


	dbmopen (%pod, "$pod_db", 0666) or die "Cannot open $pod_db: $!\n";	

	foreach $pod (@pods){
		($junk,$list,$junk2) = split(/;/,$pod{$pod});
		$tfep_list .= "$list,";
	}
	chop $tfep_list;
	dbmclose %pod;
			
	@tfeps = split(/,/,$tfep_list);

	@tfeps = sort(@tfeps);

	return @tfeps;

}

###############################################################################
# sub listTransit
# description:  returns array listing of transit providers
#

sub listTransit{

	my $self = shift;
	my $config_db = $self->{config_db};
	my @transit;
	my %config;

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	

	@transit = split(/,/,$config{PROVIDER});
	
	dbmclose %config;

	return @transit;
}

###############################################################################
# sub listTransitPods
# description:  returns list of pods that support a transit provider
#
# parameters:
#
#       name            name of transit provider (scalar, arrayref, or anon
#                       array
#
#       array           return list in array format
#
# return values:
#       default is comma-delimated list of pods, unless array format is requested
#
# examples:
#
#       get pods that support ANS
#               %hash = $obj->listTransitPods( name => "ANS");
#               print "ANS Pods:  $hash{ANS}\n";
#
#       list pods that support ANS and SPRINT
#               @providers = ("ANS","SPRINT");
#               %hash = $obj->listTransitPods (name => \@providers);
#                       or
#               %hash = $obj->listTransitPods (name => ["ANS","SPRINT"]);
#
#       list pods that support ANS in array format
#               %hash = $obj->listTransitPods( name => "ANS",
#                                              array => 1);
#               foreach $pod (@{$hash{"ANS"}}){
#                       print "$pod\n";
#               }
#

sub listTransitPods{

        my $self = shift;
        my $param = { @_ };

        my $is_ref;
        my @providers;
        my $provider;
        my %pod;
        my $item;
        my %return_hash;
        my @temp;

        # figure out which provider was requested (if any)
        if ($param->{name}){
                $is_ref = ref($param->{name});
                if ($is_ref){
                        @providers = @{$param->{name}};
                } else {
                        push(@providers, $param->{name});
                }
        } else {
                @providers = &listTransit($self);
        }

        # retrieve the list of pods for each provider from pod_db
        dbmopen (%pod, "$self->{pod_db}", 0666) or die "Cannot open $self->{pod_db}: $!\n";
        foreach $provider (@providers){
                $return_hash{$provider} = $pod{$provider};
                # make return value an array if required
                if ($param->{array}){
                        $return_hash{$provider} = [split(/,/, $return_hash{$provider})];
                }
        }
        dbmclose %pod;

        return %return_hash;
}


###############################################################################
# sub lockFile
# description:  sets and/or returns lock file
# 
# note:  this only defines the file used when creating a lock file, it
# 	 does NOT generate the actual rotor lock file
#

sub lockFile{
	
	my $self = shift;
	
	if ($_[0]){
		$self->{lock_file} = $_[0];
	}

	return $self->{lock_file};
}

###############################################################################
# sub logEvent
# description:  logs an event to logfile
#
# examples:
#	$obj->logevent( cat => "CATEGORY",
#			message => "message");
#

sub logEvent{

 	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);
	my $log_date;

	my $self = shift;
	my $log = $self->{log_file};

	my $params = { @_ };

	if (! $log){
		print STDERR "Nettools::Rotor error:  You must provide the location of rotor event log for method logEvent\n";
		exit;
	}

 	($sec,$min,$hour,$mday,$mon,$year,$wday,$isdst) = localtime(time);
        $log_date = strftime("%Y%m%d %H:%M",$sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);

	open (LOG, ">> $log") || die "Nettools::Rotor error: Can't open $log, $!\n";
	
	print LOG "$log_date,$params->{cat},$params->{message}\n";
	
	close LOG;

}	
 
###############################################################################
# sub logFile
# description: sets and/or returns location of log file
#

sub logFile{

	my $self = shift;

	if ($_[0]){
		$self->{log_file} = $_[0];
	}
	
	return $self->{log_file};

}	

###############################################################################
# sub new
# description:  creates a new rotor object 
#
# required parameters:
#		config_db:  location of rotor config database
#		pod_db:  location of rotor pod database
#
# optional parameters:
#		debug:		pass filehandle to activate debugging to file
#				ex:   debug => *FILE
#		log_file:	location of rotor event log
#		lock_file:  	location of rotor lock file		
#		switch_list:	location of switchlist.db file
#		user_data:	directory path to user data (from user graph data)
#

sub new{

        my $classname = shift;

	$self = { @_ };

        bless($self, $classname);

	# initialize database locations

	# check to make sure we have all the necessary information
	if (! $self->{config_db}){
		print STDERR "Nettools::Rotor Error:  You must provider the location of config_db\n";
		exit;
	} elsif (! $self->{pod_db}){
		print STDERR "Nettools::Rotor Error:  You must provider the location of pod_db\n";
	}

	return $self;
}

###############################################################################
# sub podDb
# description: sets and/or returns location of pod database
#

sub podDb{

	my $self = shift;

	if ($_[0]){
		$self->{pod_db} = $_[0];
	}
	
	return $self->{pod_db};

}	


###############################################################################
# sub removeAccessTransit
# description:  deletes access/transit relationship from database
 
sub removeAccessTransit{

	my $self = shift;
	my $config_db = $self->{config_db};

	my ($dp, @dp, $temp, $dp_list);
	my %config;
	
	$dp = $_[0];

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	

	# delete record
	delete $config{"$dp"};

	# remove it from access/transit list
	if ($config{"ACCESS/TRANSIT"} =~ /$dp/){
		@dp = split(/,/,$config{"ACCESS/TRANSIT"});
		foreach $temp (@dp){
			if ($temp ne $dp){
				$dp_list .= "$temp,";
			}
		}
		chop $dp_list;
		$config{"ACCESS/TRANSIT"} = $dp_list;
	}
	dbmclose %config;
}

###############################################################################
# sub removeATvalue
# description:  removes value from supplied access/transit provider
#
# required parameters:  
#	(0):  provider
#	(2):  category
#	(3):  value
#
# no return value
#
# examples:
#
#	removeATvalue("ANS/us","PROTOCOL","PPP");
#		removes PPP protocol support from ANS/us
#
#	removeATvalue("ANS/us","ALARM","PPP-AOL");
#		removes the PPP-AOL alarm threshold from ANS/us
#

sub removeATvalue{

	my $self = shift;
	my $config_db = $self->{config_db};

	my ($dp, $category, $value);
	my %dp;
	my %config;
	my ($transit,$service,$protocol,$dns,$alarm,$zone_name,$net_id);
	my @temp;
	my $item;
	
	$dp = $_[0];
	$category = $_[1];
	$value = $_[2];


	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";	
        ($transit,$service,$protocol,$dns,$alarm,$zone_name,$net_id) = split(/;/,$config{"$dp"});

	if ($category eq "TRANSIT"){
		$transit = "";
	} elsif ($category eq "CLIENT"){
		if ($service =~ /$value/){
			@temp = split(/,/,$service);
			$service = "";
			foreach $item (@temp){
				if ($item ne $value){
					$service .= "$item,";
				}
			}
			chop $service;
		}
	} elsif ($category eq "PROTOCOL"){
		if ($protocol =~ /$value/){
			@temp = split(/,/,$protocol);
			$protocol= "";
			foreach $item (@temp){
				if ($item ne $value){
					$protocol .= "$item,";
				}
			}
			chop $protocol;
		}
	} elsif ($category eq "DNS"){
		if ($dns =~ /$value/){
			@temp = split(/,/,$dns);
			$dns = "";
			foreach $item (@temp){
				if ($item ne $value){
					$dns .= "$item,";
				}
			}
			chop $dns;
		}
	} elsif ($category eq "ALARM"){
		if ($alarm =~ /$value/){
			@temp = split(/,/,$alarm);
			$alarm = "";
			foreach $item (@temp){
				if ($item !~ /$value/){
					$alarm .= "$item,";
				}
			}
			chop $alarm;
		}
	} elsif ($category eq "ZONE_NAME"){
		if ($zone_name=~ /$value/){
			@temp = split(/,/,$zone_name);
			$zone_name = "";
			foreach $item (@temp){
				if ($item ne $value){
					$zone_name .= "$item,";
				}
			}
			chop $zone_name;
		}
	} elsif ($category eq "NET_ID"){
		if ($net_id =~ /$value/){
			@temp = split(/,/,$net_id);
			$net_id = "";
			foreach $item (@temp){
				if ($item ne $value){
					$net_id .= "$item,";
				}
			}
			chop $net_id;
		}
	}

	$config{"$dp"} = "$transit;$service;$protocol;$dns;$alarm;$zone_name;$net_id";
	dbmclose %config;
}

###############################################################################
# sub removeConfigValue
# description:  removes generic config database value
#
# parameters
#	data_set	name of data set (PORT, COUNTRY, etc)
#	name		name of value to delete
#

sub removeConfigValue{

	my $self = shift;
	my $param = { @_ };

	my @values;
	my %config;
	my $item;

	dbmopen (%config, "$self->{config_db}", 0666) or die "Cannot open $self->{config_db}: $!\n";	

	@values = split(/,/,$config{"$param->{data_set}"});
	$config{"$param->{data_set}"} = ();

	if ($param->{data_set} eq "ACCESS"){
		$param->{name} .= "_dp";
	}

	foreach $item (@values){
		if ($item ne $param->{name}){
			$config{"$param->{data_set}"} .= "$item,";
		}
	}

	chop $config{"$param->{data_set}"};

	if ($config{"$param->{name}"}){
		delete $config{"$param->{name}"};
	}

	dbmclose %config;
}

###############################################################################
# method:  testLock
# Description:  this method will examine the lock file to see if the rotor
#               is currently locked
#
# Required Parameters:
#       lock: path and filename of lock file
#       user:   userid of the person testing the lock
#
# Data Returned:
#       1.  lock exists, created by different user: "exists"
#       2.  lock exists, created by user within 10 minute time frame:  "refresh"
#       3.  lock exists, but is no longer valid: null value
#       4.  lock exists, set by userid, but is older than 10 minutes: "expired"
#
# example:
# 		$obj->testLock( user => "user");
#		   		

sub testLock{

	my $self = shift;
	
	my $param = { @_ };

	if (! exists $param->{user}){
		print STDERR "Nettools::Rotor error:  You must provide user name for method testLock()\n";
		exit;
	}
	
	if (! exists $self->{lock_file}){
		print STDERR "Nettools::Rotor error:  You must provide lock file location for method testLock()\n";
		exit;
	}

	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);
        my ($past_time, $lock_time, $current_time);
        my $lock_file = $self->{lock_file};
        my $lmonth;
	my $lday;
	my $lyear;
	my ($lhour,$lmin);
        my $data_dir;
        my $lock_user;
	my $user_id = $param->{user};
	my $result;
        my $refresh;

        # calculate the time 10 minutes ago, the time limit for the zone file
        $past_time = time - 600;
        $current_time = time;

        # first, see if the file exists and retrieve the lock time and user
        if (-e "$lock_file"){
                open (LOCK_FILE, "$lock_file");
                while(<LOCK_FILE>){
                        if (/LOCK SET\s+(\S+\s\S+)/){
                                $lock_time = $1;
                        } elsif (/USERID\s+(\S+)/){
                                $lock_user = $1;
                        }
                }
                close LOCK_FILE;
                # convert the lock time to epoch seconds
                if ($lock_time =~ /(\d+)\/(\d+)\/(\d+)\s(\d+):(\d+)/){
                        $lmonth = $1;
                        $lmonth--;
                        $lday = $2;
                        $lyear = $3;
                        $lhour = $4;
                        $lmin = $5;
                        $lsec = "0";
                }
                $lock_time = timelocal($lsec,$lmin,$lhour,$lday,$lmonth,$lyear);
                $debug_time = localtime($past_time);

                # compare lock time to current time, indicate if current time is
                # within 10 minutes of lock time

                if (($current_time - $lock_time) <= 600){
                        $result = "refresh";
                }

                #if time is within 10 minutes, check to see who the user is
                if ($result){
                        if ($user_id eq $lock_user){
                                if (($current_time - $lock_time) > 600){
                                        $result = "expired";
                                } else {
                                        $result = "refresh";
                                }
                        } else {
                                $result = "exists";
                        }
                }

        }

        return $result;
}

###############################################################################
# sub:  userData
# description: returns current directory location of user data file used to get 
#	       tfep user load.  if parameter is passed, user_data is set
#	       to it.
#

sub userData{
	my $self = shift;
	if ($_[0]){
		$self->{user_data} = $_;
	}

	return $self->{user_data};
}

 # standard return true
1;

