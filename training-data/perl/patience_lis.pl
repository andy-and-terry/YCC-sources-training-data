use strict; use warnings;
my @a = (10, 9, 2, 5, 3, 7, 101, 18);
my @tails;
for my $x (@a) {
    my ($lo, $hi) = (0, scalar @tails);
    while ($lo < $hi) {
        my $mid = int(($lo + $hi) / 2);
        if ($tails[$mid] < $x) { $lo = $mid + 1 } else { $hi = $mid }
    }
    $tails[$lo] = $x;
}
print scalar(@tails), "\n";
