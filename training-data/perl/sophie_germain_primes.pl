use strict; use warnings;
# Sophie Germain primes: p prime and 2p + 1 prime.
sub is_prime {
    my $n = shift;
    return 0 if $n < 2;
    for (my $d = 2; $d * $d <= $n; $d++) { return 0 if $n % $d == 0 }
    return 1;
}
my @out = grep { is_prime($_) && is_prime(2 * $_ + 1) } 2 .. 99;
print "@out\n";
