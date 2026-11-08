use strict;
use warnings;

my @p = ([0, 0], [4, 0], [4, 3], [0, 3]);
my $s = 0;
for my $i (0 .. $#p) {
    my $q = $p[($i + 1) % @p];
    $s += $p[$i][0] * $q->[1] - $q->[0] * $p[$i][1];
}
print abs($s) / 2, "\n";
