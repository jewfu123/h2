#!/usr/bin/perl -w

use POSIX;

my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
$year += 1900;
print "$sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst\n";

$now_string = localtime;
print "$now_string\n";

$date = strftime "%a %b %e %H:%M:%S %Y", localtime;
print "Date1 is: $date\n";

$date = strftime "%a-%B-%e", localtime;
print "Date2 is: $date\n";

$time = strftime "%H:%M:%S", localtime;
print "Time1 is: $time\n";

$time1 = strftime "%h:%m:%s", localtime;
print "Time2 is: $time1\n";
output
15, 2, 18, 8, 9, 2017, 0, 280, 0
Sun Oct  8 18:02:15 2017
Date1 is: Sun Oct  8 18:02:15 2017
Date2 is: Sun-October- 8
Time1 is: 18:02:15
Time2 is: Oct:10:1507465935
Desired output:
Date1 is: 06-Oct-2017
Date2 is: 06-10-2017
Time1 is: 23:35:10
Time2 is: 11:35:10 PM