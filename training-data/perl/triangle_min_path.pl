use strict;
use warnings;
use List::Util qw(min);

sub minimum_total {
    my @t = @_;
    my @dp = @{ $t[-1] };
    for my $r (reverse 0 .. $#t - 1) {
        $dp[$_] = $t[$r][$_] + min($dp[$_], $dp[$_ + 1]) for 0 .. $#{ $t[$r] };
    }
    return $dp[0];
}

print minimum_total([2], [3, 4], [6, 5, 7], [4, 1, 8, 3]), "\n";    # 11
