use strict; use warnings;
# Emirps: primes whose digit reversal is a different prime.
sub is_prime {
    my $n = shift;
    return 0 if $n < 2;
    for (my $d = 2; $d * $d <= $n; $d++) { return 0 if $n % $d == 0 }
    return 1;
}
my @out = grep { my $r = reverse $_; $r != $_ && is_prime($_) && is_prime($r) } 2 .. 199;
print "@out\n";
