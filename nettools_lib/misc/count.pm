#!/usr/bin/perl
# $Id: count.pm 20095 2009-05-28 19:59:17Z swolfe $
# tags: lib
#
# descr: Subroutines for working with counts.
#
# Contents:
#     $count = new();
#     void   = printC($newCount,$oldCount,$format);
#     $count = readC($filename);
#     void   = writeC($count,$filename);
#

package Nettools::misc::count;

use strict;
use warnings;

my $DEBUG = 0;

#
# sub: main
#

#
# sub: new
# sdescr: Creates a new count instance
#
sub new {

    my $firstArg  = shift;
    my $className = ref($firstArg) || $firstArg;
    my $this      = shift;

    print STDERR "$0::new()\n" if ($DEBUG);

    return bless $this, $className;

}    # new

#
# sub: printC
# sdescr: Displays a count instance
#
sub printC {

    my ($ncnt, $ocnt, $format) = @_;

    print STDERR "$0::printC()\n" if ($DEBUG);

    my $delta = $ncnt - $ocnt;
    printf $format, $ncnt, $delta;

}    # printC

#
# sub: readC
# sdescr: Reads a count file
#
sub readC {

    my ($filename) = @_;
    my $cnt = 0;

    print STDERR "$0::readC()\n" if ($DEBUG);

    open(FILE, "< $filename") or return $cnt;

    while (<FILE>) {
        chomp($_);
        $cnt = $_;
    }    # while

    print STDERR "$0::readC: cnt=$cnt\n" if ($DEBUG);

    close(FILE);

    return $cnt;

}    # readC

#
# sub: writeC
# sdescr: Writes a count file
#
sub writeC {

    my ($cnt, $filename) = @_;

    print STDERR "$0::writeC($filename)\n" if ($DEBUG);

    open(FILE, "> $filename")
        or die "count::writeC can't open $filename : $!";

    print FILE "$cnt\n";

    close(FILE);

}    # writeC

return 1;

__END__
