#######################################################################################
# Package:  Nettools::Tfep
# Author:  Dave Steinbrunn
# Date:  26 Aug 99
#
# Description:  Allows manipulation of Tfep info contained in rotor databases via
#		oop interface
#
# methods available:
#
#	aweight()      	actual weight of tfep
#	currentUser()  	current user load on tfep
#       dial()          dial providers supported by tfep. This is determined by
#                      	the dial providers supported by the tfeps transit provider
#       ip()           	IP address of tfep
#       maxUser()      	maximum # of users that can connect to tfep
# 	new():  	sets up new tfep object for tfep name passed
#       notDial()       dial providers not supported by tfep.
#       protocol()     	protocol(s) supported by tfep
#       provider()     	Transit Provider
#       service()      	service(s) supported by tfep
#       status()       	status of tfep (in or out)
#
#


package Nettools::Tfep;

use NDBM_File;
use POSIX;

my $config_db, $pod_db;                 # database locations
my %config;                             # hash tied to database
my %pod;				# hash tied to pod database


#######################################################################################
# method:  aweight
# description:  returns actual weight of tfep

sub aweight{
	my $self = shift;
	return $self->{AWEIGHT};
}

#######################################################################################
# method:  currentUser
# description: returns current user load on tfep
#

sub currentUser{

	my $self = shift;
	my $raw_data;
	my $data_tfep = $self->{TFEP};
	$data_tfep =~ s/tf(e)?p-//;
	if ($data_tfep =~ /(\S+)(\d)(\d)/){
		if ($2 == 0){
			$data_tfep = "$1$3";
		}
	}
		
	# determine current date
	my $sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst,$file_date,$yest_date;
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
        $file_date = strftime("%Y%m%d",$sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);

	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time - 86400);
        $yest_date = strftime("%Y%m%d",$sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);
	

	# there is a problem with obtaining current user data at midnight each
	# night due to the sapi scripts.  We need to check to make sure the current
	# dates file exists, if not, use previous days data

	if (-e "$user_data$file_date"){
		$raw_data = `/usr/bin/tail -n 1 $user_data$file_date`;
	} else {
		$raw_data = `/usr/bin/tail -n 1 $user_data$yest_date`;
	}

	
	if ($raw_data =~ /$data_tfep=(\d+);/){
		$self->{CURRENT_USER} = $1;
	}
	
	return $self->{CURRENT_USER};
}




#######################################################################################
# method:  dial
# description: returns comma delimate list of dial providers supported 

sub dial{

	my $self = shift;
	my @search;
	my @dial;
	my %not_hash;
	my @not_dial;
	my @dial_providers;
	my $supported;
	my $item;

	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";

	# determine dial providers supported by tfep
	if ($self->{PROVIDER} =~ /,/){
        	@search = split(/,/,$self->{PROVIDER});
        } else {
        	@search = ("$self->{PROVIDER}");
        }
        @dial = split(/,/,$config{"DIAL/TRANSIT"});
        foreach $search (@search){
        	foreach $item (@dial){
               		if ($config{$item} =~ /$search/){
                        	$dial .= "$item,";
                        }
                }
        }
        chop $dial;
	
        # then remove dial providers not supported by this tfep
        @dial_providers = split(/,/,$dial);
        @not_dial = split(/,/,$self->{NOT_DIAL});
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
        $self->{DIAL} = $supported;

	%not_hash = ();
	@temp = ();
	@search = ();
	@not_dial = ();
	@dial = ();
	
	dbmclose %config;

	return $self->{DIAL};
}


#######################################################################################
# method:  ip
# description: returns tfep ip 

sub ip{
	my $self = shift;
	return $self->{IP};
}


#######################################################################################
# method:  maxUser()
# description:  returns max number of users tfep can support

sub maxUser{
	my $self = shift;
	return $self->{MAX_USER};
}

#######################################################################################
# method:  new
# description:  initializes tfep object to value passed.
#
#  required parameters:  
#	0: config db location
#	1: pod db location
#	2: location of user count data
#	3: name of tfep
#     	Note:  if database locations are not passed, default locations will
#	       be used
#
#  return data:
#       0:  object reference
#

sub new{


        my $classname = shift;
        my $self = {};
        bless ($self);

	my $item;
	my $dir;

        # init database locations
        if ($_[0] =~ /database/){
                $config_db = $_[0];
                $pod_db = $_[1];
		$user_data = $_[2];
		$self->{TFEP} = $_[3];
        } else {
		# try to find databases
		if (-e "/opstools/toolsprod/data/dns_rotor/database/pod.db.pag"){
                        $config_db = "/opstools/toolsprod/data/dns_rotor/database/config.db";
                        $pod_db = "/opstools/toolsprod/data/dns_rotor/database/pod.db";
                        $user_data = "/opstools/toolsprod/data/usrgraf/details.";
		} elsif (-e "/nettools/toolsdev/data/dns_rotor/database/pod.db.pag"){
                        $config_db = "/nettools/toolsdev/data/dns_rotor/database/config.db";
                        $pod_db = "/nettools/toolsdev/data/dns_rotor/database/pod.db";
                        $user_data = "/nettools/toolsprod/data/usrgraf/details.";
                } else {
                        print "Nettools::Tfep Error:  Unable to locate rotor databases, exiting\n";
                        exit;
                }
		$self->{TFEP} = $_[0];
        }

	# retrieve config info on tfep from pod database
	dbmopen (%pod, "$pod_db", 0666) or die "Cannot open $pod_db: $!\n";
	($self->{PROVIDER},$self->{IP}, $self->{MAX_USER}) = split(/;/,$pod{$self->{TFEP}});
	dbmclose %pod;


	# retrieve config info on tfep
	dbmopen (%config, "$config_db", 0666) or die "Cannot open $config_db: $!\n";
	($self->{STATUS},$self->{SERVICE}, $self->{PROTOCOL},$self->{AWEIGHT}, $self->{NOT_DIAL}) = split(/;/,$config{$self->{TFEP}});
	dbmclose %config;

        return $self;
}

#######################################################################################
# method:  notDial
# description: returns dial providers not supported by tfep

sub notDial{
	my $self = shift;
	return $self->{NOT_DIAL};
}


#######################################################################################
# method:  protocol
# description: returns protocols supported by tfep

sub protocol{
	my $self = shift;
	return $self->{PROTOCOL};
}

#######################################################################################
# method:  provider
# description: returns providers supported by tfep

sub provider{
	my $self = shift;
	return $self->{PROVIDER};
}

#######################################################################################
# method:  service
# description: returns services supported by tfep

sub service{
	my $self = shift;
	return $self->{SERVICE};
}


#######################################################################################
# method:  status
# description: returns status of tfep

sub status{
	my $self = shift;
	return $self->{STATUS};
}


# required true return value
1


