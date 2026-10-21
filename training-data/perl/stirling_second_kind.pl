use strict;
use warnings;

# Stirling numbers of the second kind.
sub stirling2 {
    my ($n, $k) = @_;
    my @t = map { [ (0) x ($k + 1) ] } 0 .. $n;
    $t[0][0] = 1;
    for my $i (1 .. $n) {
        my $max = $i < $k ? $i : $k;
        $t[$i][$_] = $_ * $t[$i - 1][$_] + $t[$i - 1][$_ - 1] for 1 .. $max;
    }
    return $t[$n][$k];
}

print stirling2(5, 2), " ", stirling2(6, 3), "\n";
