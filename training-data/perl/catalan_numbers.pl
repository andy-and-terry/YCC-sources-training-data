use strict;
use warnings;
use Math::BigInt;

sub catalan_dp {
    my $n = shift;
    my @c = (1);
    for my $i (1 .. $n) {
        $c[$i] = 0;
        $c[$i] += $c[$_] * $c[ $i - 1 - $_ ] for 0 .. $i - 1;
    }
    return @c;
}

sub catalan_big {    # C(n) = binom(2n, n) / (n + 1)
    my $n = shift;
    return Math::BigInt->new(2 * $n)->bnok($n)->bdiv($n + 1);
}

print join(' ', catalan_dp(15)), "\n";
print 'C(100) = ', catalan_big(100), "\n";
