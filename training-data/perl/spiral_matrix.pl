use strict;
use warnings;

sub spiral {
    my $n = shift;
    my @g = map { [ (0) x $n ] } 1 .. $n;
    my ($top, $left, $bottom, $right, $k) = (0, 0, $n - 1, $n - 1, 1);
    while ($top <= $bottom && $left <= $right) {
        $g[$top][$_] = $k++ for $left .. $right;
        $top++;
        $g[$_][$right] = $k++ for $top .. $bottom;
        $right--;
        if ($top <= $bottom) { $g[$bottom][$_] = $k++ for reverse $left .. $right; $bottom--; }
        if ($left <= $right) { $g[$_][$left] = $k++ for reverse $top .. $bottom; $left++; }
    }
    return \@g;
}

print join("\t", @$_), "\n" for @{ spiral(4) };
