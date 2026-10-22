use strict;
use warnings;

# Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
my @n = (1, 1, 1);
push @n, $n[$_ - 1] + $n[$_ - 3] for 3 .. 14;
print "@n\n";
