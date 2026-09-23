use strict;
use warnings;

# dims has n+1 entries describing n matrices: matrix i is dims[i] x dims[i+1].
# dp[i][j] is the minimum scalar multiplications to multiply matrices i..j.
sub matrix_chain_order {
    my (@dims) = @_;
    my $n = scalar(@dims) - 1;
    my @dp;
    for my $i (0 .. $n) {
        for my $j (0 .. $n) {
            $dp[$i][$j] = 0;
        }
    }

    for my $len (2 .. $n) {
        for my $i (1 .. $n - $len + 1) {
            my $j = $i + $len - 1;
            $dp[$i][$j] = 1e15;
            for my $k ($i .. $j - 1) {
                my $cost = $dp[$i][$k] + $dp[$k + 1][$j] + $dims[$i - 1] * $dims[$k] * $dims[$j];
                $dp[$i][$j] = $cost if $cost < $dp[$i][$j];
            }
        }
    }
    return $dp[1][$n];
}

print matrix_chain_order(40, 20, 30, 10, 30), "\n";
print matrix_chain_order(10, 20, 30), "\n";
