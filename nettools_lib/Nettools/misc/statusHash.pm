#!/usr/bin/perl
# $Id: statusHash.pm 20179 2009-06-01 13:00:32Z swolfe $
# tags: lib
#
# descr: Subroutines for working with status hashes.
#
# Contents:
#   %newHash    = new();
#   void        = addH(%newHash,%oldHash,$key);
#   void        = addWithDelayH(%newHash,%oldHash,$key,$delay);
#   %newHash    = cpPermH(%oldHash);
#   boolean     = existsH(%oldHash,$key);
#   void        = printH(%newHash,%oldHash,$format);
#   %newHash    = readH($filename);
#   void        = writeH(%oldHash,$filename);
#

package Nettools::misc::statusHash;

use strict;
use warnings;

use lib qw( /opt/nettools/lib );
use Nettools::misc::myDate;

my $DEBUG = 0;
my $PERM  = -32768;

#
# sub: main
#

#
# sub: new
# sdescr: Create a new statusHash instance
#
sub new {
    my $firstArg  = shift;
    my $className = ref($firstArg) || $firstArg;
    my %parm      = @_;
    my $this      = \%parm;

    print STDERR "$0::new\n" if ($DEBUG);

    return bless $this, $className;
}    # new

#
# sub: addH
# sdescr: add an entry to a statusHash
#
sub addH {
    my ($newH, $oldH, $key) = @_;
    my $val;

    print STDERR "$0::addH($key)\n" if ($DEBUG);

    #
    # Determine if the key is in the old statusHash.
    #
    if (exists $oldH->{$key}) {

        #
        # Yes, found it; get the old value.
        #
        $val = $oldH->{$key};

        #
        # If this is a non-permanent exception, then increment the value.
        #
        if (($val ne $PERM) && ($val lt 0)) {
            $val++;
        }    # if

        #
        # If it's time to stop ignoring an exception, set value to today.
        #
        if ($val eq 0) {
            $val = Nettools::misc::myDate::epoToday();
        }    # if
    }

    else {

        #
        # No, this is a new key; set value to today.
        #
        $val = Nettools::misc::myDate::epoToday();
    }    # if

    #
    # If the key is already in the new statusHash, then warn.
    #
    if (exists $newH->{$key}) {
        warn "$0::addH found duplicate key: $key\n";
    }    # if

    #
    # Add the key and value to the new statusHash.
    #
    $newH->{$key} = $val;
}    # addH

#
# sub: addWithDelayH
# sdescr: add an entry to a statusHash
#
sub addWithDelayH {
    my ($newH, $oldH, $key, $delay) = @_;
    my $val;

    print STDERR "$0::addWithDelayH($key,$delay)\n" if ($DEBUG);

    #
    # Determine if the key is in the old statusHash.
    #
    if (exists $oldH->{$key}) {

        #
        # Yes, found it; get the old value.
        #
        $val = $oldH->{$key};

        #
        # If this is a non-permanent exception, then increment the value.
        #
        if (($val ne $PERM) && ($val lt 0)) {
            $val++;
        }    # if

        #
        # If it's time to stop ignoring an exception, set value to today.
        #
        if ($val eq 0) {
            $val = Nettools::misc::myDate::epoToday();
        }    # if
    }

    else {

        #
        # No, this is a new key; set value to the specified delay.
        #
        $val = -abs $delay;
    }    # if

    #
    # If the key is already in the new statusHash, then warn.
    #
    if (exists $newH->{$key}) {
        warn "$0::addWithDelayH found duplicate key: $key\n";
    }    # if

    #
    # Add the key and value to the new statusHash.
    #
    $newH->{$key} = $val;
}    # addWithDelayH

#
#
# sub: cpPermH
# sdescr: Return the permanent exceptions in a statusHash
#
sub cpPermH {
    my $oldH   = shift;
    my %myHash = ();

    print STDERR "$0::cpPermH()\n" if ($DEBUG);

    foreach my $key (keys %$oldH) {
        if ($oldH->{$key} eq $PERM) {
            $myHash{$key} = $PERM;

            print STDERR "$0::cpPermH copied $key\n" if ($DEBUG);
        }    # if
    }    # foreach

    return %myHash;
}    # cpPermH

#
# sub: existsH
# sdescr: Determine if the specified key exists in the statusHash
#
sub existsH {
    my ($myHash, $key) = @_;

    return exists $myHash->{$key};
}    # existsH

#
# sub: printH
# sdescr: Display a statusHash
#
sub printH {
    my ($newH, $oldH, $format) = @_;
    my $delta;

    print STDERR "$0::printH()\n" if ($DEBUG);

    foreach my $key (sort keys %$newH) {
        my $val = $newH->{$key};

        if (exists $oldH->{$key}) {
            $delta = $val - $oldH->{$key};
        }

        else {
            $delta = $val;
        }    # if

        printf $format, $key, $val, $delta;
    }    # foreach
}    # printH

#
# sub: readH
# sdescr: Read a statusHash file
#
sub readH {
    my $filename = shift;
    my %myHash   = ();

    print STDERR "$0::readH($filename)\n" if ($DEBUG);

    open(FILE, "< $filename") or return %myHash;

    while (<FILE>) {
        chomp($_);

        my ($key, $val) = split('%');
        $myHash{$key} = $val;

        print STDERR "$0::readH(key $key val $val)\n" if ($DEBUG);
    }    # while

    close(FILE);

    return %myHash;
}    # readH

#
# sub: writeH
# sdescr: Write a statusHash file
#
sub writeH {
    my ($myHash, $filename) = @_;

    print STDERR "$0::writeH($filename)\n" if ($DEBUG);

    open(FILE, "> $filename")
        or die "$0::writeH can't open $filename : $!";

    foreach my $key (sort keys %$myHash) {
        my $val = $myHash->{$key};
        print FILE "$key%$val\n";
    }    # foreach

    close(FILE);
}    # writeH

return 1;

__END__
