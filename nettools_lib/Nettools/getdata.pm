#!/usr/local/bin/perl
#

package Nettools::getdata;

use strict;
use warnings;

use Exporter;

our @ISA    = qw( Exporter );
our @EXPORT = qw( getdata );

use lib qw( /opt/nettools );
use Nettools::DeviceDirectory;

use Storable;

#
# Constants
#
my $ALTDIR               = '/data/nettools/ndparse/results';
my $CSDIR                = '/data/commandscheduler/results';
my $DEBUG                = 0;
my $DEVDIR               = '/data/nettools/netdevices.xml';
my $STORED_DEVICES_TABLE = "/opt/nettools/ndparse/tmp/getdata_devices";
my %TYPEDIR              = (
    'A10 NETWORKS'    => {
        'SWITCH' =>  'a10_switch',
    },
    'ARISTA NETWORKS' => {
        'SWITCH' => 'arista_switch',
    },
    'BROCADE'         => {
        'ROUTER' => 'brocade_router',
        'SWITCH' => 'brocade_switch',
    },
    'CIENA'           => {
        'DWDM'   => 'ciena_aolwave',
    },
    'CISCO SYSTEMS'   => {
        'ROUTER' => 'cisco_router',
        'SWITCH' => 'cisco_switch',
    },
    'CITRIX'          => {
        'SWITCH' => 'citrix_switch',
    },
    'DELL'            => {
        'SWITCH' => 'dell_switch',
    },
    'ERICSSON'        => {
        'SWITCH' => 'ericsson_aolwave',
    },
    'FOUNDRY'         => {
        'ROUTER' => 'foundry_router',
        'SWITCH' => 'foundry_switch',
    },
    'JUNIPER'         => {
        'ROUTER' => 'juniper_router',
        'SWITCH' => 'juniper_switch',
    },
    'MOVAZ NETWORKS'  => {
        'DWDM' => 'movaz_aolwave',
    },
);
my $VERSION = '20120104-1';

#
# Get list of network devices from netdevices.xml.
#
$DEVDIR = Nettools::DeviceDirectory->new( $DEVDIR );

my $asset_update = ( stat( $DEVDIR->{path} ) )[9] || 0;
my $stored_update = 0;

if ( -f $STORED_DEVICES_TABLE ) {
    $stored_update = ( stat( $STORED_DEVICES_TABLE ) )[9];
}

my $devices;
%$devices = ();

#
# Initialize persistent device hash for use in calls to getdata().
#
if ( $asset_update > $stored_update ) {
    my %assets = $DEVDIR->getAssetByCriteria();

    foreach my $key ( keys %assets ) {
        my ( $node, $manu, $type );

        if ( exists $assets{$key}{'nodeName'} ) {
            $node = $assets{$key}{'nodeName'};
        }

        else {
            next;
        }    # if

        if ( exists $assets{$key}{'manufacturer'} ) {
            $manu = $assets{$key}{'manufacturer'};
        }

        else {
            next;
        }    # if

        if ( exists $assets{$key}{'deviceType'} ) {
            $type = $assets{$key}{'deviceType'};
        }

        else {
            next;
        }    # if

        $devices->{$node}{'manufacturer'} = $manu;
        $devices->{$node}{'deviceType'}   = $type;

    }    # foreach

    #
    # Now store the new table for use next time (hopefully)
    #
    store $devices, $STORED_DEVICES_TABLE;
    chmod 0666, $STORED_DEVICES_TABLE;
}

else {
    $devices = retrieve $STORED_DEVICES_TABLE;
}    # if

#
# sub: getdata
# descr: returns commandscheduler data for the specified device and command.
#
sub getdata {
    my ( $device, $command ) = @_;
    my $filename;

    if ( $DEBUG ) {
        print STDERR "sub getdata\n";
        print STDERR "\tdevice       '$device'\n";
        print STDERR "\tcommand      '$command'\n";
    }    # if

    unless ( exists $devices->{$device} ) {
        return ();
    }    # unless

    my $manu = $devices->{$device}{'manufacturer'};
    print STDERR "\tmanufacturer '$manu'\n" if ( $DEBUG );

    my $type = $devices->{$device}{'deviceType'};
    print STDERR "\tdeviceType   '$type'\n" if ( $DEBUG );

    unless ( exists $TYPEDIR{$manu}{$type} ) {
        return ();
    }    # unless

    $command =~ s/\s+/_/g;

    #
    # Try Command Scheduler files first.
    #
    $filename = $CSDIR . '/' . $TYPEDIR{$manu}{$type} . '/' . $command . '/' . $device;
    print STDERR "CS filename '$filename'\n" if ( $DEBUG );

    if ( open( FILE, $filename ) ) {
        my @data = <FILE>;
        close( FILE );

        return @data;
    }    # if

    #
    # Needed file not found in Command Scheduler directories;
    # Try the alternate directories.
    #
    $filename = $ALTDIR . '/' . $TYPEDIR{$manu}{$type} . '/' . $command . '/' . $device;
    print STDERR "Alt filename '$filename'\n" if ( $DEBUG );

    if ( open( FILE, $filename ) ) {
        my @data = <FILE>;
        close( FILE );

        return @data;
    }    # if

    return ();

}    # sub getdata

return 1;

__END__

