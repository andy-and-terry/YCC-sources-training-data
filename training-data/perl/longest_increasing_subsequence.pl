use strict;
use warnings;

sub longest_increasing_subsequence {
    my (@nums) = @_;
    return 0 unless @nums;
    my @dp = (1) x scalar(@nums);
    for my $i (1 .. $#nums) {
        for my $j (0 .. $i - 1) {
            if ($nums[$j] < $nums[$i] && $dp[$j] + 1 > $dp[$i]) {
                $dp[$i] = $dp[$j] + 1;
            }
        }
    }
    my $max = 0;
    for my $v (@dp) {
        $max = $v if $v > $max;
    }
    return $max;
}

my @nums = (10, 9, 2, 5, 3, 7, 101, 18);
print longest_increasing_subsequence(@nums), "\n";
