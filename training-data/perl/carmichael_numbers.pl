use strict;
use warnings;

# Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
sub gcd { my ($a, $b) = @_; ($a, $b) = ($b, $a % $b) while $b; return $a }

sub pow_mod {
    my ($b, $e, $m) = @_;
    my $r = 1;
    $b %= $m;
    while ($e > 0) {
        $r = $r * $b % $m if $e & 1;
        $b = $b * $b % $m;
        $e >>= 1;
    }
    return $r;
}

sub is_prime {
    my $n = shift;
    for (my $p = 2; $p * $p <= $n; $p++) { return 0 if $n % $p == 0 }
    return $n > 1;
}

sub is_carmichael {
    my $n = shift;
    return 0 if is_prime($n);
    for my $a (2 .. $n - 1) {
        return 0 if gcd($a, $n) == 1 && pow_mod($a, $n - 1, $n) != 1;
    }
    return 1;
}

print join(" ", grep { is_carmichael($_) } map { 2 * $_ + 1 } 1 .. 1499), "\n";
