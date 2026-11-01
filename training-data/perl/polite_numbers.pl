use strict;
use warnings;

# Ways to write n as a sum of two or more consecutive positive integers.
sub polite_ways {
    my $n = shift;
    my $ways = 0;
    for (my $k = 2; $k * ($k + 1) / 2 <= $n; $k++) {
        $ways++ if ($n - $k * ($k - 1) / 2) % $k == 0;
    }
    return $ways;
}

print join(" ", map { polite_ways($_) } 1 .. 16), "\n";
