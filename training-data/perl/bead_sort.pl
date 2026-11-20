# Bead (gravity) sort.
use strict; use warnings;
my @nums = (5, 3, 1, 4, 2);
my @cols = (0) x 5;
for my $n (@nums) { $cols[$_]++ for 0 .. $n - 1 }
my @rows = map { my $r = $_; scalar grep { $_ > $r } @cols } 0 .. $#nums;
print join(",", reverse @rows), "\n";
