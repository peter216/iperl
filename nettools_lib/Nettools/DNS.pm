#############################################################################################
# package:  Nettools::DNS
# author:  Dave Steinbrunn
# date:  28 Jul 99
# version:  2.2
#
# description:  oop way to do routine aol dns stuff
#
# methods available:
#
#	dnsmgrd():  		connect to dnsmgrd and perform command
#	domain():  		sets and/or returns current domain
#       getAddress():           uses gethostbyname method to retrieve ip address
#       getHostName():          uses gethostbyaddr to retrieve host name of ip address
#	getSerial():  		retrieve serial number being used by domain
#	getSoa():  		retrieve SOA information from server.  user must
#		   		provide domain name.
#	lookup():  		do a nslookup on value passed (address or hostname)
#	nameserver():  		sets and/or returns current nameserver being used
#	new():  		constructor
#	retry():		set number of retries.  default is 3
#	testHostname		resolves hostname in DNS to see if a ip is returned
#	testLookup():  		tests to see if hostname resolves to itself
#	timeout():		set timeout.  default is 5 seconds
#	
#	private methods
#	getNameServer():  retrieve hosts dns server from /etc/resolv.conf  private
#
# NOTE:  module requires FileHandle and IO::Socket to work correctly
#
# CHANGES
#
#	20 Aug 99	DJS	changed nameserver() and domain() to set 
#				respective values
#
#	23 Aug 99	DJS	added testLookup
#
#	7 Sep 99	DJS	fixed bug to allow multiple instances of object
#				internal to a script
#	
#	10 Nov 99	DJS 	changed methods to use name => value pairs
#				added dnsmgrd
#	
#	3 Dec 99	DJS	added getRaspServer
#
#				added raspManager method to talk with rasp server
#				control port
#	
#	8 Dec 99	DJS 	added retry value
#
#	3 Feb 00	DJS	added getHostName and getAddress methods
#
#	31 May 00	DJS	added timeout
#
#	1 Aug 00	DJS	removed rasp methods since Nettools::Rasp now
#					exists
#				add testHostname method
#


package Nettools::DNS;

use Socket;
use FileHandle;
my $nslookup = "/usr/bin/nslookup";


###################################################################################
# method: dnsmgrd 
# description:  set up a tcp connection to port 616 on a dns server to do 
#		dnsmgrd related stuff
#
# params:
#	port		port number (optional, default is 616)
#	server		server name (arrayref or scalar)
#	command		command to issue
#
#
# return value:  hash keyed by server name containing result
#

sub dnsmgrd{

	my $self = shift;
	my $param = { @_ };
	my $port;
	my $log;
	my $is_ref;
	my @servers;
	my $server;
	my $address;
	my $paddr;
	my %return_hash;

	if ($param->{server}){

		$is_ref = ref($param->{server});
		if ($is_ref){
			@servers = @{$param->{server}};
		} else {
			push(@servers, $param->{server});
		}

		foreach $server (@servers){
			if ($param->{port}){
				$port = $param->{port};
			} else {
				$port = "616";
			}
	
			# create a socket
			socket(TO_SERVER, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
			
			# build address
			$address = inet_aton($server) || die "Can't convert $server into an internet address: $!\n";
			$paddr = sockaddr_in($port, $address);
	
			# connect already!
			connect(TO_SERVER, $paddr) || die "Can't connect to $server:$port:  $!\n";
	
			# flush the filehandle
			TO_SERVER->autoflush();
	
			# issue command
			print TO_SERVER "$param->{command}\n";
	
			# get results
			while (<TO_SERVER>){
				$return_hash{$server} .= $_;
			}
	
			# close connection
			close(TO_SERVER);

			chop $return_hash{$server};
		}
		
	} else {
		print STDERR "Nettools::DNS error: you must provide a server name for method dnsmgrd\n";	
		exit;
	}

	return %return_hash;
}



###################################################################################
# method:  domain
# description:  returns current domain used by object, if parameter is passed,
#		domain will be set to parameter
#
# params:
#	domain name
#
# return value:
#	string name of current domain name	

sub domain{
	
	my $self = shift;
	if ($_[0]){
		$self->{DOMAIN} = $_[0];
	}
	return $self->{DOMAIN};
}


###################################################################################
# method: getAddress
# description:  retrieve ip address using hostname using gethostbyaddr
#
# note:  this method uses default dns server listed in /etc/resolv.conf
#
#
# params:
#	hostname of device (can be scalar or arrayref)
#
# return value:
#	hash keyed by hostname of ip addresses. 
#
# note:  last ip address returned from dns is used.
#
#

sub getAddress{

	my $self = shift;
	my $arg = shift;

	my @addresses;
	my $is_ref;
	my @hosts;
	my $host;
	my %return;

	$is_ref = ref($arg);
	if ($is_ref){
		@hosts = @{$arg};
	} else {
		push(@hosts, $arg);
	}

	foreach $host (@hosts){
		# first determine if we can resolve name
		@addresses = gethostbyname($host) || die "Nettools::DNS error: Can't resolve $host\n";

		# then get addresses
		$return{$host} = inet_ntoa(inet_aton($host));
	}

	return %return;
}

###################################################################################
# method: getHostName
# description:  retrieve dns hostname for ip address provided
#
# note:  this method uses default dns server listed in /etc/resolv.conf
#
# params:
#	ip address (can be scalar or arrayref)
#
# return value:
#	hash keyed by ip address of hostname
#
#

sub getHostName{
	
	my $self = shift;
	my $value = shift;

	my $is_ref;
	my $ip;
	my @ip;
	my %return;
	
	$is_ref = ref($value);
	if ($is_ref){
		@ip = @{$value};
	} else {
		push(@ip, $value);
	}

	foreach $ip (@ip){
		$return{$ip} = gethostbyaddr(inet_aton($ip),AF_INET) || die "Nettools::DNS error: Can't resolve $ip: $!\n";
	}

	return %return;
}







###################################################################################
# method: getIcqSerial
# description:  retrieve icq serial number
#
# params:
#    	server		server(s) to query for serial number
#
# return value
#	hash keyed by server name with serial number
#

sub getIcqSerial{
	
	my $self = shift;
	my $param = { @_ };
	my $is_ref;
	my @servers;
	my $server;
	my $connection;
	my %return_hash;

	if ($param->{server}){
		$is_ref = ref($param->{server});
		if ($is_ref){
			@servers = @{$param->{server}};
		} else { 
			push(@servers, $param->{server});
		}

		# retrieve data
		foreach $server (@servers){
			
			$connection = &connect($self, server => "$server");

			print $connection "icqserial\n";

			$return_hash{$server} = <$connection>;

			close($connection);

		}
		
	} else {
		print STDERR "Nettools::DNS error:  you must provide a server name for method getIcqSerial\n";
		exit;
	}

	return %return_hash;
}
			
			


###################################################################################
# method:  getNameServer()  (private method)
# description: initializes default name server to value in /etc/resolve.conf
#
#

sub getNameServer{                  

	my $self = shift;
	my $result;

	if (-e "/etc/resolv.conf"){
		open(RESOLV, "/etc/resolv.conf") || die "Can't open /etc/resolv.conf: $!\n";
		while (<RESOLV>){
			if (/nameserver\s+(\S+)/){
				$self->{NAMESERVER} = $1;
			}
		}
		if ($self->{NAMESERVER} && $self->{NAMESERVER} =~ /\d+\.\d+\.\d+\.\d+/){
			$result = &lookup($self, value => "$self->{NAMESERVER}");
			if ($result && $result !~ /error/i){
				$self->{NAMESERVER} = &lookup($self, value => "$self->{NAMESERVER}");
			}
		}
	}
	return $self->{NAMESERVER};
}

###################################################################################
# method: getSerial()
# description: retrieves serial number name server is currenlty serving.
#
# params:
#	server		name of name server to query
#
#	NOTE:  if server name is not passed, default server will be used
#
# return:
#	string containing serial number
#
# example:
#	getSerial(server => "aol-01a.aol.com")
#

sub getSerial{

	my $self = shift;
	my $param = { @_ };
	my $result;
	my $return;
	my $server;

	if ($param->{server}){
		$server = $param->{server};
	} else {
		$server = $self->{NAMESERVER};
	}
		
	$result = &getSoa($self, server => "$server");
	if ($result =~ /serial\s+=\s+(\d+)/){
		$return = $1;
	}
	return $return;
}

##################################################################################
# method getSoa()
# description:  will conduct soa query to name server
#
#
# params
#	doamin		domain name
#	server		name server to perform query on
#
#	NOTE:  if a param is not passed, default value will be used
#
# return:
#	string containing results of SOA query
#
# example:
#	getSoa(domain => "ans.aol.com"):  returns soa for ans.aol.com on default name 
#				          server
#	
#	getSoa():	returns soa for default domain on default name
#			server
#

sub getSoa{

	my $self = shift;
	my $param = { @_ };
	my $result;
	my $domain;
	my $name_server;

	if ($param->{"domain"}){
		$domain = $param->{"domain"};
	} else {
		$domain = $self->{DOMAIN};
	}

	if ($param->{server}){
		$name_server = $param->{server};
	} else {
		$name_server = $self->{NAMESERVER};
	}

	$result = `$nslookup -q=soa -retry=$self->{RETRY} -timeout=$self->{TIMEOUT} $domain $name_server`;

	return $result;
}

################################################################################
# method:  lookup()
# description:  resolves name on default name server
#
#
# params:
#	value		host name or ip address
#	server		name of server to use
#
# NOTE:  you must provide value parameter.  if server param is not passed,
#	 default name server will be used
#
# return value:
#	string containing result of lookup
#
# example:  
#	lookup(value => "cartman.office.aol.com"):  returns ip address of host
#
#	lookup(value => "10.0.8.18"): returns hostname of ip address
#

sub lookup{


	my $self = shift;
	my $param = { @_ };
	my $result;
	my $return;
	my $lookup;
	my $server;
	my @result;
	my $line;
	my $start;

	if ($param->{server}){
		$server = $param->{server};
	} else {
		$server = $self->{NAMESERVER};
	}

	if ($param->{value}){
		$lookup = $param->{value};
		if ($lookup =~ /\d+\.\d+\.\d+\.\d+/){
			if ($self->{RETRY}){
				@result = `$nslookup -retry=$self->{RETRY} -timeout=$self->{TIMEOUT} $lookup $server 2>&1`;
			} else {
				@result = `$nslookup $lookup -timeout=$self->{TIMEOUT} $server 2>&1`;
			}
			foreach $line (@result){
				if ($line =~ /Name/ && ! $start){
					$start = 1;
					next;
				}
				if ($line =~ /Name:\s+(\S+)/ && $start){
					$return = $1;
				}
			}
		
			if (! $return){
				$result = join("\n",@result);
				if ($result =~/Timed out/i || $result =~/No response/){
					$return = "Error:  timed out";
                		} else {
					$return = "Error:  lookup failed";
				}
			}
		} else {
			@result = `$nslookup -retry=$self->{RETRY} -timeout=$self->{TIMEOUT} $lookup $server 2>&1`;
			foreach $line (@result){
				if ($line =~ /Address/ && ! $start){
					$start = 1;
					next;
				}
				if ($start && $line =~ /Address(es)?:\s+(\S+)/){
					$return = $2;
					$return =~ s/,//;
				}
			}
			if (! $return){
				$result = join( "\n",@result);
				if ($result =~/Timed out/i || $result =~/No response/){
					$return = "Error:  timed out";
                		} else {
					$return = "Error:  lookup failed";
				}
			}
		}
	} else {
		print STDERR "Nettools::DNS error: no value passed to method lookup\n";
		exit;
	}

	return $return;
}


##############################################################################
# method:  nameserver()
# description:  returns default nameserver.  if value is passed, nameserver
#		will be set to value
#
#  params:
#		nameserver name
#
#	NOTE:  if param is not sent, name of default will be returned
#
#  return:
#		string containing name of default server
#
#

sub nameserver{
	
	my $self = shift;

	if ($_[0]){
		$self->{NAMESERVER} = $_[0];
	}
	return $self->{NAMESERVER};
}

#############################################################################
# method: new
# description:  initializes new DNS object
#
# example:
#
# 	$DNS = new Nettools::DNS
#		initializes $DNS object, with nameserver set to value
#		in /etc/resolv.conf and domain to aol.com
#
#	$DNS = Nettools::DNS->new( server => "aol-01a.aol.com",
#				   domain => "ans.aol.com");
#		initializes DNS object with values specified
#
# params
#	server		set default server name to value
#	domain		set default domain name to value
#	retry		set retry attempts (default is 3)
#

sub new{

        my $classname = shift;

        my $self = { @_ };

        bless($self, $classname);


	# set nameserver
	if ($self->{server}){
		$self->{NAMESERVER} = $self->{server};
		delete $self->{server};
	} else {
		$self->{NAMESERVER} = &getNameServer($self);
		delete $self->{server};
	}

	# set domain
	if ($self->{"domain"}){
		$self->{DOMAIN} = $self->{"domain"};
	} else {
		$self->{DOMAIN} = "aol.com.";
	}

	# set retry
	if ($self->{retry}){
		$self->{RETRY} = $self->{retry};
	} else {
		$self->{RETRY} = 3;
	}

	# set timeout
	if ($self->{timeout}){
		$self->{TIMEOUT} = $self-{timeout};
	} else {
		$self->{TIMEOUT} = 5;
	}

	return $self;
}

#############################################################################
# method:  retry()
# description:   returns/sets retry value
#
# params:
#	none, if value is passed, retry is set to that value
#
#

sub retry{

	my $self = shift;
	if ($_[0] || $_[0] eq "0"){
		$self->{RETRY} = $_[0];
	}

	return $self->{RETRY};

}
		
#############################################################################
# method:  testHostname
# description:  method will determine if the hostname passed resolves
#		to at least one ip address
#
# param:
#	hostname
#
# return:
#	ok, failed, timed out
#


sub testHostname{

	my $self = shift;
	my $resolve_name = shift;
	my $ip_count;

	my $result;

	if ($resolve_name){
		$result	= &lookup($self, value => $resolve_name);
		if ($result =~ /\d+\.\d+\.\d+\.\d+/){
			return "ok";
		} elsif ($result =~ /timed out/){ 
			return "timed out";
		} else {
			return "failed";
		}
	}
}
		
#############################################################################
# method: testLookup()
# description:  method will determine if the hostname passed resolves
#               in dns to that name.
#               Note:  if americaonline.aol.com is passed, method will
#                      test for \d+.internet.aol.com and not
#                      americaonline.aol.com
#
# required parameters:
#               host		hostname
#
# return data:
#               string value: ok, fail, timed out
#

sub testLookup{

	my $self = shift;
	my $param = { @_ };
	my $result;
	my $return;

        if ($param->{host}){
                $result = `$nslookup -retry=$self->{RETRY} -timeout=$self->{TIMEOUT} $param->{host} $self->{NAMESERVER}`;
                if ($param->{host} eq "americaonline.aol.com"){
                        if ($result =~ /\d+\.internet\.aol\.com/){
                                $return = "ok";
                        } elsif ($result =~/Timed out/i || $result =~/No response/){
                                $return = "timed out";
                        } else {
                                $return = "fail";
                        }
                } else {
                        if ($result =~ /Name:\s+$param->{host}/){
                                $return = "ok";
                        } elsif ($result =~/Timed out/i || $result =~/No response/){
                                $return = "timed out";
                        } else {
                                $return = "fail";
                        }
                }
        } else {
                print STDERR "Nettools::DNS error - You must provider a hostname for testLookup()\n";
        }
}


#############################################################################
# method:  timeout()
# description:  sets timeout value.  default is 3
#

sub timeout{

	my $self = shift;
	my $timeout = shift;

	if ($timeout){
		$self->{TIMEOUT} = $timeout;
	}

	return $self->{TIMEOUT};

}
# standard true return value
1;
