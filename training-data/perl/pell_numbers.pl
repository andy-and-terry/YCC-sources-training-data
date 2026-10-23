use strict;
use warnings;

# P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
my ($a, $b) = (0, 1);
for my $i (0 .. 14) {
    print "P($i) = $a\n";
    ($a, $b) = ($b, 2 * $b + $a);
}
