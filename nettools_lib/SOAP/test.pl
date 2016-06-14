#!/usr/bin/perl


use lib("/opstools/toolsdev/lib");

use Nettools::SOAP::Deserializer qw( parseSoapData );
use SOAP::Lite;

$result = SOAP::Lite
	  ->service('http://wrap-d.netops.aol.com:8000/wsdl/AssetWrap.wsdl')
	  ->outputxml(1)
	  #->getAssetInfoByBarcode("001025263");
	  ->getAssetsByName("ops2");

print "$result\n";

%result = parseSoapData( key => "", 
 		         xml => $result);

foreach $item (keys %result){
	#	print "$item    $result{$item}\n";
	print "key:  $item\n";
	foreach $item2 (keys %{$result{$item}}){
		print "\t$item2   $result{$item}->{$item2}\n";
	}
}



