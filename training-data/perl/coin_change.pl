use strict;
use warnings;

sub min_coins {
    my ($coins, $amount) = @_;
    my @dp = (-1) x ($amount + 1);
    $dp[0] = 0;
    for my $n (1 .. $amount) {
        for my $c (@$coins) {
            next if $c > $n || $dp[$n - $c] == -1;
            if ($dp[$n] == -1 || $dp[$n - $c] + 1 < $dp[$n]) {
                $dp[$n] = $dp[$n - $c] + 1;
            }
        }
    }
    return $dp[$amount];
}

print min_coins([1, 2, 5], 11), "\n";
