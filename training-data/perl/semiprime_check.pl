use strict;
use warnings;

sub prime_factor_count {
    my ($n) = @_;
    my $count = 0;
    for (my $p = 2; $p * $p <= $n; $p++) {
        while ($n % $p == 0) {
            $n /= $p;
            $count++;
        }
    }
    return $n > 1 ? $count + 1 : $count;
}

print join(" ", grep { prime_factor_count($_) == 2 } 2 .. 29), "\n";
