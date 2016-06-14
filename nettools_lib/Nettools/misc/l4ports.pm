#!/usr/bin/perl
# $Id: l4ports.pm 20095 2009-05-28 19:59:17Z swolfe $
#

package Nettools::misc::l4ports;

use strict;
use warnings;

use 5.6.1;
use vars qw( @ISA @EXPORT );
use Exporter;
@ISA    = qw( Exporter );
@EXPORT = qw(
    name2port
    port2name
);

my %nameTable = (
    'default'     => 0,
    'echo'        => 7,
    'discard'     => 9,
    'ftp'         => 21,
    'ssh'         => 22,
    'telnet'      => 23,
    'smtp'        => 25,
    'time'        => 37,
    'tacacs'      => 49,
    'dns'         => 53,
    'bootps'      => 67,
    'bootpc'      => 68,
    'tftp'        => 69,
    'http'        => 80,
    'pop2'        => 109,
    'pop3'        => 110,
    'nntp'        => 119,
    'ntp'         => 123,
    'netbios-ns'  => 137,
    'netbios-dgm' => 138,
    'imap4'       => 143,
    'snmp'        => 161,
    'snmp-trap'   => 162,
    'bgp'         => 179,
    'dnsix'       => 195,
    'ldap'        => 389,
    'mobile-ip'   => 434,
    'ssl'         => 443,
    'talk'        => 517,
    'rip'         => 520,
    'rtsp'        => 554,
    'ldaps'       => 636,
    'xing'        => 1558,
    'radius-o'    => 1645,    # Needed as workaround for Foundry display bug
    'radius-old'  => 1645,
    'mms'         => 1755,
    'radius'      => 1812,
    'pnm'         => 7070,
    'vxstream1'   => 12468,
    'vxstream2'   => 12469,
);

#
# sub: main
#
my %portTable = ();

#
# Build the port number to name translation table.
#
foreach my $key (keys %nameTable) {
    $portTable{ $nameTable{$key} } = $key;
}    # foreach

#
# sub: name2port
# sdescr: Given an IP Layer 4 port name, return the corresponding port number.
#
sub name2port {
    my $name = shift;

    if ($name =~ /^\d+$/) {

        #
        # Already numeric, so just return it.
        #
        return $name;
    }

    elsif (exists $nameTable{$name}) {

        #
        # Convert it.
        #
        return $nameTable{$name};
    }

    else {

        #
        # Failure.
        #
        return undef;
    }    # if
}    # name2port

#
# sub: port2name
# sdescr: Given an IP Layer 4 port number, return the corresponding port name.
#
sub port2name {
    my $port = shift;

    if ($port !~ /^\d+$/) {

        #
        # Not number, so just return it.
        #
        return $port;
    }

    elsif (exists $portTable{$port}) {

        #
        # Convert it.
        #
        return $portTable{$port};
    }

    else {

        #
        # Failure.
        #
        return undef;
    }    # if
}    # port2name

return 1;

__END__
