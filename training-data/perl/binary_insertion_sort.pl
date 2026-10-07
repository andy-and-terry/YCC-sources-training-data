use strict;
use warnings;

sub binary_insertion_sort {
    my @a = @_;
    for my $i (1 .. $#a) {
        my $x = $a[$i];
        my ($lo, $hi) = (0, $i);
        while ($lo < $hi) {
            my $mid = ($lo + $hi) >> 1;
            if ($a[$mid] <= $x) { $lo = $mid + 1 } else { $hi = $mid }
        }
        splice @a, $i, 1;
        splice @a, $lo, 0, $x;
    }
    return @a;
}

print join(' ', binary_insertion_sort(37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54)), "\n";
