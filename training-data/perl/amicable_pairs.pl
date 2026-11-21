use strict;
use warnings;

# Amicable pairs below 1500 via sums of proper divisors.
sub sum_div {
    my $n = shift;
    my $t = 0;
    for my $d (1 .. $n - 1) { $t += $d if $n % $d == 0 }
    return $t;
}

for my $a (2 .. 1499) {
    my $b = sum_div($a);
    print "$a $b\n" if $b > $a && sum_div($b) == $a;
}
