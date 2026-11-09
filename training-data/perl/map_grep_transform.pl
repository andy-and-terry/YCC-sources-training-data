use strict; use warnings;
my @n = 1 .. 10;
my @sq = map { $_ * $_ } grep { $_ % 2 == 0 } @n;
print "@sq\n";
my %idx = map { $_ => length } qw(apple fig);
print join(",", map { "$_=$idx{$_}" } sort keys %idx), "\n";
