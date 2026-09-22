use strict;
use warnings;

sub lcs {
    my ($a, $b) = @_;
    my $m = length $a;
    my $n = length $b;
    my @dp;
    for my $i (0 .. $m) {
        for my $j (0 .. $n) {
            $dp[$i][$j] = 0;
        }
    }
    for my $i (1 .. $m) {
        for my $j (1 .. $n) {
            if (substr($a, $i - 1, 1) eq substr($b, $j - 1, 1)) {
                $dp[$i][$j] = $dp[$i - 1][$j - 1] + 1;
            }
            else {
                $dp[$i][$j] = $dp[$i - 1][$j] > $dp[$i][$j - 1] ? $dp[$i - 1][$j] : $dp[$i][$j - 1];
            }
        }
    }

    my $result = "";
    my ($i, $j) = ($m, $n);
    while ($i > 0 && $j > 0) {
        if (substr($a, $i - 1, 1) eq substr($b, $j - 1, 1)) {
            $result = substr($a, $i - 1, 1) . $result;
            $i--;
            $j--;
        }
        elsif ($dp[$i - 1][$j] >= $dp[$i][$j - 1]) {
            $i--;
        }
        else {
            $j--;
        }
    }
    return $result;
}

my $result = lcs("ABCBDAB", "BDCABA");
print "$result (length ", length($result), ")\n";
