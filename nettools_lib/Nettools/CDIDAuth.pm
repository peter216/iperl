package Nettools::CDIDAuth;

use 5.006;
use strict;
use warnings;
use Apache::Constants qw(:response);
use SOAP::Lite;
use Apache::Log ();
use CGI;
use CGI::Cookie;
use Data::Dumper;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Nettools::CDIDAuth ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = (
	'all' => [
		qw(

		  )
	]
);

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(

);
our $VERSION = '0.05';

# Preloaded methods go here.

sub handler {
	my $r        = shift;
#	$r->log_error("Hello from CDIDAuth.pm");
	my @requires = $r->dir_config("require");
	return DECLINED unless @requires;

	my $explanation = "
<html><head><title>Unauthorized</title></head>
<body><h1>You are not authorized to access this page</h1>";

	my $extra_explanation = $r->dir_config("AuthExplanationText")
	  || " ";
	$explanation .= "<p> $extra_explanation </p></body></html>";

	#Get the config values and establish some defaults
	my $logon_host = $r->dir_config("LogonServletURL")
	  || "https://auth.netops.aol.com/Logon";
	my $auth_service_wsdl_url = $r->dir_config("AuthServiceWSDL")
	  || "http://auth-r.netops.aol.com:8080/jboss-net/services/AuthenticationService?wsdl";
	my $auth_target = $r->dir_config("AuthTarget")
	  || "default";
	my $cookie_name = $auth_target . "authTicket";
	my $auth_bypass = $r->dir_config("AuthBypass");
	my @bypasses    = [];
	if ($auth_bypass) {
		@bypasses = split /\s*,\s*/, $auth_bypass;
	}
	my $qs = "";
	if ( defined( $r->args ) ) {
		$qs = "?" . CGI::escape( $r->args );
	}

	#build the redirect uri to send back to the client if we need it.
	my $redirect_uri = $logon_host
	  . "/showForm.do?url="
	  . "http://"
	  . $r->hostname
	  . $r->uri
	  . $qs;

	#if the request ip is in the bypasses list, let them in
	my $request_ip = $r->connection->remote_ip;
	if ( grep { $_ eq $request_ip } @bypasses ) {
		return OK;
	}

	#Look for the cookie and get the ticket if it is there
	my $cookie_header = $r->header_in("Cookie");
	my %cookies       = parse CGI::Cookie($cookie_header);

	if ( !defined( $cookies{$cookie_name} ) ) {
		#$r->log_error("No auth cookie found, redirecting...");
		#If we didn't get a cookie, redirect to the Logon Servlet
		$r->custom_response( REDIRECT, $redirect_uri );
		return REDIRECT;
	}
	else {
		#$r->log_error("We got a cookie, validating...");
		#If we got a cookie, validate it

		my $authService = SOAP::Lite->service($auth_service_wsdl_url);
		my %authResult  = %{
			$authService->validateAssertionKey( $cookies{$cookie_name}->value,
				$auth_target, $request_ip )
		  };
		#$r->log_error(Dumper(%authResult));
		if ( $authResult{authenticated} || $authResult{Authenticated} ) {
			my $authedUser = $authResult{user};
    		#	$r->log_error("The user was authenticated");
			#If the ticket was valid, forward to the url
			for my $entry (@requires) {
				my ( $requirement, @rest ) = split /\s+/, $entry;
		#		$r->log_error("requirement is $requirement");
				#handle authorization if users are specified
				if ( lc $requirement eq 'user' ) {
					foreach (@rest) {
						if ( lc($authedUser) eq lc($_) )
						{    #This user is authorized
							$r->connection->user($authedUser);
							$r->connection->auth_type("Nettools::CDIDAuth");
							return OK;
						}
					}
				}
				elsif ( lc $requirement eq 'remote-authorization' ) { #Call isAuthorized()
		#			$r->log_error("In remote-authorization handler");
					my $authorResult =
						$authService->isAuthorized($authedUser, $auth_target,  "view");
					if ($authorResult) {
					$r->connection->user($authedUser);
					$r->connection->auth_type("Nettools::CDIDAuth");
					return OK;
					}
				}
				elsif ( lc $requirement eq 'valid-user' ) {    #Let anybody in

					$r->connection->user($authedUser);
					$r->connection->auth_type("Nettools::CDIDAuth");
					return OK;
				}
			}

			#They were authenticated, but not authorized
			$r->custom_response( FORBIDDEN, $explanation );

			$r->log_reason( "user $authedUser: not authorized", $r->filename );
			return FORBIDDEN;
		}
		else {

			#If the ticket was bad, send them back to the LogonServlet
			$r->custom_response( REDIRECT, $redirect_uri );
			return REDIRECT;

		}
	}
}
1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

Nettools::CDIDAuth - mod_perl Access Handler to perform CDID/SecureID Authentication

=head1 SYNOPSIS

  in a .htaccess file in the directory you want to protect -

    PerlAccessHandler Nettools::CDIDAuth
    PerlSetVar LogonServletURL https://auth.netops.aol.com/Logon
    PerlSetVar AuthTarget default
    PerlSetVar AuthServiceWSDL http://auth-r.netops.aol.com:8080/jboss-net/services/AuthenticationService?wsdl
    
    PerlSetVar AuthExplanationText "Blah blah, blah..."
    PerlSetVar AuthBypass 10.0.24.16, 127.0.0.1
    PerlAddVar require "user wesgurn jasonbjenkins"

This example only allows wesgurn and jasonbjenkins to access the page.  To allow anyone with a CDID replace the last line with :

    PerlAddVar require "valid-user"
    
=head1 DESCRIPTION
    
This module works with mod_perl and apache to implement CDID/SecureID authentication. The module will redirect the user to 
the SecurityFrameworks LogonServlet to authenticate them using CDID, password and SecureID.  If successfully authenticated, a 
cookie is set on the users browser so that future request to the same AuthTarget do not require reauthentication, even across
different servers.  Following a sucessful authentication the REMOTE_USER environment varible is set to the CDID of the 
authenticated user, and AUTH_TYPE is set to "Nettools::CDIDAuth"

To use it, add an .htacess file to the directory you want to protect.
    
An example .htaccess is given above in the SYNOPSIS.  Here's an explanation of each line
    
=head2 PerlAccessHandler Nettools::CDIDAuth
    
This tells Apache to use the module
    
=head2 PerlSetVar LogonServletURL http://my.netops.aol.com:8080/Logon
    
This tells the module the location of the Logon servlet to redirect to.
    
=head2  PerlSetVar AuthTarget default

Specifies the authentication target that the SecurityFramework should use to authenticate against.  
Unless you have implemented a custom authentication framework, use "default".  One possible value
is "gno-only" which only authorized users whose department number from LDAP is under Global Network Ops.

=head2  PerlSetVar AuthServiceWSDL http://wrap-d.netops.aol.com:8000/ccx/AuthService?wsdl

The location of the WSDL for the Authentication Web Service that this module uses to do verfiy authentications.
    
=head2 PerlSetVar AuthExplanationText "Blah blah, blah..."

This line is optional.  If it is given, the contents of the line are appended to the error page that users recieve if they are not authorized 
to view the page

=head2 PerlSetVar AuthBypass 10.0.24.16. 127.0.0,1

This line is optional.  If it is present, requests from IP addresses in the list are always allowed.  Not authorization or authentication is performed. 

=head2 PerlAddVar require "user wesgurn jasonbjenkins"

This line lists users that are authorized to access the content.  The list of users are seperated with whitespace.  Multiple "require" lines are allowed.
Alternatively, you can use the value "valid-user" instead of "user username..." to allow any authenticated user to connect.
You can also use the value "remote-authorization", if specified this will force a call to the isAuthorized 
method of the SecurityFramework.  This is only useful if you are using a custom authenication target.
 

=head1 AUTHOR

Jason Jenkins<lt>jj@aol.net<gt>

=cut
