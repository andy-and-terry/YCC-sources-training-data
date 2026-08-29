use strict;
use warnings;

sub binary_search {
    my ($arr, $target) = @_;
    my ($low, $high) = (0, $#$arr);
    while ($low <= $high) {
        my $mid = int(($low + $high) / 2);
        if ($arr->[$mid] == $target) {
            return $mid;
        } elsif ($arr->[$mid] < $target) {
            $low = $mid + 1;
        } else {
            $high = $mid - 1;
        }
    }
    return -1;
}

print binary_search([1, 3, 5, 7, 9, 11], 7), "\n";
