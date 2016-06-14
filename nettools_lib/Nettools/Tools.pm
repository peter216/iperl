###################################################################################################3
# Package:  Nettools::Tools
# Description:  Various methods commonly used in scripts.
#
#
# Notes:
#	1.  Please list your method in the available methods section
#	2.  Please note any changes you make in the changes section
#	3.  Please make sure your code works with use strict
#
#
# available methods:
#
#  METHOD		AUTHOR		DESCRIPTION
#
#  factor		DJS		computes factors of a number
#  formatDate		DJS		use localtime and strftime to format date
#  gcd			DJS		compute greatest common denominator of values	
#  listFiles		DJS		list files in a specified directory
#  lookup		DJS		getHostbyAddr or getHostbyName interface
#  new			DJS		object initializer
#
#
# changes:
# 6 Mar 00	DJS		created package
#				added gcd
#
# 10 Mar 00	DJS		added lookup
#				
#  4 Apr 00	DJS		added factor
#
# 11 Apr 00	DJS		added passing of comma delimated string to gcd method
#
# 17 May 00	DJS		added formatDate
#				added listFiles	
# 22 May 00     AJK             added plot method
# 24 May 00     AJK             modified plot to include some new features.
# 07 Jun 00     AJK             added local/gmt parameter to plot subroutine
#

package Nettools::Tools;
use POSIX;
use Socket;


###################################################################################################3
# method:  factor
# description:  computes factors of a number
#
# params:
#	scalar containing value 
#
# return:
#	sorted array containing factors
#
# example:
# 	@factors = $obj->factor(10);
#

sub factor{

	my $self = shift;
	my $value = shift;
	my @return;
	my $stop;
	my $other;

	# figure out middle of of value and work back
	if ($value % 2){
		$working = int($value / 2) + 1;
	} else {
		$working = $value / 2;
	}
	
	push(@return, $value);
	while ($working){
		if (! ($value % $working)){	
			push(@return, $working);
		}
		$working--;
	}

	@return = sort{ $a <=> $b }(@return);

	return @return;
}
			
###################################################################################################3
# method: formatDate
# description:  returns date in specified format.  uses strftime and localtime
#
#	available formats
#	
#		Name			format
#		extended_file		YYYYMMDDHHMM
#		file			YYYYMMDD	
#		log			YYYYMMDD HH:MM
#		standard		MM/DD/YYYY HH:MM
#		
# example:
# 	get date in standard format
#		$date = $obj->formatDate("standard");
#

sub formatDate{

	my $self = shift;
	my $format = shift;

	my $sec;
	my $min;
	my $hour;
	my $mday;
	my $mon;
	my $year;
	my $wday;
	my $isdst;
	my $return_date;


	if ($format){
		($sec,$min,$hour,$mday,$mon,$year,$wday,$isdst) = localtime(time);
		if ($format eq "standard"){
			$return_date = strftime("%m/%d/%Y %H:%M",$sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);
		} elsif ($format eq "file"){
			$return_date = strftime("%Y%m%d",$sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);
		} elsif ($format eq "extended_file"){
			$return_date = strftime("%Y%m%d%H%M",$sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);
		} elsif ($format eq "log"){
			$return_date = strftime("%Y%m%d %H:%M",$sec,$min,$hour,$mday,$mon,$year,$wday,$isdst);
		} else {
			print STDERR "Nettools::Tools error:  Unknown format\n";
			exit;
		}
	} else {
		print STDERR "Nettools::Tools error:  You must specify format for method formatDate\n";
		exit;
	}

	return $return_date;
}

###################################################################################################3
# method:  gcd
# description:  compute greatest common denominator of values
#
# params:  
# 	array or scalar containing values
#
# return:
#	scalar containing gcd
#
# examples:
# 	@values = ("10","20","30");
#	$gcd = $obj->gcd(@values);
#		- or -
#	$gcd = $obj->gcd(("10","20","30"));
#		- or -
#	$gcd = $obj->gcd("10,20,30");
#

sub gcd{

	my $self = shift;

	my $checked;
	my %compare;
	my $compare_value;
	my %factors;
	my $gcd;
	my $num_values;
	my $rem;
	my $small_value;
	my $test;
	my $value;
	my @values;
	my $x;

	# determine what was passed
	if ($_[0] =~ /,/){
		@values = split(/,/,$_[0]);
	} else {
		@values = @_;
	}

	$num_values = @values;
	$num_values--;

	if ($num_values != 0){

		foreach $value (@values){

       			if ($factors{$value}){
       		        	next;   # already determined factors;
       		 	} else {

       		         	# keep track of which value is smallest
       		         	if (! $small_value || $value < $small_value){
       		                 	$small_value = $value;
       		         	}

       		         	# determine factors
       		         	for ($x = 1; $x <= $value; $x++){
       		                 	$rem = $value % $x;
       		                 	if (! $rem){
       		                         	$factors{$value}->{$x} = $x;
       		                 	}
       		         	}
       		 	}
		}

		# copy the smallest hash into the "compare hash", then delete it.
		# %factors now only contains the values we need to compare against

		%compare = %{$factors{$small_value}};
		delete $factors{$small_value};

		# find gcd
		$gcd = 1;
		foreach $compare_value (%compare){

       		 	$checked = 0;

       		 	# determine if the compare_value is in each list of factors.  if it is,
       		 	# see if it is our current gcd
       		 	foreach $value (keys %factors){
       		         	if ($factors{$value}->{$compare_value}){
       		                 	$checked++;
       		         	}
       		 	}
       		 	if ($checked == $num_values){

       		         	# value is a common denominator, is it the greatest?
       		         	if ($compare_value > $gcd){
       		                 	# yup
       		                 	$gcd = $compare_value;
       		         	}
       			}
		}
	} else {
		$gcd = $values[0];
	}

	return $gcd;
}

###################################################################################################3
# method:  listFiles
# description:  list files in specified directory
#
# params: 
#	path		directory name (scaler or arrayref)
#	match		only return files that have specified string in name
# 
# return:
#	array containing names of files in directory
#
# examples:
#	return all file names in /etc
#		@files = $obj->listFiles(path => "/etc");
#
#	return all files names that have exe in name in /etc and /bin
#		@files = $obj->listFiles( path => ["/etc","/bin"],
#					  match => "exe"); 
#

sub listFiles{

	my $self = shift;
	my $param = { @_ };
	my $dir;
	my $file;
	my @dir;
	my @return;
	my $match;

	if ($param->{"path"}){
		if (ref($param->{"path"})){
			@dir = @{$param->{"path"}};
		} else {
			push(@dir, $param->{"path"});
		}
	} else {
		print STDERR "Nettools::Tools Error:  You must provider dir name for method listFiles\n";
		exit;
	}

	foreach $dir (@dir){	
		if (! -e $dir){
			print STDERR "Nettools::Tools Error:  Can't open $dir\n";
			exit;
		} else {
	        	opendir(DIR, $dir);
        		while( defined($file = readdir(DIR))){
				if ($param->{"match"} && $file =~ /$param->{"match"}/){
					push(@return, $file);
				} elsif (! $param->{"match"}){
					push(@return, $file);
				}
			}
			close DIR;
		}
	}
		

	return @return;
}








###################################################################################################3
# method:  lookup
# description:  resolve ip or host name in dns
#
# note:  this method uses default dns server listed in /etc/resolv.conf
#
# params:
#       ip address or hostnames (can be scalar or arrayref)
#
# return value:
#	if arrayref was passed, hash keyed by param
#	if scalar, scalar will be returned
#
# example:
#	
#	resolve multiple values
#		@data = ("10.0.24.46","cartman.office.aol.com");
#		%hash = $obj->lookup(\@data);
#		print "host:  $hash{"10.0.24.46"};
#		print "ip: $hash{"cartman.office.aol.com"}; 
#
#	resolve single value
#		$hostname = $obj->lookup("10.0.24.46");
#		print $hostname;
#
#

sub lookup{

        my $self = shift;
        my $value = shift;

	my @addresses;
	my $count;
	my $error;
        my $is_ref;
	my @lookup;
	my $lookup;
        my %return;

        $is_ref = ref($value);
        if ($is_ref){
                @lookup = @{$value};
        } else {
                push(@lookup, $value);
        }

	foreach $lookup (@lookup){
		$count++;
		$last = $lookup;
		
		if ($lookup =~ /^\d+\.\d+\.\d+\.\d+$/){
			# ip address
			eval {
                                local $SIG{ALRM} = sub {die "Connection timed out"};
                                alarm 10;
                		$result = gethostbyaddr(inet_aton($lookup),AF_INET) || die "Can't resolve $lookup: $!";
                                alarm 0;
                        };
                        if(! $@){
				$return{$lookup} = $result;
                        } else {
				$return{$lookup} = "Can't resolve $lookup: $!";
                        }
		} else {
			# host name, first make sure we can resolve it
			eval {
                                local $SIG{ALRM} = sub {die "Connection timed out"};
                                alarm 10;
				@addresses = gethostbyname($lookup) || die "Can't resolve $lookup:";
                                alarm 0;
                        };
			if (! $@){
				$return{$lookup} = inet_ntoa(inet_aton($lookup));
			} else {
				$return{$lookup} = "Can't resolve $lookup: $!";
			}
		}
			
        }

	if ($count > 1){
		return %return;
	} else {
		return $return{$last};	
	}
		
}

###################################################################################################3
# method:  new
# description:  object initializer
#
#

sub new{

        my $classname = shift;

        $self = { @_ };

        bless($self, $classname);

        return $self;
}


####################################################################################################
# method:  plot
# description:  creates a graph with gnuplot
#
# params:
#       %params - hash containing paramters
#       %data   - hash of hash containing data
#                 keys of first level hash are the Titles for each line
#                 keys of second level hash are used for the X-Axis values,
#                 default data is in Time format, so epoch times are used
#       %data2  - same as %data, but for a second Y-Axis on right side of graph
#       @colors - array of colors in rgb/hex format if you don't want to use
#                 the default ones. format: rrggbb
#
# return:
#       scalar containing raw graph
#
# examples:
#       $plot = $graf->plot(\%params,\%data);
#               - or -
#       $plot = $graf->plot(\%params,\%data,\%data2);
#               - or -
#       $plot = $graf->plot(\%params,\%data,\%data2,\@colors);
#
# Sample Program:
#
#   use lib("/opstools/dev/lib");
#   use Nettools::Tools;
#
#   my %params = ('title'=>'Test Of the GnuPlot Wrapper',
#                 'format x'=>'%m/%d\n%H:%M',
#                 'key'=>'below',
#                 'y2label'=>'Values',
#                 'ylabel'=>'Percent %');
#   my %data;
#   my $now = time;
#   for ($time = $now - 86400*3;$time < $now;$time+=8640){
#     $data{One}{$time} = rand 100;
#     $data{Two}{$time} = rand 100;
#     $data2{Three}{$time} = rand 5000;
#   }
#   my $graf = Nettools::Tools->new();
#   my $plot = $graf->plot(\%params,\%data,\%data2);
#   print $plot;
#
sub plot {
  use IPC::Open2;
  my $self     = shift;
  my ($params,$data,$data2,$colors) = @_;
  my (@keys)   = sort keys %{$data};
  my (@keys2)  = sort keys %{$data2};
  my $linetype = 'lp';
  my $terminal = 'gif';
  my $height   = 400;
  my $width    = 600;
  my $time     = '';
  my $gnuplot  = '/opstools/prod/bin/gnuplot';
  my($i,$type,$epoch,$date,$debug,$localtime);
  my @colors = ("ff0000", "0000ff", "00ff00", "daaa00", "ff00ff", "232375", "41ac41", 
                "1e90ff", "ff8700", "a52a2a", "adff2f", "ff69b4", "32bfc1", "43cd80", 
                "800000", "808000", "008080", "800080", "000080", "808080", "ff0000", 
                "00ff00", "0000ff", "daaa00", "ff00ff", "232375", "41ac41", "1e90ff", 
                "ff8700", "a52a2a", "adff2f", "ff69b4", "32bfc1", "43cd80", "800000",
                "808000", "008080", "800080", "000080", "808080", "ff0000", "00ff00",
                "0000ff", "daaa00", "ff00ff", "232375", "41ac41", "1e90ff", "ff8700",
                "a52a2a", "adff2f", "ff69b4", "32bfc1", "43cd80", "800000", "808000",
                "008080", "800080", "000080", "808080", "ff0000", "00ff00", "0000ff",
                "daaa00", "ff00ff", "232375", "41ac41", "1e90ff", "ff8700", "a52a2a",
                "adff2f", "ff69b4", "32bfc1", "43cd80", "800000", "808000", "008080",
                "800080", "000080", "808080", "ff0000", "00ff00", "0000ff", "daaa00",
                "ff00ff", "232375", "41ac41", "1e90ff", "ff8700", "a52a2a", "adff2f",
                "ff69b4", "32bfc1", "43cd80", "800000", "808000", "008080", "800080",
                "000080", "808080", "ff0000", "00ff00", "0000ff", "daaa00", "ff00ff",
                "232375", "41ac41", "1e90ff", "ff8700", "a52a2a", "adff2f", "ff69b4",
                "32bfc1", "43cd80", "800000", "808000", "008080", "800080", "000080",
                "808080", "ff0000", "00ff00", "0000ff", "daaa00", "ff00ff", "232375",
                "41ac41", "1e90ff", "ff8700", "a52a2a", "adff2f", "ff69b4", "32bfc1",
                "43cd80", "800000", "808000", "008080", "800080", "000080", "808080",
                "ff0000", "00ff00", "0000ff", "daaa00", "ff00ff", "232375", "41ac41",
                "1e90ff", "ff8700", "a52a2a", "adff2f", "ff69b4", "32bfc1", "43cd80",
                "800000", "808000", "008080", "800080", "000080", "808080", "ff0000",
                "00ff00", "0000ff", "daaa00", "ff00ff", "232375", "41ac41", "1e90ff",
                "ff8700", "a52a2a", "adff2f", "ff69b4", "32bfc1", "43cd80", "800000",
                "808000", "008080", "800080", "000080", "808080");

  $params->{'xdata'}    = 'time' if not defined $params->{'xdata'};
  $params->{'lmargin'}  = 12 if not defined $params->{'lmargin'};
  $params->{'key'}      = 'outside samplen 1' if not defined $params->{'key'} and not defined $params->{'nokey'};
  $params->{'title'}    = '' if not defined $params->{'title'};
  $params->{'missing'}  = '?' if not defined $params->{'missing'};
  $params->{'ylabel'}   = '' if not defined $params->{'ylabel'};
  $params->{'format x'} = '%H:%M' if not defined $params->{'format x'};
  $params->{'xlabel'}   = 'Time' if not defined $params->{'xlabel'};
  $params->{'timefmt'}  = '%Y.%m.%d:%H:%M:%S' if not defined $params->{'timefmt'};
  $params->{'title'}    = '"'.$params->{'title'}.'"'    if $params->{'title'} !~ /^['"].*['"]$/;
  $params->{'missing'}  = '"'.$params->{'missing'}.'"'  if $params->{'missing'} !~ /^['"].*['"]$/;
  $params->{'ylabel'}   = '"'.$params->{'ylabel'}.'"'   if $params->{'ylabel'} !~ /^['"].*['"]$/;
  $params->{'format x'} = '"'.$params->{'format x'}.'"' if $params->{'format x'} !~ /^['"].*['"]$/;
  $params->{'xlabel'}   = '"'.$params->{'xlabel'}.'"'   if $params->{'xlabel'} !~ /^['"].*['"]$/;
  $params->{'timefmt'}  = '"'.$params->{'timefmt'}.'"'  if $params->{'timefmt'} !~ /^['"].*['"]$/;
  @colors = @{$colors} if defined $colors;
  $time   = $params->{'timefmt'} if $params->{'xdata'} eq 'time';
  $time   =~ s/['"]//g;
  if(not defined $params->{'locale'} or $params->{'locale'} eq 'localtime' ){
    $localtime = 1;
  }
  delete $params->{'locale'} if defined $params->{'locale'};
  if(defined $params->{'linetype'}){
    $linetype = $params->{'linetype'};
    delete $params->{'linetype'};
  }
  if(defined $params->{'width'}){
    $width = $params->{'width'};
    delete $params->{'width'};
  }
  if(defined $params->{'height'}){
    $height = $params->{'height'};
    delete $params->{'height'};
  }
  if(defined $params->{'terminal'}){
    $terminal = $params->{'terminal'};
    delete $params->{'terminal'};
  }

  open2(IN,OUT,"$gnuplot") or die $!;
  select OUT;
  print "set terminal $terminal size $width,$height ";
  print "xffffff x000000 x999999 ";
  for $i (@colors){
    print "x$i ";
  }
  print "\nset output\n";
  if($#keys >= 0){
    print "set timefmt $params->{'timefmt'}\n" if $params->{'xdata'} eq 'time';
    delete $params->{'timefmt'};
    if($#keys2 >= 0){
      $params->{'rmargin'} = int($params->{'width'}/50) if not defined $params->{'rmargin'};
      $params->{'y2tics'}  = 'border';
      $params->{'y2label'} = '' if not defined $params->{'y2label'};
      $params->{'y2label'} =~ s/['"]//g;
      $params->{'y2label'} = "\"\\n\\n$params->{'y2label'}\"";;
    }else{
      $params->{'rmargin'} = int($params->{'width'}/70) if not defined $params->{'rmargin'};
      delete $params->{'y2label'};
    }
    if(not defined $params->{'nogrid'} and not defined $params->{'grid'}){
      $params->{'grid'} = '';
    }
    delete $params->{'debug'};
    foreach $cmd (keys %{$params}){
      print "set $cmd $params->{$cmd}\n";
    }
    print "plot ";
    for $i (0..$#keys){
      if($keys[$i] ne " "){
        print "'-' using 1:2 axes x1y1 title \"$keys[$i]\" with $linetype";
      }else{
        print "'-' using 1:2 axes x1y1 title \"\" with $linetype";
      }
      if($i < $#keys){
        print ",";
      }
    }
    if($#keys2 >= 0){
      print ",";
      for $i (0..$#keys2){
        print "'-' using 1:2 axes x1y2 title \"$keys2[$i]\" with $linetype";
        if($i < $#keys2){
          print ",";
        }
      }
    }
    print "\n";
    for $type (@keys){
      for $epoch (sort keys %{$data->{$type}}){
        if($time){
          if(defined $localtime){
            $date = POSIX::strftime($time,localtime($epoch));
          }else{
            $date = POSIX::strftime($time,gmtime($epoch));
          }
          print "$date $data->{$type}{$epoch}\n";
        }else{
        }
      }
      print "EOF\n";
    }
    for $type (@keys2){
      for $epoch (sort keys %{$data2->{$type}}){
        if($time){
          if(defined $localtime){
            $date = POSIX::strftime($time,localtime($epoch));
          }else{
            $date = POSIX::strftime($time,gmtime($epoch));
          }
          print "$date $data2->{$type}{$epoch}\n";
        }else{
        }
      }
      print "EOF\n";
    }
  }else{
    print "set nogrid\nset xrange [0:2]\nset yrange[0:2]\n";
    if(defined $params->{'debug'}){
      print "set label \"$params->{'debug'}\" ";
    }else{
      print "set label \"No Data Availble for that date range\" ";
    }
    print "at 1,1 center\n";
    print "set title \"\"\nset xlabel \"\"\nset ylabel \"\"\n";
    print "plot '-' using 1:2 title \"\"\nEOF\n";
  }
  print "quit\n";
  $graph = "";
  while(<IN>){
    $graph .= $_;
  };
  close OUT;
  close IN;
  select STDOUT;
  return $graph;
}

# required return true
1;
