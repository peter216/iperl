#!/usr/bin/perl
# $Id: conditionHash.pm 20188 2009-06-01 15:40:30Z swolfe $
# tags: lib
#
# descr: Subroutines for working with condition hashes.
#
# A condition hash consists of three parts (key, status, and day), separated by
# delimiter characters ($DELIM), that together define a 'condition'.
# The first part (key) doesn't change from day to day and is used to determine
# the number of days that the condition has been in the hash. The key cannot
# contain the delimiter character.
# The second part (status) consists of a set of status variables that can vary
# from day to day. The status cannot contain the delimeter character.
# The third part (day) is the Julian day that the condition was first
# stored in the hash.
#
# contents:
#
#   conditionHash   = new();
#   void            = addH(newConditionHash,oldConditionHash,key,status);
#   conditionHash   = cpPermH(conditionHash);
#   day             = dayH(value);
#   boolean         = existsH(conditionHash,key);
#   value           = joinH(status,day);
#   void            = printH(newConditionHash,oldConditionHash,format);
#   conditionHash   = readH(filename);
#   status,day      = splitH(value);
#   status          = statusH(value);
#   void            = writeH(conditionHash,filename);
#

package Nettools::misc::conditionHash;

use strict;
use warnings;

use 5.6.1;
use vars qw( @ISA @EXPORT );
use Exporter;
@ISA    = qw( Exporter );
@EXPORT = qw(
    new
    addH
    cpPermH
    dayH
    existsH
    joinH
    printH
    readH
    splitH
    statusH
    writeH
);

use lib qw( /opt/nettools/lib );
use Nettools::misc::myDate;

my $DEBUG = 0;
my $DELIM = '%';
my $PERM  = -32768;

#
# sub: main
#

#
# sub: new
# sdescr: Create a new conditionHash instance
#
sub new {

    my $firstArg  = shift;
    my $className = ref($firstArg) || $firstArg;
    my %parm      = @_;
    my $this      = \%parm;

    print STDERR "new\n" if ($DEBUG);

    return bless $this, $className;

}    # new

#
# sub: addH
# sdescr: Adds an entry to a conditionHash.
#
sub addH {

    my ($newH, $oldH, $key, $status) = @_;
    my $day;

    print STDERR "addH key=$key status=$status\n" if ($DEBUG);

    #
    # Determine if the key is in the old conditionHash.
    #
    if (existsH($oldH, $key)) {

        #
        # Yes, found it; get the old day.
        #
        my $temp;
        ($temp, $day) = splitH($oldH->{$key});

        #
        # If this is a non-permanent exception, then increment the value.
        #
        if (($day ne $PERM) && ($day lt 0)) {
            $day++;
        }    # if

        #
        # If it's time to stop ignoring an exception, set value to today.
        #
        if ($day eq 0) {
            $day = Nettools::misc::myDate::epoToday();
        }    # if
    }

    else {

        #
        # No, this is a new key; set value to today.
        #
        $day = Nettools::misc::myDate::epoToday();
    }    # if

    #
    # If the key is already in the new conditionHash, then warn.
    #
    if (existsH($newH, $key)) {
        warn "$0::addH found duplicate key: $key\n";
    }    # if

    #
    # Add the key and value to the new conditionHash.
    #
    $newH->{$key} = joinH($status, $day);

}    # addH

#
# sub: cpPermH
# sdescr: Returns the permanent exceptions in a conditionHash.
#
sub cpPermH {

    my $oldH = shift;
    my %newH = ();

    print STDERR "cpPermH\n" if ($DEBUG);

    foreach my $key (keys %$oldH) {
        my ($status, $day) = splitH($oldH->{$key});

        if ($day eq $PERM) {
            $newH{$key} = joinH($status, $PERM);

            print STDERR "cpPermH copied $key\n" if ($DEBUG);
        }    # if
    }    # foreach

    return %newH;

}    # cpPermH

#
# sub: dayH
# sdescr: Returns the Day part of a Value.
#
sub dayH {

    my $value = shift;

    my ($status, $day) = splitH($value);
    return $day;

}    # dayH

#
# sub: existsH
# sdescr: Determines if the specified key exists in the conditionHash.
#
sub existsH {

    my ($myHash, $key) = @_;

    return exists $myHash->{$key};

}    # existsH

#
# sub: joinH
# sdescr: Joins Status and Day into a Value.
#
sub joinH {

    my ($status, $day) = @_;

    return join $DELIM, $status, $day;

}    # joinH

#
# sub: printH
# sdescr: Displays a conditionHash.
#
sub printH {

    my ($newH, $oldH, $format) = @_;

    print STDERR "printH\n" if ($DEBUG);

    foreach my $key (keys %$newH) {
        my $delta = 0;
        my ($newStatus, $newDay) = splitH($newH->{$key});

        if (existsH($oldH, $key)) {
            my ($oldStatus, $oldDay) = splitH($oldH->{$key});

            $delta = $newDay - $oldDay;
        }    # if

        printf $format, $key, $newStatus, $delta;
    }    # foreach

}    # printH

#
# sub: readH
# sdescr: Reads a conditionHash file.
#
sub readH {

    my $filename = shift;
    my %myHash   = ();

    print STDERR "readH filename=$filename\n" if ($DEBUG);

    open(FILE, "< $filename") or return %myHash;

    while (<FILE>) {
        chomp;

        my ($key, $status, $day) = split $DELIM;
        $myHash{$key} = joinH($status, $day);

        print STDERR "readH key=$key status=$status day=$day\n"
            if ($DEBUG);
    }    # while

    close(FILE);

    return %myHash;

}    # readH

#
# sub: splitH
# sdescr: Splits a Value into Status and Days.
#
sub splitH {

    my $value = shift;

    my ($status, $day) = split $DELIM, $value;
    return ($status, $day);

}    # splitH

#
# sub: statusH
# sdescr: Returns the Status part of a Value.
#
sub statusH {

    my $value = shift;

    my ($status, $day) = splitH($value);
    return $status;

}    # statusH

#
# sub: writeH
# sdescr: Writes a conditionHash file.
#
sub writeH {

    my ($myHash, $filename) = @_;

    print STDERR "writeH filename=$filename\n" if ($DEBUG);

    open(FILE, "> $filename")
        or die "$0::writeH can't open $filename : $!";

    foreach my $key (keys %$myHash) {
        my ($status, $day) = splitH($myHash->{$key});
        my $condition = join $DELIM, $key, $status, $day;
        print FILE "$condition\n";
    }    # foreach

    close(FILE);

}    # writeH

return 1;

__END__
