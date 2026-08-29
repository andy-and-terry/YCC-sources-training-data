use strict;
use warnings;

sub kadane {
    my @items = @_;
    my $best = $items[0];
    my $current = $items[0];
    for my $i (1 .. $#items) {
        $current = $items[$i] > $current + $items[$i] ? $items[$i] : $current + $items[$i];
        $best = $current if $current > $best;
    }
    return $best;
}

print kadane(-2, 1, -3, 4, -1, 2, 1, -5, 4), "\n";
