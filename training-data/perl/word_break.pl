use strict;
use warnings;

sub word_break {
    my ($s, $dict) = @_;
    my %words = map { $_ => 1 } @$dict;
    my $len = length $s;
    my @dp = (0) x ($len + 1);
    $dp[0] = 1;
    for my $i (1 .. $len) {
        for my $j (0 .. $i - 1) {
            if ($dp[$j] && $words{substr($s, $j, $i - $j)}) {
                $dp[$i] = 1;
                last;
            }
        }
    }
    return $dp[$len];
}

print word_break("leetcode", ["leet", "code"]) ? "true" : "false", "\n";
print word_break("applepenapple", ["apple", "pen"]) ? "true" : "false", "\n";
print word_break("catsandog", ["cats", "dog", "sand", "and", "cat"]) ? "true" : "false", "\n";
