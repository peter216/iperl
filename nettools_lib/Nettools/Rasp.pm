#####################################################################################################
# Package:  Nettools::Rasp
# Author:   Dave Steinbrunn
# Date:     22 Dec 99
#
# Description:  oop interface to issue rasp related commands
#
#
# Available methods: 
#	
#	debug			returns filehandle debug messages are printed to.  If filehandle is 
#				passed, debug will be set to it
#	getControlPort		returns control port number of server
#	getRaspServer		retrieve rasp server names and configs
#	new			object constructor
#	raspManager		connect to rasp server control ports and issue commands
#


package Nettools::Rasp;

use Socket;
use FileHandle;


#####################################################################################################
# method:  debug
# description:  returns filedhandle debug messages are printed to.  If filehandle is passed,
#		debug will be set to it
sub debug{

	my $self = shift;
	my $param = shift;

	if ($param){
		$self->{debug} = $param;
	}

	return $self->{debug};
}

#####################################################################################################
# method:  getControlPort
# description:  returns control port of server
#
# params:  
#	server		server name (scalar or arrayref)
#	dump		dump contents of return value to debug filehandle defined 
#			when object was created.  if not defined, it is passed to STDOUT
#
#
# return:
#	hash keyed by server name containing control port number
#

sub getControlPort{

	my $self = shift;
	my $param = { @_ };

	my $debug;
	my @ip;
	my $is_ref;
	my %return_hash;
	my @servers;
	my $server;

	if ($param->{server}){
		$is_ref = ref($param->{server});
		if ($is_ref){
			@servers = @{$param->{server}};
		} else {
			push(@servers, $param->{server});
		}
	} else {
		print STDERR "Nettools::Rasp error:  you must provide server name for method getControlPort\n";
		exit;
	}

	foreach $server (@servers){
                @ip = gethostbyname("$server");
                @ip = map {inet_ntoa($_)} @ip[4 .. $#ip];
                foreach $ip (@ip){
			if ($ip =~ /\d+\.\d+\.\d+\.(\d+)/){
				$return_hash{$server} = $1;
				$return_hash{$server} += 7000;
			}	
                }
	}

	if ($param->{dump}){
		if ($self->{debug}){
			$debug = $self->{debug};
		} else {
			$debug = *STDOUT;
		}

		print $debug "\n------------------------------\nvalues returned by getControlPort:\n";
		foreach $server (sort keys %return_hash){
			print "\t$server\t\t$return_hash{$server}\n";
		}
		print $debug "------------------------------\n\n";
	}

	return %return_hash;

}

#####################################################################################################
# method:  getRaspServer
# description:  determines rasp server name and control port number
#
# params: 
#	  file		rasp routes file name that server serves.  scalar or arrayref
#         		e.g.  rasp_routes.rasp-ba.tcl
#	  provider	abbreviated provider name (eg bell atlantic - ba). scalar or arrayref
#	  array		return server names in array format (set to non-null value)
#	  dump		dump contents of return value to debug filehandle defined 
#			when object was created.  if not defined, it is passed to STDOUT
#
# return value:
#         hash value keyed by provider name with following values:
#
#		SERVER		 	server names, comma delimated		
#		{server}->{IP}		ip address of server	
#		{server}->{PORT}	control port of server
# examples:
#
#       file is passed
#       return value to hash would be
#               $hash{provider}->{SERVER} = "rtc-server,dtc-server"
#               $hash{provider}->{rtc-server}->{IP} = 10.0.0.0
#               $hash{provider}->{rtc-server}->{PORT} = 7000
#
#	to obtain array listing of servers for bell atlantic
#	%hash = $obj->getRaspServer( provider => "ba",
#				     array => 1);
#
#	foreach $server (sort @{$hash{ba}->{SERVER}}){
#		print "$server\n";
#	}
#

sub getRaspServer{

        my $self = shift;
        my $param = { @_ };

	my $debug;
	my $dulles;
        my @files;
        my $file;
	my @ip;
	my $ip;
	my $item;
        my $is_ref;
	my %port;
	my $provider;
	my @providers;
	my $reston;
        my %return_hash;
	my %provider;
        my @servers;
        my $server;
	my $key;

	if ($param->{file}){
		$is_ref = ref($param->{file});
		if ($is_ref){
			@files = @{$param->{file}};
		} else {
			push(@files, $param->{file});
		}

		foreach $file (@files){	
			if ($file =~ /rasp_routes\.rasp-(\S+)\.tcl/){
				$provider = $1;
				$dulles = "dtc-rasp-" . $provider . ".ns.aol.com";
				$reston = "rtc-rasp-" . $provider . ".ns.aol.com";
                                push (@servers, $dulles, $reston);
				$provider{$reston} = $provider;
				$provider{$dulles} = $provider;
				$return_hash{$provider}->{SERVER} = "$reston,$dulles";
			}
		}
	} elsif ($param->{provider}){
		$is_ref = ref($param->{provider});
		if ($is_ref){
			@providers = @{$param->{provider}};
		} else {
			push(@providers, $param->{provider});
		}
		foreach $provider (@providers){
			$dulles = "dtc-rasp-" . $provider . ".ns.aol.com";
			$reston = "rtc-rasp-" . $provider . ".ns.aol.com";
			$provider{$reston} = $provider;
			$provider{$dulles} = $provider;
			$return_hash{$provider}->{SERVER} = "$reston,$dulles";
                        push (@servers, $dulles, $reston);
		}
        } else {
                print STDERR "Nettools::Rasp error: You must provider rasp routes file or provider name for getRaspServer method\n"; 
                exit;
        }

	# retrieve info
	foreach $server (@servers){
		$provider = $provider{$server};
		%port = &getControlPort( $self, server => "$server");
		$return_hash{$provider}->{$server}->{PORT} = $port{$server}; 
                @ip = gethostbyname("$server");
                @ip = map {inet_ntoa($_)} @ip[4 .. $#ip];
                foreach $ip (@ip){
			$return_hash{$provider}->{$server}->{IP} = $ip;
		}
	}

	# "arrayify" if required
	if ($param->{array}){
		$return_hash{$provider}->{SERVER} = [split(/,/,$return_hash{$provider}->{SERVER})];
	}

	# dump return hash if required
	if ($param->{dump}){
		if ($self->{debug}){
			$debug = $self->{debug};
		} else {
			$debug = *STDOUT;
		}
		
		print $debug "\n------------------------------\nvalues returned by getRaspServer:\n";
		foreach $provider (sort keys %return_hash){
			print $debug "\t$provider\n";
			foreach $server (sort keys %{$return_hash{$provider}}){
				if ($server eq "SERVER"){
					if ($param->{array}){
						$item = join(" ", @{$return_hash{$provider}->{$server}});
						print $debug "\tservers:  $item\n";
					} else {
						print $debug "\tservers:  $return_hash{$provider}->{$server}\n";
					}
				} else {
					print $debug "\t$server\n";
					foreach $key (sort keys %{$return_hash{$provider}->{$server}}){
						print $debug "\t\t$key\t\t$return_hash{$provider}->{$server}->{$key}\n";
					}
				}
			}
		}
		print $debug "------------------------------\n\n";
	}
        return %return_hash;
}

#####################################################################################################
# method:  new
# description:  object constructor
#
# params:
#	debug		print debug information to filehandle passed
#
# return:
#	object reference
#
# example:
#
#  creating rasp object, print debug messages to STDOUT
#	$object = Nettools::Rasp->new( debug => *STDOUT );
#

sub new{

        my $classname = shift;

        my $self = { @_ };

        bless($self, $classname);

        return $self;
}

#####################################################################################################
# method: raspManager()
# description:  connect to rasp server control port and issue command
#
# required params
#       port            port number of control port
#       server          server name or ip address
#       command         command string to issue  (required)
#       file            rasp_routes.tcl file name
#
# Note:  you must either pass file or port and server
#
# return value:
#       hash keyed by server name containg result of command
#

sub raspManager{

        my $self = shift;
        my $param = { @_ };

        my $address;
        my $paddr;
        my $key;
        my $server;
        my @servers;
        my $port;
        my %port;
	my $provider;
        my %return;
        my $debug;
        my %rasp_info;

        if ($param->{file}){

                %rasp_info = &getRaspServer($self, file => "$param->{file}");
		foreach $provider (keys %rasp_info){
                	$server = $rasp_info{$provider}->{SERVER};
                	@servers = split(/,/,$server);
                	foreach $server (@servers){
                        	$port{$server} = $rasp_info{$provider}->{$server}->{PORT};
                	}
		}

        } elsif ($param->{server}){

                push(@servers, $param->{server});
                $server = $param->{server};
                $port{"$server"} = $param->{port};

        } else {
                print STDERR "Nettools::RASP error:  You must provide server name for method raspManager()\n";
               	exit;
        }

        if ($self->{debug}){
                $debug = $param->{debug};
                print "params passed to raspManager:\n";
                foreach $key (sort keys %{$param}){
                        print "\t$key   $param->{$key}\n";
                }
        }


        foreach $server (@servers){
                if ($port{$server}){
                        if ($param->{command}){
				$debug = $self->{debug};

                                print $debug "establishing tcp connection to $server, port $port{$server}\n" if $self->{debug};

                                # create a socket
                                socket(TO_SERVER, PF_INET, SOCK_STREAM, getprotobyname('tcp'));

                                # build address
                                $address = inet_aton($server) || die "Can't convert $server into an internet address: $!\n";
                                $paddr = sockaddr_in($port{$server}, $address);

                                # connect already!
                                connect(TO_SERVER, $paddr) || die "Can't connect to $server:$port{$server}:  $!\n";

                                # flush the filehandle
                                TO_SERVER->autoflush();

                                # issue command
                                print $debug "issuing command $param->{command}\n" if $self->{debug};
                                print TO_SERVER "$param->{command}\n";

                                # get results
                                $ok = 0;
                                while (<TO_SERVER>){
                                        $return{$server} .= $_;
                                        if (/^Ok\s+?$/){
                                                $ok++;
                                                if ($ok == 2){
                                                        # end of command, exit
                                                        print $debug "exiting\n" if $self->{debug};
                                                        print TO_SERVER "exit\n";
                                                }
                                        }
                                }
                                # close connection
                                close(TO_SERVER);

                        } else {
                                print STDERR "Nettools::RASP error:  You must provide command for method raspManager()\n";
                                exit;
                        }

                } else {
                        print STDERR "Nettools::RASP error:  You must provide port number for method raspManager()\n";
                        exit;
                }
        }

        return %return;
}
























# standard true return value
1;



