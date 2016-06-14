#!/usr/bin/perl
# $Id: summaryHash.pm 20095 2009-05-28 19:59:17Z swolfe $
# tags: lib
#
# descr: Subroutines for working with Summary Hashes.
#
# Contents:
#   %summaryHash = new();
#   void         = addH(%summaryHash,$key,$value);
#   boolean      = existsH(%summaryHash,$key);
#   void         = incrementH(%summaryHash,$key);
#   void         = initializeH(%summaryHash,$key);
#   void         = printH(%newSummaryHash,%oldSummaryHash,$format);
#   %summaryHash = readH($filename);
#   void         = writeH(%summaryHash,$filename);
#

package Nettools::misc::summaryHash;

use strict;
use warnings;

my $DEBUG = 0;

#
# sub: main
#

#
# sub: new
# sdescr: Creates a new summaryHash instance
#
sub new {

    my $firstArg  = shift;
    my $className = ref($firstArg) || $firstArg;
    my %parm      = @_;
    my $this      = \%parm;

    print STDERR "$0::new($firstArg)\n" if ($DEBUG);

    return bless $this, $className;

}    # new

#
# sub: addH
# sdescr: Adds the passed value to sum of the passed summaryHash key
#
sub addH {

    my ($hash, $key, $value) = @_;
    my $sum;

    print STDERR "$0::addH()\n" if ($DEBUG);

    if ($value =~ /^-?\d+$/) {
        if (exists $hash->{$key}) {
            $sum = $hash->{$key} + $value;
        }
        else {
            $sum = $value;
        }    # if

        $hash->{$key} = $sum;
    }    # if

}    # addH

#
# sub: existsH
# sdescr: Determines if the specified key exists in the summaryHash
#
sub existsH {

    my ($hash, $key) = @_;

    return exists $hash->{$key};

}    # existsH

#
# sub: incrementH
# sdescr: Increments the count of the passed summaryHash key
#
sub incrementH {

    my ($hash, $key) = @_;
    my $sum;

    print STDERR "$0::incrementH()\n" if ($DEBUG);

    if (exists $hash->{$key}) {
        $sum = $hash->{$key} + 1;
    }
    else {
        $sum = 1;
    }    # if

    $hash->{$key} = $sum;

}    # incrementH

#
# sub: initializeH
# sdescr: Initializes the count of the passed summaryHash key
#
sub initializeH {

    my ($hash, $key) = @_;

    print STDERR "$0::initializeH()\n" if ($DEBUG);

    if (!exists $hash->{$key}) {
        $hash->{$key} = 0;
    }    # if

}    # initializeH

#
# sub: printH
# sdescr: Displays a summaryHash
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
# sdescr: Reads a summaryHash file; returns the hash
#
sub readH {

    my ($filename) = @_;
    my %hash = ();

    print STDERR "$0::readH($filename)\n" if ($DEBUG);

    open(FILE, "< $filename") or return %hash;

    while (<FILE>) {
        chomp($_);
        my ($key, $val) = split('%');
        $hash{$key} = $val;
    }    # while

    close(FILE);

    return %hash;

}    # readH

#
# sub: writeH
# sdescr: Writes a summaryHash file
#
sub writeH {

    my ($hash, $filename) = @_;

    print STDERR "$0::writeH($filename)\n" if ($DEBUG);

    open(FILE, "> $filename")
        or die "$0::writeH can't open $filename : $!";

    foreach my $key (sort keys %$hash) {
        my $val = $hash->{$key};
        print FILE "$key%$val\n";
    }    # foreach

    close(FILE);

}    # writeH

return 1;

__END__
