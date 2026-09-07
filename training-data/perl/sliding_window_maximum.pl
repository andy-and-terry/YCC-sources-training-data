use strict;
use warnings;

sub sliding_window_maximum {
    my ($arr, $k) = @_;
    my @deque;
    my @result;
    for my $i (0 .. $#$arr) {
        shift @deque while @deque && $deque[0] <= $i - $k;
        pop @deque while @deque && $arr->[$deque[-1]] <= $arr->[$i];
        push @deque, $i;
        push @result, $arr->[$deque[0]] if $i >= $k - 1;
    }
    return @result;
}

my @nums = (1, 3, -1, -3, 5, 3, 6, 7);
print join(" ", sliding_window_maximum(\@nums, 3)), "\n";
