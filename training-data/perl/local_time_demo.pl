use strict; use warnings;
use POSIX qw(strftime);

my @t = gmtime(86400 * 365);
print strftime("%Y-%m-%d %H:%M:%S", @t), "\n";
my ($sec, $min, $hour, $mday, $mon, $year, $wday) = @t;
my @days = qw(Sun Mon Tue Wed Thu Fri Sat);
printf "year=%d month=%d weekday=%s\n", $year + 1900, $mon + 1, $days[$wday];
