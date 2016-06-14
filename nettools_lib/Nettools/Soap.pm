package Nettools::Soap;

use 5.006;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Nettools::Soap ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(getWSDLurlForService
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(getWSDLurlForService 
	
);
our $VERSION = '1.02';

use UDDI::Lite;

#load the default hash of wsdl urls to use if uddi is unavailible;
our %default_wsdl_url;
do "default_wsdl_urls.conf";

sub getWSDLurlForService {
	my ($wsdl_URL, $serviceKey, $tModelKey);
	my $service = shift;
	my $uddiURL = getUDDIurl();
	#eval { #wrap this in an eval block to catch errors
	eval { 
	 $serviceKey = UDDI::Lite
   	 	#-> on_debug(sub{print@_})
    		-> proxy("$uddiURL")
    		-> find_service(name => "$service")
    		-> result
    		-> serviceInfos->serviceInfo->serviceKey;
		
    
 	 $tModelKey = UDDI::Lite
		# -> on_debug(sub{print@_})
  		-> proxy("$uddiURL")
  		->get_serviceDetail(serviceKey => "$serviceKey")
  		->result
  		->businessService->bindingTemplates->bindingTemplate
  		->tModelInstanceDetails->tModelInstanceInfo->tModelKey;

	$wsdl_URL = UDDI::Lite
 		#-> on_debug(sub{print@_})
  		->proxy("$uddiURL")
  		->get_tModelDetail(tModelKey => $tModelKey)
  		->result
  		->tModel->overviewDoc->overviewURL;
		
	};
	
	if ($@) { # If we didnt get anything 
		#UDDI must be broken, return a default url for the service 
		#if you know one
		$wsdl_URL = $default_wsdl_url{$service};
		}
		
	return $wsdl_URL;
}

sub getUDDIurl {
	#This should be smarter
	return 'http://wrap-d.netops.aol.com:8000/uddi/inquire';
	}



1;
__END__


=head1 NAME

Nettools::Soap - Perl extension for interacting with AOL Network Management 
Web Services.  

=head1 SYNOPSIS

  use Nettools::Soap;
  my $WSDLurl = getWSDLurlForService('EventProxy');

=head1 DESCRIPTION

This module provides wrappers for calls to the UDDI registry and other routines
common to all web services.  Most developers using the code in this module will
be developing higher-level wrappers for other web services.

=head1 FUNCTIONS

=over 4

=item B<getWSDLurlForService(I<service>)>

This function returns the URL of the WSDL for the specified service, if it 
exists.  It will attempt to find the service in the UDDI registry.  If the 
registry is unavailible it will return a default URL for the service. This 
default url is defined in the file $PERL_LIB/default_wsdl_urls.conf.  The 
location of $PERL_LIB is as defined in the perl Config.pm for your installation.  

If an error occurs during the lookup, the text of the error is returned.  If
the requested service is unknowm, an empty string is returned 


=back

=head1 AUTHOR

Jason Jenkins, E<lt>jj@aol.netE<gt>
Copyright 2002, AOL Inc.

=head1 SEE ALSO

B<Nettools::Soap> requires B<UDDI::Lite>, part of the B<SOAP::Lite> package
availible from CPAN.

=head1 FILES

=over 4

=item B<$PERL_LIB/default_wsdl_urls.conf>

This config file (which is writen in perl) defines a hash of default url to
use to find the WSDL for a service if UDDI is unavailible.

=back

=cut
