use strict; use warnings;
# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
sub is_practical {
    my $n = shift;
    my $reach = 1;    # bit i set <=> i is a subset sum
    for my $d (1 .. $n) { $reach |= $reach << $d if $n % $d == 0 }
    my $mask = (1 << ($n + 1)) - 1;
    return ($reach & $mask) == $mask;
}
my @out = grep { is_practical($_) } 1 .. 40;
print "@out\n";
