use strict;
use warnings;

# Integer (1..3999) to Roman numeral using a greedy table.
my @table = (
    [1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'], [100, 'C'], [90, 'XC'],
    [50, 'L'], [40, 'XL'], [10, 'X'], [9, 'IX'], [5, 'V'], [4, 'IV'], [1, 'I'],
);

sub to_roman {
    my $n = shift;
    my $out = '';
    for my $pair (@table) {
        my ($value, $symbol) = @$pair;
        while ($n >= $value) { $out .= $symbol; $n -= $value }
    }
    return $out;
}

print to_roman(1994), " ", to_roman(58), "\n";
