#!/usr/bin/perl
# $Id: myHash.pm 20095 2009-05-28 19:59:17Z swolfe $
# tags: lib
#
# descr: Subroutines for handling hashes
#
# Contents:
#     %myHash = new();
#     void    = addH(%myHash,$key,$value);
#     $value  = existsH(%myHash,$key);
#     void    = initH(%myHash,$val);
#     @keys   = keysH(%myHash);
#     void    = printH(%myHash,$format);
#     void    = printMatchH(%myHash,$value,$format);
#     %myHash = readH($filename);
#     $val    = valH(%myHash,$key);
#     void    = writeH(%myHash,$filename);
#

package Nettools::misc::myHash;

use strict;
use warnings;

my $DEBUG = 0;

#
# sub: main
#

#
# sub: new
# sdescr: Create a new %myHash instance
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
# sdescr: Add an entry to a hash
#
sub addH {

    my ($myHash, $key, $val) = @_;

    $myHash->{$key} = $val;
}    # addH

#
# sub: existsH
# sdescr: Determine if the specified key exists in a hash
#
sub existsH {

    my ($myHash, $key) = @_;

    return exists $myHash->{$key} ? $myHash->{$key} : 0;

}    # existsH

#
# sub: initH
# sdescr: Initialize all values in a hash to a specified value
#
sub initH {

    my ($myHash, $val) = @_;

    foreach my $key (keys %$myHash) {
        $myHash->{$key} = $val;
    }    # foreach

}    # initH

#
# sub: keysH
# sdescr: Return an array of all hash keys
#
sub keysH {

    my $myHash = shift @_;

    return keys %$myHash;

}    # keysH

#
# sub: printH
# sdescr: Display all hash entries (keys and values)
#
sub printH {

    my ($myHash, $format) = @_;

    print STDERR "$0::printH()\n" if ($DEBUG);

    foreach my $key (sort keys %$myHash) {
        my $val = $myHash->{$key};

        printf $format, $key, $val;
    }    # foreach

}    # printH

#
# sub: printMatchH
# sdescr: Display hash keys whose value matches a specified value
#
sub printMatchH {

    my ($myHash, $match, $format) = @_;

    print STDERR "$0::printMatchH()\n" if ($DEBUG);

    foreach my $key (keys %$myHash) {
        my $val = $myHash->{$key};

        if ($myHash->{$key} eq $match) {
            printf $format, $key;
        }    # if
    }    # foreach

}    # printMatchH

#
#
# sub: readH
# sdescr: Read a file and return the information in a hash
#
sub readH {

    my $filename = shift;
    my %myHash   = ();

    print STDERR "$0::readH($filename)\n" if ($DEBUG);

    open(FILE, "< $filename")
        || die "myHash::readH: Can't open $filename : $!\n";

    while (<FILE>) {
        my $line = $_;
        chomp($line);
        next if ($line =~ /^\s*[\!\#]/);    # Skip comments
        next if ($line =~ /^\s*$/);         # Skip blank lines

        if ($line =~ /(.+)\%(.+)/) {
            $myHash{$1} = $2;
        }
        else {
            $myHash{$line} = "";
        }                                   # if
    }    # while

    close(FILE);

    return %myHash;

}    # readH

#
# sub: valH
# sdescr: Return the value associated with a specified key
#
sub valH {

    my ($myHash, $key) = @_;

    return $myHash->{$key};

}    # valH

#
# sub: writeH
# sdescr: Write a hash array to a file
#
sub writeH {

    my ($myHash, $filename) = @_;

    print STDERR "$0::writeH($filename)\n" if ($DEBUG);

    open(FILE, "> $filename")
        || die "$0::writeH can't open $filename : $!";

    foreach my $key (sort keys %$myHash) {
        my $val = $myHash->{$key};
        print FILE "$key%$val\n";
    }    # foreach

    close(FILE);

}    # writeH

return 1;

__END__
