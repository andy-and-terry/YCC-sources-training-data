use strict;
use warnings;

# Three-way partition around a pivot value.
sub partition3 {
    my ($pivot, @a) = @_;
    my ($lo, $mid, $hi) = (0, 0, $#a);
    while ($mid <= $hi) {
        if ($a[$mid] < $pivot)    { @a[$lo, $mid] = @a[$mid, $lo]; $lo++; $mid++ }
        elsif ($a[$mid] > $pivot) { @a[$mid, $hi] = @a[$hi, $mid]; $hi-- }
        else                      { $mid++ }
    }
    return \@a, $lo, $hi;
}

my ($a, $lo, $hi) = partition3(1, 2, 0, 2, 1, 1, 0, 2, 0, 1);
print "@$a (equal region $lo..$hi)\n";
($a) = partition3(5, 9, 5, 1, 7, 5, 3, 8, 2);
print "@$a\n";
