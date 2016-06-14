#~/usr/bin/perl
# $Id: myDate.pm 20229 2009-06-01 20:53:52Z swolfe $
# tags: lib
#
# descr: Subroutines for working with dates/times.
#
# Contents:
#     $epoch_day    = epoToday();
#     $display_time = epoToDisp($epoch_time);
#     $ndipdb_time  = epoToNDIPDB($epoch_time);
#     $ndipdb_time  = ndipDBdate();
#     $display_time = netDBdate();
#     $display_time = now();
#

package Nettools::misc::myDate;

use strict;
use warnings;
use 5.6.1;
use vars qw( @ISA @EXPORT );
require Exporter;
@ISA    = qw( Exporter );
@EXPORT = qw(
    epoToday
    epoToDisp
    epoToNDIPDB
    ndipDBdate
    netDBdate
    now
);

use Time::Local;

my $DEBUG   = 0;
my $CSPATH  = qw( /data/commandscheduler/results );
my $RESULTS = qw( netops_engineering_daily.done );

#
# sub: epoToday
# sdescr: Returns today's epoch date.
#
sub epoToday {

    print STDERR "$0::epoToday()\n" if ($DEBUG);

    return int(time() / 86400);    # Convert epoch time in seconds to days

}    # epoToday

#
# sub: epoToDisp
# sdescr: Converts epoch time to a displayable format.
#
sub epoToDisp {

    my $epo = shift;

    my @DAYS = ('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
    my @MONTHS = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

    print STDERR "$0::epoToDisp($epo)\n" if ($DEBUG);

    my ($lsec, $lmin, $lhour, $lday, $imon, $year, $iwday, $yday, $dst) = localtime($epo);
    my $hour = $lhour < 10 ? '0' . $lhour : $lhour;
    my $mday = $lday  < 10  ? '0' . $lday  : $lday;
    my $min  = $lmin  < 10  ? '0' . $lmin  : $lmin;
    my $mon  = $MONTHS[$imon];
    my $sec  = $lsec  < 10  ? '0' . $lsec  : $lsec;
    my $wday = $DAYS[$iwday];
    $year += 1900;

    return $wday . ' ' . $mon . ' ' . $mday . ' ' . $hour . ':' . $min . ':' . $sec . ' ' . $year;

}    # epoToDisp

#
# sub: epoToNDIPDB
# sdescr: Converts epoch time to NDIPDB format (mm/dd/yy hh:mm:ss:ms).
#
sub epoToNDIPDB {

    my $epo = shift;

    print STDERR "$0::epoToNDIPDB($epo)\n" if ($DEBUG);

    my ($lsec, $lmin, $lhour, $lmday, $lmon, $lyear, $lwday, $lyday, $lisdst) = localtime($epo);
    my $sec  = $lsec  < 10  ? '0' . $lsec  : $lsec;
    my $min  = $lmin  < 10  ? '0' . $lmin  : $lmin;
    my $hour = $lhour < 10 ? '0' . $lhour : $lhour;
    my $day  = $lmday < 10 ? '0' . $lmday : $lmday;
    my $mon  = $lmon  < 10 ? '0' . ($lmon + 1) : $lmon + 1;
    my $year = $lyear + 1900;

    return $mon . '/' . $day . '/' . $year . ' ' . $hour . ':' . $min . ':' . $sec . ':00';

}    # epoToNDIPDB

#
# sub: ndipDBdate
# sdescr: Returns date/time of latest commandscheduler run in ndipdb format
#
sub ndipDBdate {

    my $date;

    print STDERR "$0::ndipDBdate()\n" if ($DEBUG);

    if (my $mtime = (stat($CSPATH . '/' . $RESULTS))[9]) {
        $date = epoToNDIPDB($mtime);
    }
    else {
        $date = `date`;
    }    # if

    chomp($date);

    return $date;

}    # ndipDBdate

#
# sub: netDBdate
# sdescr: Returns date/time of latest commandscheduler run in displayable format
#
sub netDBdate {

    my $date;

    print STDERR "$0::netDBdate()\n" if ($DEBUG);

    if (my $mtime = (stat($CSPATH . '/' . $RESULTS))[9]) {
        $date = epoToDisp($mtime);
    }
    else {
        $date = `date`;
    }    # if

    chomp($date);

    return $date;

}    # netDBdate

#
# sub: now
# sdescr: Returns current date/time in displayable format
#
sub now {
    return localtime;
}    # now

return 1;

__END__
