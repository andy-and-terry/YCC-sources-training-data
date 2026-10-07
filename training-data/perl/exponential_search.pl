use strict;
use warnings;

sub exponential_search {
    my ($a, $t) = @_;
    return -1 unless @$a;
    return 0 if $a->[0] == $t;
    my $bound = 1;
    $bound *= 2 while $bound < @$a && $a->[$bound] < $t;
    my ($lo, $hi) = ($bound >> 1, $bound < $#$a ? $bound : $#$a);
    while ($lo <= $hi) {
        my $mid = ($lo + $hi) >> 1;
        return $mid if $a->[$mid] == $t;
        if ($a->[$mid] < $t) { $lo = $mid + 1 } else { $hi = $mid - 1 }
    }
    return -1;
}

my @a = map { $_ * 3 } 0 .. 40;
print join(' ', map { exponential_search(\@a, $_) } 0, 3, 57, 120, 121, -5), "\n";
