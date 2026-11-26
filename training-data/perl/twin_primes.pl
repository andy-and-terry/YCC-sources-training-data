# Twin primes below 100; expect 8.
use strict; use warnings;
sub is_prime { my $n = shift; return 0 if $n < 2; for (my $d = 2; $d * $d <= $n; $d++) { return 0 unless $n % $d } 1 }
my $c = 0;
for my $p (2 .. 99) { $c++ if is_prime($p) && is_prime($p + 2) }
print "$c\n";
