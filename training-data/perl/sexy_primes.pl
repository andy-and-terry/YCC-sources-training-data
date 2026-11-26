# Sexy primes below 100; expect 16 pairs.
use strict; use warnings;
sub is_prime { my $n = shift; return 0 if $n < 2; for (my $d = 2; $d * $d <= $n; $d++) { return 0 unless $n % $d } 1 }
my $c = grep { is_prime($_) && is_prime($_ + 6) } 2 .. 99;
print "$c\n";
