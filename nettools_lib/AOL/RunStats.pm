package AOL::RunStats;
############################################################################
# $Id: RunStats.pm 26418 2010-11-01 15:32:50Z pstephan $
#
# $Revision: 26418 $
############################################################################

use strict;
use warnings;
use English;
use Cwd;

our $US_logfile = '';
my $US_start_time;
my $US_args;

BEGIN {
  $US_start_time = time();
  if (scalar(@ARGV)) {
    $US_args = join(' ', @ARGV);
  }
  else {
    $US_args = '';
  }
}

END {
  my $US_end_time = time();

  my %LOGFILE = (
    'ops4-m.itsec.aol.com'   => '/data/nettools/logs/tool_usage.log',
    'ops4-d.office.aol.com'  => '/data/nettools/logs/tool_usage.log',
    'ops4-n.office.aol.com'  => '/data/nettools/logs/tool_usage.log',
    'ops4-frr.itsec.aol.com' => '/data/nettools/logs/tool_usage.log',
    'DEFAULT'                => '/data/nettools/logs/tool_usage.log',
  );

  unless ($US_logfile) {
    my $hostname = `/bin/hostname`;
    chomp($hostname);

    $US_logfile = $LOGFILE{$hostname} || $LOGFILE{DEFAULT};
  }

  my ($US_prog_name) = $0 =~ /([^\/]*)$/;
  my $US_prog_path = $0;
  $US_prog_path =~ s/$US_prog_name$//;
  $US_prog_name .= " " . $US_args if ($US_args);

  my $US_cwd = cwd() || '<unk>';

  my $US_user = getlogin() || (getpwuid($UID))[0] || $UID || $ENV{USER} ||
                `whoami`;
  my $US_euser = (getpwuid($EUID))[0] || $EUID;

  my ($US_s, $US_m, $US_h, $US_d, $US_mo, $US_y) = localtime($US_end_time);
  my $US_date = sprintf("%04d%02d%02d %02d:%02d:%02d",
                     $US_y + 1900, $US_mo + 1, $US_d, $US_h, $US_m, $US_s);

  my $US_elapsed = $US_end_time - $US_start_time;

  open(US_STATSLOG, ">> $US_logfile") or return;

# Format is:
# <dt> <tm> '<prog> <args>' <path> <cwd> <r_usr> <e_usr> <elapsed>s <exit>
  printf US_STATSLOG "%s '%s' %s %s %s %s %ss %d\n",
                     $US_date, $US_prog_name, $US_prog_path, $US_cwd,
                     $US_user, $US_euser, $US_elapsed, ($? & 255);
  close(US_STATSLOG);
  chmod(0666, $US_logfile);
}

1;

__END__

=head1 NAME

AOL::RunStats - Logs some basic information about tools that are run

=head1 SYNOPSIS

This package uses a BEGIN and an END block to collect and log
some basic information about run frequency of various tools.

It is intended to be used to help determine how various tools are run,
by whom they are run, the average execution time, and the exit status.

=head1 DESCRIPTION

When this package is used in a script a line will be added to a common
log file when the script finishes.  The line will indicate the run time,
name, options, execution time, and exit status of the given script.

This is done with a BEGIN block that records the start time of the
script and an END block that calculates the elapsed time and logs
the message.

The standard log file that this script uses is contained in the 
$US_logfile variable.  Any script that wants to log to a different
log file can change that variable 

  $AOL::RunStats::US_logfile = "<new logfile>";

=cut

