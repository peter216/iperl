package Nettools::DeviceDirectory;
our $VERSION = '0.01';
use strict;
use warnings;

#Xpath libraries needed for xpath query.
use XML::LibXML::XPathContext;
use XML::LibXML;
use Socket;
use Data::Dumper;
$| = 1;

#xml document xpath queries.
our $xmlfile_default = "/data/nettools/netdevices.xml";

#########################################################
# Description: Constructor which creates a new
# DeviceDirectory Object
# Argument: A reference to this object
# Returns: a pointer to an instance of DeviceDirectory
#########################################################

sub new {
    my $class = shift;
    my $path  = shift;
    my $this  = {};
    bless $this, $class;
    $this->{path} = $path;
    return $this;
}

#########################################################################
# Method:get_asset_by_criteria($criteria)
# Parameter: String specifying the critera which xpath expression
# will be determined on.
# Description: Returns a hash with the information specifified
# by the criteria.
#########################################################################

sub getAssetByCriteria {
    my $self     = shift;
    my $criteria = shift;
    my $xmlfile  = $self->{path} || $xmlfile_default;
    my $key;
    my $value;
    my @kvpair;
    my $xpath      = "";
    my $i          = 0;
    my %hash       = ();
    my %final_hash = ();

    my @fields = ();
    if ($criteria) {
        @fields = split /\"\s*,\s*/, $criteria;
    }

    #Start building the Xpath String
    foreach my $x (@fields) {
        my @extra_values = ();
        @kvpair = split /\s*=\s*\"/, $x;
        $key    = $kvpair[0];
        $value  = $kvpair[1];

        # if last value chop off last quote.
        my $size = scalar(@fields - 1);
        if ($i == $size) {
            chop($value);
        }
        push(@{ $hash{$key} }, $value);
        $i++;
    }
    foreach $key (keys %hash) {
        if ($xpath ne "") {
            $xpath = $xpath . " and ";
        }
        my $k = 0;
        foreach $value (@{ $hash{$key} }) {
            if ($k == 0) {
                $xpath = $xpath . $key . "=\"" . $value . "\"";
            }
            else {
                $xpath = $xpath . " or " . $key . "=\"" . $value . "\"";
            }
            $k++;
        }
    }
#########################################################
    # Setup object references for Xpath
    # Return: A hash of the resulting Xpath query
#########################################################

    my $parser = XML::LibXML->new();
    my $tree   = $parser->parse_file($xmlfile);
    my $root   = $tree->getDocumentElement;

    #if xpath is null return every node that is not null.
    if ($xpath eq "") {
        $xpath = "string-length(nodeName) > 0";
    }

    #   	print "Xpath is : $xpath \n";
    $xpath = "/NetDevices/device[" . $xpath . "]";
    my @devices = $root->findnodes("$xpath");
    my $count   = 0;
    foreach my $device (@devices) {
        $count++;
        foreach my $child (@{ $device->childNodes }) {
            $final_hash{$count}{ $child->nodeName } = $child->textContent;
        }

    }
    return %final_hash;
}

#return the required true value from package.
1;

__END__

=pod

=head1 NAME

Nettools::DeviceDirectory - Queries netdevices.xml 

=head1 SYNOPSIS

  use Nettools::DeviceDirectory;
  $device = Nettools::DeviceDirectory->new();
  or
  $device Nettools::DeviceDirectory->new(<path_to_netdevices.xml>>);
   
  %hash = $device->getAssetByCriteria("deviceType=\"SWITCH\", manufacturer=\"FOUNDRY\"");

=head1 DESCRIPTION
    
  This module is an interface to netdevices.xml using Xpath to 
  provide access to each individual node in the xml document. If
  no path_to_netdevices.xml is specified it will use the default
  path "/home/netadm/opst/netdevices.xml"
  
  The criteria specified will return a hash containing each
  individual node that matched the criteria specified.

=head1 OPTIONS

  $device->getAssetByCriteria();
      Will return every node in the xml document.

  $device->getAssetByCriteria(<criteria>);
      Will return every node that matches the criteria in
      the xml document.
      
      Where criteria is based on the following nodeformat:
        
      <device nodeName="aan-akrn-sw0.conc.aol.com">
       <assetID>90000048285</assetID>
       <authMethod>tacacs</authMethod>
       <barcode>001044203</barcode>
       <budgetCode>22305-003</budgetCode>
       <budgetName>NETWORK, PARTNERS (IP)</budgetName>
       <coordinate>NONE</coordinate>
       <deviceType>SWITCH</deviceType>
       <enablePW>precipit8d</enablePW>
       <lastUpdate>2003-12-17 10:55:04.0</lastUpdate>
       <loginPW></loginPW>
       <make>FASTIRON WORKGROUP</make>
       <manufacturer>FOUNDRY</manufacturer>
       <model>FWS24</model>
       <nodeName>aan-akrn-sw0.conc.aol.com</nodeName>
       <operationStatus>MONITORED</operationStatus>
       <owner>451 - NETWORK ENGINEERING</owner>
       <room>NONE</room>
       <serialNumber>F00070463</serialNumber>
       <site>AKRN</site>
      </device>

=head1 SEE ALSO
    XML::LibXML, XML::LibXML::XPathContext;

=head1 AUTHOR

Robert Ljungqvist <lt>ljungkan@aol.net<gt>

=cut
