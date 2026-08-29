use strict;
use warnings;

sub to_roman {
    my $n = shift;
    my @values = (1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1);
    my @symbols = ('M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I');
    my $result = '';
    for my $i (0 .. $#values) {
        while ($n >= $values[$i]) {
            $result .= $symbols[$i];
            $n -= $values[$i];
        }
    }
    return $result;
}

print to_roman(1994), "\n";
