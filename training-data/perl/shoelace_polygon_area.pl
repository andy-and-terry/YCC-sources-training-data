# Shoelace polygon area.
use strict; use warnings;
my @p = ([0, 0], [4, 0], [4, 3], [0, 3]);
my $s = 0;
for my $i (0 .. $#p) {
    my ($x1, $y1) = @{ $p[$i] };
    my ($x2, $y2) = @{ $p[($i + 1) % @p] };
    $s += $x1 * $y2 - $x2 * $y1;
}
print abs($s) / 2, "\n";
