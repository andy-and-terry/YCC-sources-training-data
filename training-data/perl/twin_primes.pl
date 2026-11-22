use strict; use warnings;
# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
sub is_prime {
    my $n = shift;
    return 0 if $n < 2;
    for (my $d = 2; $d * $d <= $n; $d++) { return 0 if $n % $d == 0 }
    return 1;
}
my @out = grep { is_prime($_) && is_prime($_ + 2) } 2 .. 99;
print "@out\n";
