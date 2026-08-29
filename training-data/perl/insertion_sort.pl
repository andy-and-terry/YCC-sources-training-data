use strict;
use warnings;

sub insertion_sort {
    my @arr = @_;
    for my $i (1 .. $#arr) {
        my $key = $arr[$i];
        my $j = $i - 1;
        while ($j >= 0 && $arr[$j] > $key) {
            $arr[$j + 1] = $arr[$j];
            $j--;
        }
        $arr[$j + 1] = $key;
    }
    return @arr;
}

print join(" ", insertion_sort(12, 11, 13, 5, 6)), "\n";
