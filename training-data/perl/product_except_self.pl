use strict;
use warnings;

sub product_except_self {
    my @a = @_;
    my @out = (1) x @a;
    $out[$_] = $out[$_ - 1] * $a[$_ - 1] for 1 .. $#a;
    my $suffix = 1;
    for my $i (reverse 0 .. $#a) {
        $out[$i] *= $suffix;
        $suffix *= $a[$i];
    }
    return @out;
}

printf "[%s] -> [%s]\n", "@$_", join(' ', product_except_self(@$_)) for [1, 2, 3, 4], [-1, 1, 0, -3, 3], [5, 7];
