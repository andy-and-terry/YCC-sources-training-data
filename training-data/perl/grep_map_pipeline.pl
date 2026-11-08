use strict;
use warnings;

my @n = 1 .. 10;
my @r = map { $_ * $_ } grep { $_ % 2 } @n;
print "@r\n";
my %sq = map { $_ => $_ ** 2 } 1 .. 3;
print join(",", map { "$_:$sq{$_}" } sort keys %sq), "\n";
