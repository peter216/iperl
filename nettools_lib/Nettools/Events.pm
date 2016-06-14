package Nettools::Events;

use 5.006;
use strict;
use warnings;

use Nettools::Soap;
use SOAP::Lite;
use Sys::Hostname;
use Socket;
use Carp;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Nettools::Events ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(dispatchProductionEvent 
		dispatchDevEvent
		dispatchEvent
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(dispatchProductionEvent 
		dispatchDevEvent
		dispatchEvent
	
);
our $VERSION = '1.10';


# Preloaded methods go here.

sub dispatchProductionEvent {
	my $result;
	
	#Establish some default values:
	my %args = (
		#SENDING_HOSTNAME => $hostname,
		DETECTING_PROGRAM => $0,
		SEVERITY => 'DEBUG',
		CATEGORY => 'NETTOOLS',
		@_
		);
	if (!$args{SENDING_HOSTNAME}) {
		#figure out default value for hostname
		my $hostname = hostname();
		my $address = gethostbyname($hostname) 
			or carp "Couldn't resolve $hostname : $!";
		$hostname = gethostbyaddr($address, AF_INET)
			or carp "Couldn't re-resolve $hostname : $!";
		$args{SENDING_HOSTNAME} = $hostname;
		}	
	#check to see if we got at least the required parameters
	if (!$args{EVENT_CODE} or !$args{TARGET_OBJECT} or !$args{MESSAGE}) {
		croak "Missing a required parameter in call to dispatchProductionEvent";
		}
	my $url = getWSDLurlForService('EventProxy');
	#print "Got the URL------------->: $url\n";
	eval {
		$result = SOAP::Lite
			#-> on_debug(sub{print@_})
			->service("$url")
			->DispatchProductionEvent(	$args{SENDING_HOSTNAME},
								  	$args{DETECTING_PROGRAM},
									$args{SEVERITY},
									$args{EVENT_CODE},
									$args{CATEGORY},
									$args{TARGET_OBJECT},
									$args{MESSAGE});
	};
	if ($@) { #There was a problem, we couldn't talk to the webservice
		return $@;
		}
	
	return $result; #strip any newline that comes with the result									
}

sub dispatchDevEvent {
	my $result;
	
	#Establish some default values:
	my %args = (
		#SENDING_HOSTNAME => $hostname,
		DETECTING_PROGRAM => $0,
		SEVERITY => 'DEBUG',
		CATEGORY => 'NETTOOLS',
		@_
		);
	if (!$args{SENDING_HOSTNAME}) {
		#figure out default value for hostname
		my $hostname = hostname();
		my $address = gethostbyname($hostname) 
			or carp "Couldn't resolve $hostname : $!";
		$hostname = gethostbyaddr($address, AF_INET)
			or carp "Couldn't re-resolve $hostname : $!";
		$args{SENDING_HOSTNAME} = $hostname;
		}	
	#check to see if we got at least the required parameters
	if (!$args{EVENT_CODE} or !$args{TARGET_OBJECT} or !$args{MESSAGE}) {
		croak "Missing a required parameter in call to dispatchProductionEvent";
		}
	my $url = getWSDLurlForService('EventProxy');
	#print "Got the URL------------->: $url\n";
	eval {
		$result = SOAP::Lite
			#-> on_debug(sub{print@_})
			->service("$url")
			->DispatchDevEvent(	$args{SENDING_HOSTNAME},
								  	$args{DETECTING_PROGRAM},
									$args{SEVERITY},
									$args{EVENT_CODE},
									$args{CATEGORY},
									$args{TARGET_OBJECT},
									$args{MESSAGE});
	};
	if ($@) { #There was a problem, we couldn't talk to the webservice
		return $@;
		}
	
	return $result; #strip any newline that comes with the result									
}

sub dispatchEvent {
	my $result;
	
	#Establish some default values:
	my %args = (
		#SENDING_HOSTNAME => $hostname,
		DETECTING_PROGRAM => $0,
		SEVERITY => 'DEBUG',
		CATEGORY => 'NETTOOLS',
		TYPE => 'dev',
		@_
		);
	if (!$args{SENDING_HOSTNAME}) {
		#figure out default value for hostname
		my $hostname = hostname();
		my $address = gethostbyname($hostname) 
			or carp "Couldn't resolve $hostname : $!";
		$hostname = gethostbyaddr($address, AF_INET)
			or carp "Couldn't re-resolve $hostname : $!";
		$args{SENDING_HOSTNAME} = $hostname;
		}	
	#check to see if we got at least the required parameters
	if (!$args{EVENT_CODE} or !$args{TARGET_OBJECT} or !$args{MESSAGE}) {
		croak "Missing a required parameter in call to dispatchProductionEvent";
		}
	my $url = getWSDLurlForService('EventProxy');
	#print "Got the URL------------->: $url\n";
	eval {
		$result = SOAP::Lite
			#-> on_debug(sub{print@_})
			->service("$url")
			->DispatchEvent(	$args{TYPE},	
						$args{SENDING_HOSTNAME},
						$args{DETECTING_PROGRAM},
						$args{SEVERITY},
						$args{EVENT_CODE},
						$args{CATEGORY},
						$args{TARGET_OBJECT},
						$args{MESSAGE});
	};
	if ($@) { #There was a problem, we couldn't talk to the webservice
		return $@;
		}
	
	return $result; #strip any newline that comes with the result									
}
1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

Nettools::Events - Perl extension for sending events to Netcool

=head1 SYNOPSIS

  use Nettools::Events;
  my $message = 'This is a test of the Nettools::Events module.  Please disregard.';

  print dispatchProductionEvent (	EVENT_CODE => 1392,
				SENDING_HOSTNAME => 'zoo.office.aol.com',
				DETECTING_PROGRAM => 'soaplibtest',
				SEVERITY => 'DEBUG',
				CATEGORY => 'NETTOOLS.TEST',
				TARGET_OBJECT => 'test.router.aol.com',
				MESSAGE => $message) . "\n";				
  print dispatchProductionEvent (	EVENT_CODE => 1392,
				MESSAGE => $message,
				TARGET_OBJECT => 'test.router.aol.com') . "\n";
  my $result = dispatchDevEvent (	EVENT_CODE => 3366,
				MESSAGE => $message,
				TARGET_OBJECT => 'test.router.aol.com') . "\n";
  my $result = dispatchEvent (	TYPE => 'prod'
   				EVENT_CODE => 1392,
				MESSAGE => $message,
				TARGET_OBJECT => 'test.router.aol.com') . "\n";
	

=head1 DESCRIPTION

This module provides a wrapper function for sending events to the AOL NOC 
Network Desk, via Netcool.  It uses the EventProxy web service.

=head1 FUNCTIONS

=over 4

=item B<dispatchProductionEvent(I<%parameter_hash>)>

This function send an event to the production network netcool server (NCO_NETWORK)
At a minimum the following named  parameters are required:  
EVENT_CODE, MESSAGE, TARGET_OBJECT.  These and the
other optional parameters are described below.

The function will return the reply from the EventProxy or an error message if 
there is a problem sending the event.  A sucessfull call will return the 
string 'OK'.

=back

=head2 PARAMETERS

=over 6

=item B<EVENT_CODE>

B<Required>. The Netcool event code as defined in the Event Code Data Store (ECDS).  Note 
for an event to actually make it to Netcool, the code must be marked as 
"Production" in the ECDS.  Non-production events are silently droped, but the
function will still return "OK".

=item B<TARGET_OBJECT>

B<Required>. Application, host, or object. Source of the information that 
generated the event. For example, this may be the hostname of the switch
that is generating a threshold event.

=item B<MESSAGE>

B<Required>. Text field that contains the details and description of the event.

=item B<SENDING_HOSTNAME>

The hostname of the machine that detected the event.  This defaults to the 
hostname of the machine running this script as resolved by DNS

=item B<DETECTING_PROGRAM>

The name of the program that detected the event.  This defaults to the name of 
the currently running script as returned by $0.

=item B<SEVERITY> 

The severity of the event.  Allowable values are CRITICAL, MAJOR, MINOR, WARNING, 
NORMAL, UNKNOWN, STATS, and DEBUG.  The default value is DEBUG.

=item B<CATEGORY> 

Management domain or application class which the message pertains to. Category 
hierarchy may be represented by separating levels with a period, ".". Default
value is "NETTOOLS"

=back

=over 4

=item B<dispatchDevEvent(I<%parameter_hash>)>

This function sends an event to the development instance of netcool.  
The parameter are identical to those for dispatchProductionEvent above.

The function will return the reply from the EventProxy or an error message if 
there is a problem sending the event.  A sucessfull call will return the 
string 'OK'.

=back

=over 4

=item B<dispatchEvent(I<%parameter_hash>)>

This function sends an event to the instance of netcool as specified by
the TYPE parameter. The other parameter are identical to those for 
dispatchProductionEvent above.

The function will return the reply from the EventProxy or an error message if 
there is a problem sending the event.  A sucessfull call will return the 
string 'OK'.

=back

=head2 PARAMETERS

=over 6

=item B<TYPE>

The type of event to send.  This parameter tells the proxy which server
(development or production) to send the event to. Valid values are 
"dev" or "prod".  The default value is "dev."  

=back

=head1 WARNING

Netcool will only successfuly accept events that are entered into the Event 
Code Data Store (ECDS) and that are marked for the server that you are trying
to send them too.  In other word, an event code that is marked as a production 
event will not show up in the netcool viewer if sent to the development server,
even if the viewer is looking at the dev server.  Also the Netcool Probe that 
the EventProxy sends events to is not smart enough to tell if you are sending a
valid code.  Problem codes will be dropped in the "bit bucket" silently, and the
functions in this module will still return "OK"

=head1 VERSION
1.10

=head1 AUTHOR

Jason Jenkins E<lt>jj@aol.netE<gt>
Copyright 2002, AOL Inc.

=head1 SEE ALSO

B<Nettools::Events> requires the AOL B<Nettools::Soap> module and the 
B<SOAP::Lite> package availible from CPAN.

=cut
