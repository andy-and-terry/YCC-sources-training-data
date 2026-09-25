use strict;
use warnings;

sub pair_with_sum {
    my ($nums, $target) = @_;
    my ($i, $j) = (0, $#$nums);
    while ($i < $j) {
        my $s = $nums->[$i] + $nums->[$j];
        return ($i, $j) if $s == $target;
        $s < $target ? $i++ : $j--;
    }
    return;
}

my @p = pair_with_sum([1, 3, 4, 6, 8, 11], 10);
print "@p\n";
print scalar(my @none = pair_with_sum([1, 2, 3], 100)), "\n";
