#/usr/bin/perl
# $Id: myString.pm 20095 2009-05-28 19:59:17Z swolfe $
# tags: lib
#
# descr: Subroutines for working with strings.
#
# Contents:
#   $string = hashFix($string); or
#   @string = hashFix(@string);
#
#   $string = scrunch($string); or
#   @string = scrunch(@string);
#
#   $string = trim($string);    or
#   @string = trim(@string);
#
#   $string = xmlFix($string);  or
#   @string = xmlFix(@string);
#

package Nettools::misc::myString;

use strict;
use warnings;

use 5.6.1;
use vars qw( @ISA @EXPORT );
use Exporter;
@ISA    = qw( Exporter );
@EXPORT = qw(
    hashFix
    scrunch
    trim
    xmlFix
);

my $VERSION = '20080930-1';

#
# sub: hashFix
# sdescr: Removes/replaces characters that cause problems in my hash files
#
sub hashFix {
    my @out = @_;

    for (@out) {
        s/\,/\\,/g;    # Escape ,
        s/\%/\\%/g;    # Escape %
        s/\;/\\;/g;    # Escape ;
        s/\'/\\'/g;    # Escape '
    }    # for

    return (@out == 1)
        ? $out[0]    # only one to return
        : @out;      # or many
}    # hashFix

#
# sub: scrunch
# sdescr: Trim all excess whitespace from a string or a list of strings.
#
sub scrunch {
    my @out = @_;

    for (@out) {
        s/^\s+//;     # trim left
        s/\s+$//;     # trim right
        s/\s+/ /g;    # scrunch remaining
    }    # for

    return (@out == 1)
        ? $out[0]    # only one to return
        : @out;      # or many
}    # scrunch

#
# sub: trim
# sdescr: Trim whitespace from the beginning and end of a string or a list of strings. See Perl Cookbook, page 43.
#
sub trim {
    my @out = @_;

    for (@out) {
        s/^\s+//;    # trim left
        s/\s+$//;    # trim right
    }    # for

    return (@out == 1)
        ? $out[0]    # only one to return
        : @out;      # or many
}    # trim

#
# sub: xmlFix
# sdescr: Replaces XML meta-characters with entity references.
#
sub xmlFix {
    my @out = @_;

    for (@out) {
        s/&/&amp\;/g;     # Replace &
        s/</&lt\;/g;      # Replace <
        s/>/&gt\;/g;      # Replace >
        s/"/&quot\;/g;    # Replace "
        s/'/&apos\;/g;    # Replace '
    }    # for

    return (@out == 1)
        ? $out[0]    # only one to return
        : @out;      # or many
}    # xmlFix

return 1;

__END__
