use strict;
use warnings;

sub word_break {
    my ($s, $dict) = @_;
    my %words = map { $_ => 1 } @$dict;
    my $n = length($s);
    my @dp = (0) x ($n + 1);
    $dp[0] = 1;
    for my $i (1 .. $n) {
        for my $j (0 .. $i - 1) {
            if ($dp[$j] && $words{ substr($s, $j, $i - $j) }) {
                $dp[$i] = 1;
                last;
            }
        }
    }
    return $dp[$n];
}

my @dict = ("leet", "code");
print word_break("leetcode", \@dict) ? "1\n" : "0\n";
print word_break("leetcodex", \@dict) ? "1\n" : "0\n";
