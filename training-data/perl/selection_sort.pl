use strict;
use warnings;

sub selection_sort {
    my @arr = @_;
    for my $i (0 .. $#arr - 1) {
        my $min_idx = $i;
        for my $j ($i + 1 .. $#arr) {
            $min_idx = $j if $arr[$j] < $arr[$min_idx];
        }
        @arr[$i, $min_idx] = @arr[$min_idx, $i];
    }
    return @arr;
}

print join(" ", selection_sort(5, 3, 8, 1, 9, 2)), "\n";
