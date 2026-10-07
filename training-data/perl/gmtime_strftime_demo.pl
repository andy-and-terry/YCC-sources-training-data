use strict;
use warnings;
use POSIX qw(strftime floor);

my $epoch = 86400 * 365;
my @t = gmtime($epoch);
printf "%04d-%02d-%02d\n", $t[5] + 1900, $t[4] + 1, $t[3];
print strftime("%A, %d %B %Y %H:%M:%S", gmtime($epoch)), "\n";

my $secs = 93784;
printf "%dd %02dh %02dm %02ds\n",
    floor($secs / 86400), ($secs / 3600) % 24, ($secs / 60) % 60, $secs % 60;
