use strict;
use warnings;

sub lcs {
    my ($a, $b) = @_;
    my @a = split //, $a;
    my @b = split //, $b;
    my @dp;
    for my $i (0 .. @a) {
        for my $j (0 .. @b) {
            if ($i == 0 || $j == 0) {
                $dp[$i][$j] = 0;
            } elsif ($a[$i - 1] eq $b[$j - 1]) {
                $dp[$i][$j] = $dp[$i - 1][$j - 1] + 1;
            } else {
                $dp[$i][$j] = $dp[$i - 1][$j] > $dp[$i][$j - 1] ? $dp[$i - 1][$j] : $dp[$i][$j - 1];
            }
        }
    }
    return $dp[scalar @a][scalar @b];
}

print lcs("abcde", "ace"), "\n";
print lcs("abc", "abc"), "\n";
print lcs("abc", "def"), "\n";
