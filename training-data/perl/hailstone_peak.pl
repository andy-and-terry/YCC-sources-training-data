use strict;
use warnings;
use List::Util qw(max);

# Highest value reached by the Collatz (hailstone) sequence from n.
sub peak {
    my $n = shift;
    my $best = $n;
    while ($n != 1) {
        $n = $n % 2 == 0 ? $n / 2 : 3 * $n + 1;
        $best = max($best, $n);
    }
    return $best;
}

print peak(27), "\n";
