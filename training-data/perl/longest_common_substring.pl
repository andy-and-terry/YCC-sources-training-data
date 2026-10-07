use strict;
use warnings;

sub longest_common_substring {
    my ($a, $b) = @_;
    my $n = length($a);
    my $m = length($b);
    my @dp;
    my $best = 0;
    for my $i (0 .. $n) {
        for my $j (0 .. $m) {
            $dp[$i][$j] = 0;
        }
    }
    for my $i (1 .. $n) {
        for my $j (1 .. $m) {
            if (substr($a, $i - 1, 1) eq substr($b, $j - 1, 1)) {
                $dp[$i][$j] = $dp[$i - 1][$j - 1] + 1;
                $best = $dp[$i][$j] if $dp[$i][$j] > $best;
            }
        }
    }
    return $best;
}

print longest_common_substring("abcdef", "zabcz"), "\n";
print longest_common_substring("abc", "def"), "\n";
