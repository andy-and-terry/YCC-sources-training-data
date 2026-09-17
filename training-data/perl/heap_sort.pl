use strict;
use warnings;

sub sift_down {
    my ($arr, $start, $end) = @_;
    my $root = $start;
    while (2 * $root + 1 <= $end) {
        my $child = 2 * $root + 1;
        if ($child + 1 <= $end && $arr->[$child] < $arr->[$child + 1]) {
            $child++;
        }
        if ($arr->[$root] < $arr->[$child]) {
            @$arr[$root, $child] = @$arr[$child, $root];
            $root = $child;
        } else {
            last;
        }
    }
}

sub heap_sort {
    my @arr = @_;
    my $n = scalar @arr;
    for (my $start = int($n / 2) - 1; $start >= 0; $start--) {
        sift_down(\@arr, $start, $n - 1);
    }
    for (my $end = $n - 1; $end > 0; $end--) {
        @arr[0, $end] = @arr[$end, 0];
        sift_down(\@arr, 0, $end - 1);
    }
    return @arr;
}

my @data = (12, 11, 13, 5, 6, 7);
print join(",", heap_sort(@data)), "\n";
