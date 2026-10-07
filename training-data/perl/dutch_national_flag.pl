use strict;
use warnings;

sub dutch_flag_sort {
    my @arr = @_;
    my ($low, $mid, $high) = (0, 0, $#arr);
    while ($mid <= $high) {
        if ($arr[$mid] == 0) {
            @arr[$low, $mid] = @arr[$mid, $low];
            $low++;
            $mid++;
        } elsif ($arr[$mid] == 1) {
            $mid++;
        } else {
            @arr[$mid, $high] = @arr[$high, $mid];
            $high--;
        }
    }
    return @arr;
}

my @colors = (2, 0, 1, 2, 1, 0, 0, 2, 1);
print join(",", dutch_flag_sort(@colors)), "\n";
