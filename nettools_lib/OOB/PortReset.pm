package Nettools::OOB::PortReset;


use strict;
use warnings;
use IO::Socket::INET;
use Net::Telnet();

require Exporter;
our $VERSION     = 1.00;
our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Nettools::OOB::PortReset ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(resetPort
	
);



# Preloaded methods go here.
sub resetPort {
  
  my ($ts, $port) = @_;
  my @log = (); 
  my $tsConn = new Net::Telnet(Timeout  => 15,
                              Errmode  => 'return',
                              Port     => 2000);

  push @log, "Connecting to ts: ".$ts." for reset of port ".$port.":\n";
  if ($tsConn->open($ts)) {
    push @log, "Logging into terminal server: [".$ts."]... ";
    &xyplexAuthenticate($tsConn);
    push @log, "done. \n";
    push @log, "Resetting port: [".$port."]... ";
    $tsConn->print("logout ".$port);
    push @log, "done.\n";
    push @log, "Logging-out of terminal server... ";
    $tsConn->cmd("logout");
    push @log, "done.\n";
  } else {
    $tsConn->close();
    $tsConn = new Net::Telnet(Timeout  => 15,
			      Errmode  => 'return',
			      Port     => 5000);
    
    if ($tsConn->open($ts)) {
      push @log, "Logging into terminal server: [".$ts."]... ";
      &bayAuthenticate($tsConn, $ts);
      push @log, "done.\n";
      push @log, "Resetting port: [".$port."]...";
      $tsConn->print("reset ".$port);
      sleep(1);
      push @log, "done.\n";
      push @log, "Logging-out of terminal server: ";
      $tsConn->print("quit");
      sleep(1);
      $tsConn->print("ha");
      push @log, "done.\n";
    } else {
      push @log, "Unable to connect to terminal server.";
    }
  }
  #push @log, "done.<br>\n";
  $tsConn->close();
  print @log;
  return @log;
}

sub bayAuthenticate {
  my ($tsConn, $nodename) = @_;
  my ($ip);

  $ip = &getIpAddress($nodename);

  $tsConn->waitfor('/annex:/');
  $tsConn->print(chr(8)."su");
  $tsConn->waitfor('/Password:/');
  $tsConn->print(chr(8).$ip);
  $tsConn->waitfor('/annex#/');
  $tsConn->print(chr(8)."admin");
}

sub xyplexAuthenticate {
  my ($tsConn) = @_;

  sleep(1);
  $tsConn->print(chr(8)."\n");
  $tsConn->waitfor('/#/');
  $tsConn->prompt('/>/g');
  $tsConn->cmd(chr(8)."access");
  $tsConn->cmd("script");
  $tsConn->cmd(chr(8)."set priv");
  $tsConn->cmd(chr(8)."system");
}

sub getIpAddress {
  my ($nodename) = @_;
  my @ip = ( 0, 0, 0, 0 );

  if ($nodename eq "") { return 0; }

  (my $name, my $aliases, my $addrtype, my $length, my @addrs) =
    gethostbyname($nodename);
  if (! $name) {
    return "DNE";
  }

  ($ip[0], $ip[1], $ip[2], $ip[3]) = unpack('C4', $addrs[0]);
  return "$ip[0].$ip[1].$ip[2].$ip[3]";
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Nettools::OOB::PortReset - Reset OOB Terminal Server Port

=head1 SYNOPSIS

  use Nettools::OOB::PortReset;
  @results = resetPort($terminal_server_name, $terminal_server_port

=head1 DESCRIPTION

This module will reset the specified oob terminal server port and
close the connection to whoever is connected.  A log of the results is
returned as an array. Each element is one line.

=head2 EXPORT

resetPort($terminal_server_node_name, $ts_port)

=head1 AUTHOR

Jason Jenkins, E<lt>jj@aol.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by AOL, Inc.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.6 or,
at your option, any later version of Perl 5 you may have available.


=cut
