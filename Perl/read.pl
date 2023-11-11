#!/usr/bin/perl
use warnings;
use strict;

my $src = 'mail.log';

open(SRC,'<',$src) or die $!;

while (<SRC>) {
	print $_;
}

close(SRC);

print "\n Read all file! \n";


sec,     # 秒， 0 到 61
min,     # 分钟， 0 到 59
hour,    # 小时， 0 到 24
mday,    # 天， 1 到 31
mon,     # 月， 0 到 11
year,    # 年，从 1900 开始
wday,    # 星期几，0-6,0表示周日
yday,    # 一年中的第几天,0-364,365
isdst    # 如果夏令时有效，则为真

实例
#!/usr/bin/perl
 
@months = qw( 一月 二月 三月 四月 五月 六月 七月 八月 九月 十月 十一月 十二月 );
@days = qw(星期天 星期一 星期二 星期三 星期四 星期五 星期六);
 
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
print "$mday $months[$mon] $days[$wday]\n";

实例
#!/usr/bin/perl
use POSIX qw(strftime);
 
$datestring = strftime "%Y-%m-%d %H:%M:%S", localtime;
printf("时间日期 - $datestring\n");
 
#  GMT 格式化时间日期
$datestring = strftime "%Y-%m-%d %H:%M:%S", gmtime;
printf("时间日期 - $datestring\n");

实例
#!/usr/bin/perl
 
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
print "当期时间和日期：";
printf("%d-%d-%d %d:%d:%d",$year+1900,$mon+1,$mday,$hour,$min,$sec);
 
print "\n";
 
$epoc = time();
$epoc = $epoc - 24 * 60 * 60;   # 一天前的时间秒数
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($epoc);
print "昨天时间和日期：";
printf("%d-%d-%d %d:%d:%d",$year+1900,$mon+1,$mday,$hour,$min,$sec);
 
print "\n";


































