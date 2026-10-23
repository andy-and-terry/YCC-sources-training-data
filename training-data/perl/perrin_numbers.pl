use strict;
use warnings;

# Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
my @p = (3, 0, 2);
push @p, $p[$_ - 2] + $p[$_ - 3] for 3 .. 14;
print "@p\n";
