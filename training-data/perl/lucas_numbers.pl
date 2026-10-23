use strict;
use warnings;

# Lucas numbers, iteratively.
my ($a, $b) = (2, 1);
my @seq;
for (1 .. 10) {
    push @seq, $a;
    ($a, $b) = ($b, $a + $b);
}
print "@seq\n";
