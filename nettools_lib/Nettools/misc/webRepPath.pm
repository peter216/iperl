#!/usr/bin/perl
# $Id: webRepPath.pm 20095 2009-05-28 19:59:17Z swolfe $
# tags: lib
#
# descr: Subroutine to read $FILENAME
#
# Contents:
#   string = webRepPath::read();
#

package Nettools::misc::webRepPath;

use strict;
use warnings;

#
# sub: main
#
my $FILENAME = <~swolfe/perl/data/webRepPath.txt>;

#
# sub: read
# sdescr: Read $FILE and return the web server report path in a string
#
sub read {

    open(FILE, "< $FILENAME")
        or die "$0::read: Can't open $FILENAME : $!\n";

    while (<FILE>) {
        my $line = $_;
        chomp($line);

        next if ($line =~ /^\s*[\!\#]/);    # Skip comments
        next if ($line =~ /^\s*$/);         # Skip blank lines

        $my $path = $line;
    }    # while

    close(FILE);

    return $path;

}    # read

return 1;

__END__
