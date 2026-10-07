use strict;
use warnings;

my $n = 0b101101;
printf "n=%d bin=%b\n", $n, $n;
printf "set bit 1:   %b\n", $n | (1 << 1);
printf "clear bit 0: %b\n", $n & ~(1 << 0);
printf "toggle bit 5: %b\n", $n ^ (1 << 5);
printf "is bit 2 set? %s\n", ($n >> 2) & 1 ? "yes" : "no";

my $count = 0;
for (my $v = $n; $v; $v &= $v - 1) { $count++ }
print "popcount: $count\n";
printf "lowest set bit: %b\n", $n & -$n;
