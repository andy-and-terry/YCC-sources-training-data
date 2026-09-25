use strict;
use warnings;
use List::Util qw(max min);

sub max_product {
    my ($first, @rest) = @_;
    my ($best, $hi, $lo) = ($first) x 3;
    for my $x (@rest) {
        ($hi, $lo) = ($lo, $hi) if $x < 0;
        $hi = max($x, $hi * $x);
        $lo = min($x, $lo * $x);
        $best = $hi if $hi > $best;
    }
    return $best;
}

printf "%-24s -> %d\n", "[@$_]", max_product(@$_) for [2, 3, -2, 4], [-2, 0, -1], [-2, 3, -4], [1, -2, -3, 0, 7, -8, -2];
