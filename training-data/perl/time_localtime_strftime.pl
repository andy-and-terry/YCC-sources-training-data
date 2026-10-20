use strict;
use warnings;
use POSIX qw(strftime floor ceil fmod);
use Time::Local qw(timegm);

my $t = timegm(0, 30, 12, 15, 2, 2024);
print strftime("%Y-%m-%d %H:%M:%S %a", gmtime($t)), "\n";
my @g = gmtime($t + 86400 * 20);
printf "%04d-%02d-%02d\n", $g[5] + 1900, $g[4] + 1, $g[3];
print floor(-2.5), ceil(-2.5), " ", fmod(10, 3), " ", int(-7 / 2), " ", -7 % 3, "\n";
