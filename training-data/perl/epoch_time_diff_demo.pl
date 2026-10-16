use strict;
use warnings;
use Time::Local qw(timegm);

my $start = timegm(0, 0, 8, 1, 0, 2024);
my $end   = timegm(30, 45, 17, 15, 2, 2024);

my $diff = $end - $start;
my $days  = int($diff / 86400);
my $hours = int(($diff % 86400) / 3600);
my $mins  = int(($diff % 3600) / 60);
my $secs  = $diff % 60;

print "elapsed seconds: $diff\n";
print "elapsed: ${days}d ${hours}h ${mins}m ${secs}s\n";

my @t = gmtime($start + 86400 * 60);
printf "60 days after start: %04d-%02d-%02d\n", $t[5] + 1900, $t[4] + 1, $t[3];
my @wd = qw(Sun Mon Tue Wed Thu Fri Sat);
print "weekday of start: $wd[(gmtime $start)[6]]\n";
