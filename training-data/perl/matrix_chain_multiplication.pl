use strict;
use warnings;

sub matrix_chain_order {
    my (@dims) = @_;
    my $n = scalar(@dims) - 1;
    my @dp;
    for my $i (0 .. $n - 1) {
        $dp[$i][$i] = 0;
    }
    for my $len (2 .. $n) {
        for my $i (0 .. $n - $len) {
            my $j = $i + $len - 1;
            $dp[$i][$j] = 9**9**9;
            for my $k ($i .. $j - 1) {
                my $cost = $dp[$i][$k] + $dp[$k + 1][$j] + $dims[$i] * $dims[$k + 1] * $dims[$j + 1];
                $dp[$i][$j] = $cost if $cost < $dp[$i][$j];
            }
        }
    }
    return $dp[0][$n - 1];
}

print matrix_chain_order(40, 20, 30, 10, 30), "\n";
