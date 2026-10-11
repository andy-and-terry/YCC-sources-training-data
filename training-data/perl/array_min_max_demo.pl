use strict;
use warnings;

my @nums = (42, 7, 19, 88, 3, 56);

my ($min, $max) = ($nums[0]) x 2;
for my $n (@nums) {
    $min = $n if $n < $min;
    $max = $n if $n > $max;
}
print "min=$min max=$max\n";

my @sorted = sort { $a <=> $b } @nums;
print "via sort: $sorted[0] $sorted[-1]\n";

my ($idx_of_max) = sort { $nums[$b] <=> $nums[$a] } 0 .. $#nums;
print "index of max: $idx_of_max\n";

my $total = 0;
$total += $_ for @nums;
printf "mean: %.2f\n", $total / @nums;
