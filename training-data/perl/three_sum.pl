use strict;
use warnings;

sub three_sum {
    my (@nums) = @_;
    my @arr = sort { $a <=> $b } @nums;
    my $n = scalar(@arr);
    my @results;
    for (my $i = 0; $i < $n - 2; $i++) {
        next if $i > 0 && $arr[$i] == $arr[$i - 1];
        my ($left, $right) = ($i + 1, $n - 1);
        while ($left < $right) {
            my $total = $arr[$i] + $arr[$left] + $arr[$right];
            if ($total == 0) {
                push @results, [$arr[$i], $arr[$left], $arr[$right]];
                $left++;
                $right--;
                $left++ while $left < $right && $arr[$left] == $arr[$left - 1];
                $right-- while $left < $right && $arr[$right] == $arr[$right + 1];
            } elsif ($total < 0) {
                $left++;
            } else {
                $right--;
            }
        }
    }
    return @results;
}

for my $triple (three_sum(-1, 0, 1, 2, -1, -4)) {
    print join(",", @$triple), "\n";
}
