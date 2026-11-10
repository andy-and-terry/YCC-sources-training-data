use strict; use warnings;
sub central_delannoy {
    my $n = shift;
    my @g;
    for my $i (0 .. $n) {
        for my $j (0 .. $n) {
            $g[$i][$j] = ($i == 0 || $j == 0) ? 1 : $g[$i-1][$j] + $g[$i][$j-1] + $g[$i-1][$j-1];
        }
    }
    return $g[$n][$n];
}
print join(" ", map { central_delannoy($_) } 0 .. 5), "\n"; # 1 3 13 63 321 1683
