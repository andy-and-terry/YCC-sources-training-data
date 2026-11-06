use strict;
use warnings;

# Amicable pairs: d(a) == b and d(b) == a with a != b.
sub d {
    my $n = shift;
    my $s = 0;
    for my $i (1 .. $n - 1) { $s += $i unless $n % $i }
    return $s;
}

for my $a (2 .. 1499) {
    my $b = d($a);
    print "$a $b\n" if $b > $a && d($b) == $a;
}
