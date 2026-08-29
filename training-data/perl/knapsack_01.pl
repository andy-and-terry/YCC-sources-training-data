use strict;
use warnings;

sub knapsack {
    my ($weights, $values, $capacity) = @_;
    my @dp = (0) x ($capacity + 1);
    for my $i (0 .. $#$weights) {
        for (my $cap = $capacity; $cap >= $weights->[$i]; $cap--) {
            my $with_item = $dp[$cap - $weights->[$i]] + $values->[$i];
            $dp[$cap] = $with_item if $with_item > $dp[$cap];
        }
    }
    return $dp[$capacity];
}

print knapsack([2, 3, 4, 5], [3, 4, 5, 6], 5), "\n";
