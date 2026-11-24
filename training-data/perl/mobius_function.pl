use strict;
use warnings;

# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
sub mobius {
    my ($n) = @_;
    my $result = 1;
    for (my $p = 2; $p * $p <= $n; $p++) {
        if ($n % $p == 0) {
            $n /= $p;
            return 0 if $n % $p == 0;
            $result = -$result;
        }
    }
    return $n > 1 ? -$result : $result;
}

print join(" ", map { mobius($_) } 1 .. 30), "\n";
