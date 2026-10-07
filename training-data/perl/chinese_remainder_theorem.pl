use strict;
use warnings;

sub mod_inverse {
    my ($a, $m) = @_;
    for my $x (0 .. $m - 1) {
        return $x if (($a % $m) * $x) % $m == 1;
    }
    return 0;
}

sub chinese_remainder {
    my ($remainders, $moduli) = @_;
    my $prod = 1;
    $prod *= $_ for @$moduli;
    my $x = 0;
    for my $i (0 .. $#$moduli) {
        my $pp = $prod / $moduli->[$i];
        $x += $remainders->[$i] * $pp * mod_inverse($pp, $moduli->[$i]);
    }
    return (($x % $prod) + $prod) % $prod;
}

# x = 2 mod 3, x = 3 mod 5, x = 2 mod 7 -> x = 23
print chinese_remainder([2, 3, 2], [3, 5, 7]), "\n";
