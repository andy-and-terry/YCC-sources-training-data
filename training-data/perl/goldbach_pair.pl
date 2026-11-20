# Goldbach pair.
use strict; use warnings;
sub is_prime { my $n = shift; return 0 if $n < 2; for (my $d = 2; $d * $d <= $n; $d++) { return 0 unless $n % $d } 1 }
sub goldbach { my $n = shift; for my $p (2 .. $n / 2) { return ($p, $n - $p) if is_prime($p) && is_prime($n - $p) } }
print join("+", goldbach(28)), "\n";
