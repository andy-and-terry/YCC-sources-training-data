use strict;
use warnings;

# Emirps: primes whose digit reversal is a different prime.
sub is_prime {
    my $n = shift;
    return 0 if $n < 2;
    for (my $i = 2; $i * $i <= $n; $i++) { return 0 unless $n % $i }
    return 1;
}

my @emirps = grep {
    my $r = reverse $_;
    $r != $_ && is_prime($_) && is_prime($r);
} 2 .. 99;
print "@emirps\n";
