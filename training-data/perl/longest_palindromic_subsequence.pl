use strict;
use warnings;

sub longest_palindromic_subsequence {
    my ($s) = @_;
    my $n = length($s);
    return 0 if $n == 0;
    my @dp;
    for my $i (0 .. $n - 1) {
        $dp[$i][$i] = 1;
    }
    for my $len (2 .. $n) {
        for my $i (0 .. $n - $len) {
            my $j = $i + $len - 1;
            if (substr($s, $i, 1) eq substr($s, $j, 1)) {
                $dp[$i][$j] = ($i + 1 <= $j - 1 ? $dp[$i + 1][$j - 1] : 0) + 2;
            } else {
                $dp[$i][$j] = $dp[$i + 1][$j] > $dp[$i][$j - 1] ? $dp[$i + 1][$j] : $dp[$i][$j - 1];
            }
        }
    }
    return $dp[0][$n - 1];
}

print longest_palindromic_subsequence("bbbab"), "\n";
print longest_palindromic_subsequence("cbbd"), "\n";
