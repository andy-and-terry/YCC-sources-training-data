use strict;
use warnings;
use POSIX qw(strftime);

my $epoch = 86400 * 365;    # 1971-01-01 UTC
my @t = gmtime($epoch);
printf "%04d-%02d-%02d %02d:%02d:%02d\n", $t[5] + 1900, $t[4] + 1, $t[3], @t[2, 1, 0];
print strftime("%A, %d %B %Y", gmtime($epoch)), "\n";
print "day of year: $t[7], weekday index: $t[6]\n";

my $later = $epoch + 30 * 86400;
print strftime("%Y-%m-%d", gmtime($later)), "\n";
print "diff days: ", ($later - $epoch) / 86400, "\n";
