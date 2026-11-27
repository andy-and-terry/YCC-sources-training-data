use strict;
use warnings;

sub area {
    my @p = @_;
    my $s = 0;
    for my $i (0 .. $#p) {
        my ($x1, $y1) = @{ $p[$i] };
        my ($x2, $y2) = @{ $p[($i + 1) % @p] };
        $s += $x1 * $y2 - $x2 * $y1;
    }
    return abs($s) / 2;
}

print area([0, 0], [4, 0], [4, 3], [0, 3]), "\n";
