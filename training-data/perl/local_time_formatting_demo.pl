#!/usr/bin/perl
use strict;
use warnings;
use POSIX qw(strftime);

my $epoch = 1_700_000_000;
my @t = gmtime($epoch);

printf "%04d-%02d-%02d %02d:%02d:%02d\n",
    $t[5] + 1900, $t[4] + 1, $t[3], $t[2], $t[1], $t[0];

print strftime("%A, %d %B %Y", @t), "\n";
print strftime("%H:%M", @t), "\n";

my @days = qw(Sun Mon Tue Wed Thu Fri Sat);
print "weekday: $days[$t[6]]\n";
print "day of year: ", $t[7] + 1, "\n";

my $later = $epoch + 3 * 24 * 60 * 60;
print strftime("%Y-%m-%d", gmtime($later)), "\n";
