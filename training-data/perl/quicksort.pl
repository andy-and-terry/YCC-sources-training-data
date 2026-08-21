use strict;
use warnings;

sub quicksort {
    my @items = @_;
    return @items if @items <= 1;
    my $pivot = $items[int(@items / 2)];
    my @left = grep { $_ < $pivot } @items;
    my @mid = grep { $_ == $pivot } @items;
    my @right = grep { $_ > $pivot } @items;
    return (quicksort(@left), @mid, quicksort(@right));
}

print join(" ", quicksort(5, 3, 8, 1, 9, 2)), "\n";
