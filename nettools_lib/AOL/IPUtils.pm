############################################################################
# $Id$
#
# $Revision$
############################################################################

package AOL::IPUtils;

use strict;
use warnings;
use Net::IP qw(:PROC);

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw( valid_ip
                     valid_mask
                     valid_subnet
                     get_numeric_ip
                     get_dotted_decimal
                     get_cidr_mask
                     get_network_range
                     get_subnet_components
                     normalize_subnet
                     get_mask_bits
                     is_rfc1918
                     ip_in_subnet
                   );

sub valid_ip {
  my ($ip) = @_;

  return 0 unless defined($ip);

  my $net_ip = Net::IP->new($ip) or
    return 0;

  my $ipversion = $net_ip->version() or return 0;
  return 0 if ($net_ip->prefixlen() != ip_iplengths($ipversion));

  return 1;
}


sub valid_mask {
  my ($mask, $ip_ver) = @_;

  return 0 unless (defined($mask));
  $ip_ver = 4 unless ($ip_ver);

  $mask =~ s/^\s+//;
  $mask =~ s/\s+$//;

  return 0 unless ($mask =~ /^\d+$/);

  my $ip = "0.0.0.0/$mask";
  $ip = "::/$mask" if ($ip_ver eq '6');

  my $net_ip = Net::IP->new($ip) or
    return 0;

# @@ how about a non-cidr mask?

  return 1;
}


sub valid_subnet {
  my ($ip) = @_;

  return 0 unless defined($ip);
  return 0 unless ($ip =~ /\/\d+$/);

  $ip = normalize_subnet($ip);

  my $net_ip = Net::IP->new($ip) or 
    return 0;

  return 1;
}


sub get_numeric_ip {
  my ($ip) = @_;

  return undef unless (defined($ip));

  my $net_ip = Net::IP->new($ip) or
    return undef;

  return $net_ip->intip();
}


sub get_dotted_decimal {
  my ($numeric_ip) = @_;

  return undef unless (defined($numeric_ip));

  $numeric_ip =~ s/^\s+//;
  $numeric_ip =~ s/\s+$//;

  return undef unless ($numeric_ip =~ /^\d+$/);

  if ($numeric_ip < 2**32) {
    return join('.', unpack("C4", pack("N", $numeric_ip)));
  }

  # @@@ what do we want to return for v6?
  # @@@ how do we know if an IP that is less
  # @@@ than 2**32 is v4 or v6?
  return undef;
}


sub get_cidr_mask {
  my ($mask) = @_;

  return undef unless (defined($mask));

  $mask =~ s/^\s+//;
  $mask =~ s/\s+$//;

  my $net_ip = Net::IP->new($mask) or
    return undef;

  my $binip = $net_ip->binip() or return undef;
  my $ipversion = $net_ip->version() or return undef;

  return undef if ($net_ip->prefixlen() != ip_iplengths($ipversion));

  my $cidr = undef;
  for (my $i = 0; $i < ip_iplengths($ipversion); $i++) {
    if (defined($cidr)) {
      return undef if (substr($binip, $i, 1) ne '0');
    }
    else {  
      if (substr($binip, $i, 1) eq '0') {
        $cidr = $i;
      }
    }
  }

  return $cidr;
}


sub get_network_range {
  my ($ip, $mask) = @_;

  return (undef, undef) unless (defined($ip) && defined($mask));

  my $subnet = normalize_subnet("$ip/$mask");

  my $net_ip = Net::IP->new($subnet) or
    return (undef, undef);

  my $min_ip = $net_ip->intip();
  my $max_ip = $net_ip->last_int();

  return ($min_ip, $max_ip);
}


sub get_subnet_components {
  my ($subnet) = @_;

  return (undef, undef) unless (defined($subnet));

  $subnet =~ s/^\s+//;
  $subnet =~ s/\s+$//;

  if ($subnet =~ /^([^\/]+)\/(\d+)$/) {
    return ($1, $2);
  }

  return (undef, undef);
}


sub normalize_subnet {
  my ($network) = @_;

  if ($network =~ /^(\S+?)(\/\S+)$/) {
    my $ip = $1;
    my $mask = $2;

    my $ipversion = ip_get_version($ip);
    return $network unless ($ipversion);

    my $cur_bin = ip_iptobin($ip, $ipversion);
    return $network unless ($cur_bin);

    my $one = '0' x (ip_iplengths($ipversion) - 1) . '1';

    my $clen;
    if ($mask =~ /^\/(\d+)$/) {
      $clen = $1;

      unless (ip_check_prefix($cur_bin, $clen, $ipversion)) {
        my $err = Net::IP::Error();
        if ($err =~ /^Invalid prefix/) {
          $cur_bin = substr($cur_bin, 0, $clen) .
            '0' x (ip_iplengths($ipversion) - $clen);
          $ip = ip_bintoip($cur_bin, $ipversion);
        }
        else {
          last;
        }
      }
    }

    $network = "$ip/" . $clen;
  }

  return $network;
}


sub get_mask_bits {
  my ($mask, $ip_ver) = @_;

  $ip_ver = 4 unless ($ip_ver);

  return undef unless ($mask =~ /^\d+$/);
  return undef unless ($ip_ver eq '4' || $ip_ver eq '6');

  my $ip = "0.0.0.0/$mask";
  $ip = "::/$mask" if ($ip_ver eq '6');

  my $net_ip = Net::IP->new($ip) or
    return undef;

  if ($ip_ver eq '4') {
    return 2**32 - 2**(32 - $mask);
  }

  use bigint;
  return 2**128 - 2**(128 - $mask);
}


sub is_rfc1918 {
  my ($subnet) = @_;

  $subnet = normalize_subnet($subnet);
  my $net_ip = Net::IP->new($subnet) or return 0;

  return ($net_ip->iptype() eq 'PRIVATE') ? 1 : 0;
}


sub ip_in_subnet {
  my ($ip, $subnet) = @_;

  my $net_subnet = Net::IP->new($subnet) or
    return undef;
  my $net_ip = Net::IP->new($ip) or
    return undef;

  my $overlap = $net_ip->overlaps($net_subnet);
  if ($overlap == $IP_A_IN_B_OVERLAP || $overlap == $IP_IDENTICAL) {
    return 1;
  }

  return 0;
}


1;

