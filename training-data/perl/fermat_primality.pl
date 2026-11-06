use strict;
use warnings;

# Fermat primality test; Carmichael number 561 fools it.
sub powmod {
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

sub probably_prime { my $n = shift; return $n > 2 && powmod(2, $n - 1, $n) == 1 }

printf "%d %s\n", $_, probably_prime($_) ? "true" : "false" for 97, 91, 561;
