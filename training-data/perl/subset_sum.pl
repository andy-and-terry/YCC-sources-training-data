use strict;
use warnings;

sub subset_sum {
    my ($nums, $target) = @_;
    my @dp = (1, (0) x $target);
    for my $num (@$nums) {
        for (my $s = $target; $s >= $num; $s--) {
            $dp[$s] ||= $dp[$s - $num];
        }
    }
    return $dp[$target] ? 1 : 0;
}

my @nums = (3, 34, 4, 12, 5, 2);
print subset_sum(\@nums, 9), "\n";
print subset_sum(\@nums, 10), "\n";
print subset_sum(\@nums, 22), "\n";
