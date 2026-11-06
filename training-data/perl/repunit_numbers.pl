use strict;
use warnings;

# Repunits: numbers made only of the digit 1.
my $r = 0;
my @out;
for (1 .. 5) {
    $r = $r * 10 + 1;
    push @out, $r;
}
print "@out\n";
