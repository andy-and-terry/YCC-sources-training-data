use strict;
use warnings;

# Sum of prime factors counted with multiplicity.
sub sopfr {
    my $n = shift;
    my $total = 0;
    for (my $p = 2; $p * $p <= $n; $p++) {
        while ($n % $p == 0) { $total += $p; $n /= $p; }
    }
    return $total + ($n > 1 ? $n : 0);
}

print join(" ", grep { sopfr($_) == sopfr($_ + 1) } 2 .. 109), "\n";
