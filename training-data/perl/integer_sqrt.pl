use strict;
use warnings;

# Floor square root via Newton's method on integers.
sub isqrt {
    my $n = shift;
    die "negative\n" if $n < 0;
    return $n if $n < 2;
    my $x = $n;
    my $y = ($x + 1) >> 1;
    ($x, $y) = ($y, ($y + int($n / $y)) >> 1) while $y < $x;
    return $x;
}

sub isqrt_bisect {
    my $n = shift;
    my ($lo, $hi) = (0, $n < 3_037_000_499 ? $n : 3_037_000_499);
    while ($lo < $hi) {
        my $mid = ($lo + $hi + 1) >> 1;
        if ($mid * $mid <= $n) { $lo = $mid } else { $hi = $mid - 1 }
    }
    return $lo;
}

for my $n (0, 1, 15, 16, 17, 99, 1_000_000, 9_223_372_036_854_775_807) {
    printf "%-20s isqrt=%-12d bisect=%d\n", $n, isqrt($n), isqrt_bisect($n);
}
