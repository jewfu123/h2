#!/usr/bin/perl
use warnings;
use strict;

my $str = <<END;
This is the sample text abc!
END

my $filename = "temp.log";

open(FH, '>', $filename) or die $!;

print FH $str;

close(FH);

print("Writing to file successfully! \n");

system("ls -l");









