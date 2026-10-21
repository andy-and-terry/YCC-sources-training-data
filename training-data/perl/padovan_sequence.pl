use strict;
use warnings;

# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
my @p = (1, 1, 1);
push @p, $p[-2] + $p[-3] while @p < 15;
print "@p\n";
