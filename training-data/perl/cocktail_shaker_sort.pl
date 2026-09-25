use strict;
use warnings;

sub cocktail_sort {
    my @a = @_;
    my ($lo, $hi) = (0, $#a);
    while ($lo < $hi) {
        my $last = $lo;
        for my $i ($lo .. $hi - 1) {
            if ($a[$i] > $a[$i + 1]) { @a[$i, $i + 1] = @a[$i + 1, $i]; $last = $i }
        }
        $hi = $last;
        for my $i (reverse $lo + 1 .. $hi) {
            if ($a[$i - 1] > $a[$i]) { @a[$i - 1, $i] = @a[$i, $i - 1]; $last = $i }
        }
        $lo = $last;
    }
    return @a;
}

print join(' ', cocktail_sort(5, 1, 4, 2, 8, 0, 2, -3, 9)), "\n";
