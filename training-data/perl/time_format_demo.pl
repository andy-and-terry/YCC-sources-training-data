use strict;
use warnings;
use POSIX qw(strftime floor);
use Time::Local qw(timegm);

my $epoch = timegm(30, 45, 13, 15, 2, 2024);   # 2024-03-15 13:45:30 UTC
print "epoch: $epoch\n";

print strftime("%Y-%m-%d %H:%M:%S", gmtime($epoch)), "\n";
print strftime("%A, %d %B %Y", gmtime($epoch)), "\n";

my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday) = gmtime($epoch);
printf "year=%d month=%d day=%d weekday=%d yearday=%d\n",
    $year + 1900, $mon + 1, $mday, $wday, $yday;

my $later = $epoch + 20 * 86400;
print "+20 days: ", strftime("%Y-%m-%d", gmtime($later)), "\n";

my $diff = $later - $epoch;
printf "%d days, %d hours\n", floor($diff / 86400), floor(($diff % 86400) / 3600);
