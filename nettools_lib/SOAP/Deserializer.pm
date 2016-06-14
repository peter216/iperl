

package Nettools::SOAP::Deserializer;

use vars qw( @EXPORT_OK );
use XML::Parser;
use Exporter;
 
@ISA = qw( Exporter );
@EXPORT_OK = qw( parseSoapData );


# params:
# debug => send debug messages to filehandle
# xml =>  soap xml data
# key => SOAP data value to use as a key (optional).  if null is passed,
#           (e.g.  key => ""), a numeric key will be used.
# type =>  vector or complex, default is determined by type defined in soap message
# start_element => element to start parsing on (default is result)
# returns hash

sub parseSoapData {

	my $debug;
	my $element;
	my $element_value;
	my $key;
	my $store_key;
	my $p;
	my %return;
	my @return;
	my $store_data;
	my $type;
	my %temp_hash;

	# get args and split out
	my $param = { @_ };

	# set debug flag
	if ($param->{debug}){  
		$debug = $param->{debug};
		print $debug "Nettools::SOAP::Deserializer:  params passed: \n";
		foreach $key ( sort keys %{$param} ){
			if ($key ne "xml"){
				print $debug "\t $key   $param->{$key}\n";
			} else {
				print $debug "\t xml data passed: \n";
				print $debug "$param->{xml}\n";
			}
		}
	}

	# die if no xml data was passed
	die "Error: no xml data passed to Nettools::SOAP::Deserializer"	if (! $param->{xml});

	# determine what type of data was returned.  If its a vector, store in an array, otherwise
	# store in a hash
	if (! $param->{type} ){
		if ( $param->{xml} =~ /xsi:type=\"\S+:vector\"/i ){
			$type = "vector";
		} else {
			$type = "complex";
		}
	} else {
		$type = $param->{type};
	}	
		

	# determine start element, default to 'result'
	$param->{start_element} = "return" if (! $param->{start_element});

	# determine if we should sort data by key
	if (exists ($param->{key})){  
		if ($param->{key}){
			$store_key = $param->{key}; 
		} else {
			$store_numeric_key = 1;
			$num_key = 0;
		}
	}

	# create XML parser
	my $parser = new XML::Parser(ErrorContext => 2);

	# set up handlers for sax callbacks

	$parser->setHandlers( Char => sub {     if ($store_data){ 
							($p, $element_value) = (@_);
                                                	if ($element_value =~ /\S/){
								
								if ($type eq "complex"){
									if ($store_key){
										$temp_hash{$key} = $element_value;
									} elsif ($store_numeric_key){
										$return{$num_key}->{$key} = $element_value;
									} else {
                                                                		$return{$key} = $element_value 
									}
								} else {
									push (@return, $element_value);
								}
                                                        }
                                                }
                                          },
 
                              Start => sub {    ($p, $element) = (@_);
                                                if ($element eq $param->{start_element}){
                                                        $store_data = 1;
                                                } elsif ($store_data){
							$key = $element;
                                                }
 
 
                                           },
 
                              End => sub {      ($p, $element) = (@_);
			      			if ($element eq "return" || $element eq "item"){
			      				if ($store_data){ 
								if ($store_key){
									if ($temp_hash{$store_key}){
										$store_key_value = $temp_hash{$store_key};
										delete $temp_hash{$store_key};
										%{$return{ $store_key_value }}  = %temp_hash;	
										%temp_hash = ();
									}
								} elsif ($store_numeric_key){
									$num_key++;
								}
							}
						}
                                                if ($element eq $param->{start_element}){
                                                        $store_data = 0;
                                                }
                                         }
 
                            );

	$parser->parse( $param->{xml} );

	print $debug "Nettools::SOAP::Deserializer:  data returned by parseData:\n" if $debug;

	if ($type eq "complex"){

		if ($debug){
			foreach $key (sort keys %return){
				print $debug "\t$key\t\t$return{$key}\n";
			}

		}
		return %return;
	} else {

		if ($debug){
			foreach $key (sort @return){
				print $debug "\t$key\n";
			}
		}
		return %return;
	}

}


