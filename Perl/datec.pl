#!/usr/bin/perl
use warnings;
use strict;
use POSIX;

my @MONTH = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);

my $filename = 'mail.log';

my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
my $maxline = 30;
my $fileno = 0;

sub read_write_files {
	my $directory = -1;
	print "$MONTH[$mon] $mday \n";
	$year += 1900;
	print $year."\n";

	my $show_date = sprintf("%04d-%02d-%02d", $year, $mon, $mday);
	print ($show_date."\n");

	my $input_str = <STDIN>;

	if ( $input_str > 0 ) {
		$directory = 1;
	} else {
		$directory = -1;
	}

	print "Your input the key:".$input_str."\n";

	open(my $fh, '<:encoding(UTF-8)', $filename)
	  or die "Could not open file '$filename' $!";
	 
	#######
	system("rm -r *.gz");
	#######

	#my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time + $i*86400);
	#$year += 1900;
	my $i = 0;
	my $tmp_s = strftime "%Y%m%d", localtime(time + $i*86400);
	my $outfile;
	my $tmp_pre = "";

	while (my $row = <$fh>) {
	  #chomp $row;
	  #print "$row\n";
	  #--------------------------------------
	  if ( $i % $maxline == 0 ) {
	  	#if ( $directory == 1 ) {
	  	#	$fileno = $fileno * 1;
	  	#}  else {
	  	#	$fileno = $fileno * -1;
	  	#}
	  	if ( abs($fileno) < abs($input_str) ) {
	  		close($outfile) if ($outfile);
		  	
		  	print "fileno : ".$fileno."\n";
			my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time + $fileno*86400);
			$tmp_s = strftime "%Y%m%d", localtime(time + $fileno*86400);
			print "tmp_s : ".$tmp_s."\n";
			
			$tmp_pre = "$MONTH[$mon] $mday";
			print "tmp_pre : ".$tmp_pre."\n";

			#if ($mday>=10) {
			#	$tmp_pre = strftime "%b %e", localtime(time + $fileno*86400);
			#} else {
			#	$tmp_pre = strftime "%b%e", localtime(time + $fileno*86400);
			#}

			#my $tmp_s = localtime(time + $i*86400);
			open($outfile,">","mail.log-".$tmp_s) or die $!;
	  	} else { 
	  		return 0;
	  	}

  		if ( $directory == 1 ) {
	  		$fileno++;
	  	}  else {
	  		$fileno--;
	  	}
		#$fileno++;
		print $tmp_s."\n";
	  }
	  #--------------------------------------
	  #my $tttt_day = "$MONTH[$mon] $mday";
	  print $outfile $tmp_pre." ".$row;
	  #print $outfile $tttt_day." ".$row;
	  $i++;
	}
	close($outfile) if ($outfile);
	close(FH);
}

sub show_datestr {
	my $date3 = strftime "%a %b %e %H:%M:%S %Y", localtime;
	print "Date3 is : $date3 \n";

	my $date4 = strftime "%a-%B-%e", localtime;
	print "Date4 is : $date4 \n";

	my $date5 = strftime "%H:%M:%S", localtime;
	print "Time1 is : $date5 \n";

	my $date6 = strftime "%h:%m:%s", localtime;
	print "Time2 is : $date6 \n";

}

sub main {
	read_write_files();
	
	print "Wait 3 seconds . . . \n";
	
	delete_gz_files();

}

sub delete_gz_files {
	sleep(3);

	my @tocompress = glob 'mail.log-*';
	# -------- gzip multiple files ------------ #
	for my $file (@tocompress) {
	    next unless -f $file;
	    print STDERR "Adding $file\n";
	    system("gzip ".$file);
	}
	print "gzip completed! \n";
}

main();




