use strict;
use warnings;

sub ternary_search {
    my ($arr, $target) = @_;
    my $lo = 0;
    my $hi = scalar(@$arr) - 1;
    while ($lo <= $hi) {
        my $third = int(($hi - $lo) / 3);
        my $m1 = $lo + $third;
        my $m2 = $hi - $third;
        return $m1 if $arr->[$m1] == $target;
        return $m2 if $arr->[$m2] == $target;
        if ($target < $arr->[$m1]) {
            $hi = $m1 - 1;
        } elsif ($target > $arr->[$m2]) {
            $lo = $m2 + 1;
        } else {
            $lo = $m1 + 1;
            $hi = $m2 - 1;
        }
    }
    return -1;
}

my @arr = (1, 3, 5, 7, 9, 11, 13, 15);
print ternary_search(\@arr, 9), "\n";
print ternary_search(\@arr, 4), "\n";
