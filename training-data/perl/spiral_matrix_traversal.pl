use strict;
use warnings;

sub spiral_order {
    my ($matrix) = @_;
    my @result;
    return @result unless @$matrix;
    my ($top, $bottom) = (0, scalar(@$matrix) - 1);
    my ($left, $right) = (0, scalar(@{ $matrix->[0] }) - 1);
    while ($top <= $bottom && $left <= $right) {
        push @result, $matrix->[$top][$_] for $left .. $right;
        $top++;
        push @result, $matrix->[$_][$right] for $top .. $bottom;
        $right--;
        if ($top <= $bottom) {
            push @result, $matrix->[$bottom][$_] for reverse $left .. $right;
            $bottom--;
        }
        if ($left <= $right) {
            push @result, $matrix->[$_][$left] for reverse $top .. $bottom;
            $left++;
        }
    }
    return @result;
}

my @matrix = ([1, 2, 3], [4, 5, 6], [7, 8, 9]);
print join(" ", spiral_order(\@matrix)), "\n";
