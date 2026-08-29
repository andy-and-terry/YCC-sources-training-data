use strict;
use warnings;

sub merge_arrays {
    my ($left, $right) = @_;
    my @result;
    my ($i, $j) = (0, 0);
    while ($i < @$left && $j < @$right) {
        if ($left->[$i] <= $right->[$j]) {
            push @result, $left->[$i++];
        } else {
            push @result, $right->[$j++];
        }
    }
    push @result, @$left[$i .. $#$left] if $i <= $#$left;
    push @result, @$right[$j .. $#$right] if $j <= $#$right;
    return @result;
}

sub merge_sort {
    my @items = @_;
    return @items if @items <= 1;
    my $mid = int(@items / 2);
    my @left = merge_sort(@items[0 .. $mid - 1]);
    my @right = merge_sort(@items[$mid .. $#items]);
    return merge_arrays(\@left, \@right);
}

print join(" ", merge_sort(5, 2, 9, 1, 5, 6)), "\n";
