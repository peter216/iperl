#!/usr/bin/perl
# $Id: ndipdb.pm 27263 2011-04-01 19:31:27Z swolfe $
# tags: lib
#
# descr: Subroutines for accessing the Network Data Integrity Portal DB
#
# contents:
#
#   @agents     = allAgents();
#   @errorTypes = allErrorTypes();
#                 Nettools::NDIP::ndipdb::connect();
#                 Nettools::NDIP::ndipdb::disconnect();
#                 sendError($device,$errorType,$errorMsg);
#                 sendErrorUnique($device,$errorType,$errorMsg,$errorKey,$agent);
#                 sendSuccess($device,$errorType,$errorMsg);
#   @errors     = myErrors();
#   @hosts      = myHosts();
#   @successes  = mySuccesses();
#

package Nettools::NDIP::ndipdb;

use strict;
use warnings;
use 5.6.1;
use vars qw( @ISA @EXPORT );
require Exporter;
@ISA    = qw( Exporter );
@EXPORT = qw(
    allAgents
    allErrorTypes
    connect
    disconnect
    sendError
    sendErrorUnique
    sendSuccess
    myErrors
    myHosts
    mySuccesses
);

use DBI;
use Nettools::misc::myDate qw( now );

#
# Constants
#
my $AGT_HOST  = 'nettoolsjump.ops.aol.com';
my $AGT_NAME  = 'NetDevCfgChk';
my $DB_DRIVER = 'Sybase';
my $DB_NAME   = 'NDIPDB';
my $DB_SERVER = 'PROD01_35M_SYB';
my $DB_USER   = 'ndipuser';
my $DB_PASS   = 'ndipuser';
my $DEBUG     = 0;

BEGIN {
    $ENV{'SYBASE'} = '/opt/bcs/packages/openclient12';
}

#
# sub: main
#
my $dbh;    # Database handle object

#
# Quote agent host and name.
#
Nettools::NDIP::ndipdb::connect();
$AGT_HOST = $dbh->quote($AGT_HOST);
$AGT_NAME = $dbh->quote($AGT_NAME);
Nettools::NDIP::ndipdb::disconnect();

#
# sub: allAgents
# sdescr: connects, sends show_all_agents, and disconnects
#
sub allAgents {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::allAgents $now\n";
    }    # if

    Nettools::NDIP::ndipdb::connect();
    my @agents = ndipdb::_show_all_agents();
    Nettools::NDIP::ndipdb::disconnect();

    return @agents;

}    # allAgents

#
# sub: allErrorTypes
# sdescr: connects, sends show_error_category_error_type, and disconnects
#
sub allErrorTypes {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::allErrorTypes $now\n";
    }    # if

    Nettools::NDIP::ndipdb::connect();
    my @errorTypes = ndipdb::_show_error_category_error_type();
    Nettools::NDIP::ndipdb::disconnect();

    return @errorTypes;

}    # allErrorTypes

#
# sub: connect
# sdescr: connects to ndipdb
#
sub connect {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::connect $now\n";
        print STDERR "    DB_SERVER $DB_SERVER DB_NAME $DB_NAME\n";
    }    # if

    $dbh = DBI->connect("dbi:$DB_DRIVER:server=$DB_SERVER;database=$DB_NAME", $DB_USER, $DB_PASS, { RaiseError => 0, AutoCommit => 1 })
        or die "Unable to connect to database '$DB_NAME'\n";

    print STDERR "    Connect successful\n" if ($DEBUG);

    return 1;

}    # connect

#
# sub: disconnect
# sdescr: disconnects from ndipdb
#
sub disconnect {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::disconnect $now\n";
        print STDERR "    $DB_NAME\n";
    }    # if

    $dbh->disconnect()
        or die $dbh::errstr;

    print STDERR "    Disconnect successful\n" if ($DEBUG);

    return 1;

}    # disconnect

#
# sub: myErrors
# sdescr: connects, sends find_my_unsuccess_test, and disconnects
#
sub myErrors {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::myErrors $now\n";
    }    # if

    Nettools::NDIP::ndipdb::connect();
    my @errors = _find_my_unsuccess_test();
    Nettools::NDIP::ndipdb::disconnect();

    return @errors;

}    # myErrors

#
# sub: myHosts
# sdescr: connects, sends find_my_hosts, and disconnects
#
sub myHosts {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::myHosts $now\n";
    }    # if

    Nettools::NDIP::ndipdb::connect();
    my @hosts = _find_my_hosts();
    Nettools::NDIP::ndipdb::disconnect();

    return @hosts;

}    # myHosts

#
# sub: mySuccesses
# sdescr: connects, sends find_my_success_test, and disconnects
#
sub mySuccesses {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::mySuccesses $now\n";
    }    # if

    Nettools::NDIP::ndipdb::connect();
    my @successes = _find_my_success_test();
    Nettools::NDIP::ndipdb::disconnect();

    return @successes;

}    # mySuccesses

#
# sub: sendError
# sdescr: connects, sends an error message, and disconnects
#
sub sendError {

    my ($device, $errorType, $errorMsg) = @_;

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::sendError $now\n";
        print STDERR "    $device: $errorType, $errorMsg\n";
    }    # if

    Nettools::NDIP::ndipdb::connect();
    my $result = _send_fail_test($device, $errorType, $errorMsg);
    Nettools::NDIP::ndipdb::disconnect();

    return $result;

}    # sendError

#
# sub: sendErrorUnique
# sdescr: sends an error message
#
sub sendErrorUnique {

    my ($device, $errorType, $errorMsg, $errorKey, $agent) = @_;

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::sendError $now\n";
        print STDERR "    $device: $errorType, $errorMsg\n";
    }    # if

    my $result = _send_fail_test_unique($device, $errorType, $errorMsg, $errorKey, $agent);

    return $result;

}    # sendErrorUnique

#
# sub: sendSuccess
# sdescr: connects, sends a success message, and disconnects
#
sub sendSuccess {

    my ($device, $successType, $successMsg) = @_;

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::sendSuccess $now\n";
        print STDERR "    $device: $successType, $successMsg\n";
    }    # if

    Nettools::NDIP::ndipdb::connect();
    my $result = _send_success_test($device, $successType, $successMsg);
    Nettools::NDIP::ndipdb::disconnect();

    return $result;

}    # sendSuccess

#
# sub: _find_my_hosts
# sdescr: sends a request to ndipdb to return my defined hosts
#
sub _find_my_hosts {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::_find_my_hosts $now\n";
    }    # if

    my $hosts = $dbh->selectall_arrayref("find_my_hosts $AGT_NAME")
        or do {
        warn $dbh->errstr;
        return undef;
        };    # do

    return @$hosts;

}    # _find_my_hosts

#
# sub: _find_my_success_test
# sdescr: sends a request to ndipdb to return my successful tests
#
sub _find_my_success_test {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::_find_my_success_test $now\n";
    }    # if

    my $errors = $dbh->selectall_arrayref("find_my_success_test $AGT_NAME")
        or do {
        warn $dbh->errstr;
        return undef;
        };    # do

    return @$errors;

}    # _find_my_success_test

#
# sub: _find_my_unsuccess_test
# sdescr: sends a request to ndipdb to return my unsuccessful tests
#
sub _find_my_unsuccess_test {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::_find_my_unsuccess_type $now\n";
    }    # if

    my $errors = $dbh->selectall_arrayref("find_my_unsuccess_test $AGT_NAME")
        or do {
        warn $dbh->errstr;
        return undef;
        };    # do

    return @$errors;

}    # _find_my_unsuccess_test

#
# sub: _send_fail_test
# sdescr: sends a new error message to ndipdb
#
sub _send_fail_test {

    my ($device, $errorType, $errorMsg) = @_;

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::_send_fail_test $now\n";
    }    # if

    my $date = Nettools::misc::myDate::ndipDBdate();
    $date      = $dbh->quote($date);
    $device    = $dbh->quote($device);
    $errorType = $dbh->quote($errorType);
    $errorMsg  = $dbh->quote($errorMsg);

    my $param = join ',', $device, $errorType, $errorMsg, $AGT_HOST, $date, $AGT_NAME;

    print STDERR "dbh->do send_fail_test $param\n" if ($DEBUG);

    my $result = $dbh->do("send_fail_test $param")
        or do {
        warn $dbh->errstr;
        return undef;
        };    # do

    print STDERR "    Execution successful\n" if ($DEBUG);

    return 1;

}    # _send_fail_test

#
# sub: _send_fail_test_unique
# sdescr: sends a new error message to ndipdb
#
sub _send_fail_test_unique {

    my ($device, $errorType, $errorMsg, $errorKey, $agent) = @_;

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::_send_fail_test_unique $now\n";
    }    # if

    $device    = $dbh->quote($device);
    $errorType = $dbh->quote($errorType);
    $errorMsg  = $dbh->quote($errorMsg);
    $errorKey  = $dbh->quote($errorKey);
    $agent     = $dbh->quote($agent);

    my $date = Nettools::misc::myDate::ndipDBdate();
    $date = $dbh->quote($date);

    my $param = join ',', $device, $errorType, $errorMsg, $AGT_HOST, $date, $agent, $errorKey;

    print STDERR "dbh->do send_fail_test $param\n" if ($DEBUG);

    my $result = $dbh->do("send_fail_test_uniq $param")
        or do {
        warn $dbh->errstr;
        return undef;
        };    # do

    print STDERR "    Execution successful\n" if ($DEBUG);

    return 1;

}    # _send_fail_test_unique

#
# sub: _send_success_test
# sdescr: sends a new success message to ndipdb
#
sub _send_success_test {

    my ($device, $successType, $successMsg) = @_;

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::_send_success_test $now\n";
    }    # if

    my $date = Nettools::misc::myDate::ndipDBdate();
    $date        = $dbh->quote($date);
    $device      = $dbh->quote($device);
    $successType = $dbh->quote($successType);
    $successMsg  = $dbh->quote($successMsg);

    my $param = join ',', $device, $successType, $successMsg, $AGT_HOST, $date, $AGT_NAME;

    print STDERR "dbh->do send_success_test $param\n" if ($DEBUG);

    my $result = $dbh->do("send_success_test $param")
        or do {
        warn $dbh->errstr;
        return undef;
        };    # do

    print STDERR "    Execution successful\n" if ($DEBUG);

    return 1;

}    # _send_success_test

#
# sub: _show_all_agents
# sdescr: sends a request to ndipdb to return all defined agents
#
sub _show_all_agents {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::_show_all_agents $now\n";
    }    # if

    my $agents = $dbh->selectall_arrayref("show_all_agents")
        or do {
        warn $dbh->errstr;
        return undef;
        };    # do

    return @$agents;

}    # _show_all_agents

#
# sub: _show_error_category_error_type
# sdescr: sends a request to ndipdb to return all defined error types
#
sub _show_error_category_error_type {

    if ($DEBUG) {
        my $now = Nettools::misc::myDate::now();
        print STDERR "$0::_show_error_category_error_type $now\n";
    }    # if

    my $errorTypes = $dbh->selectall_arrayref("show_error_category_error_type")
        or do {
        warn $dbh->errstr;
        return undef;
        };    # do

    return @$errorTypes;

}    # _show_error_category_error_type

return 1;

__END__
