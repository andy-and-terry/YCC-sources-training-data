use strict;
use warnings;
use List::Util qw(max min);

sub max_product {
    my @n = @_;
    my ($best, $hi, $lo) = ($n[0]) x 3;
    for my $x (@n[1 .. $#n]) {
        ($hi, $lo) = ($lo, $hi) if $x < 0;
        $hi = max($x, $hi * $x);
        $lo = min($x, $lo * $x);
        $best = max($best, $hi);
    }
    return $best;
}

print join(' ', max_product(2, 3, -2, 4), max_product(-2, 0, -1), max_product(-2, 3, -4)), "\n";
