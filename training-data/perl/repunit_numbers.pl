use strict; use warnings;
# Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
my ($r, @out) = (0);
for (1 .. 8) { $r = $r * 10 + 1; push @out, $r }
print "@out\n";
