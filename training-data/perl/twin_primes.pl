# Twin primes below 50.
use strict; use warnings;
my @sieve = (1) x 53; @sieve[0, 1] = (0, 0);
for my $i (2 .. 7) { next unless $sieve[$i]; for (my $j = $i * $i; $j <= 52; $j += $i) { $sieve[$j] = 0 } }
for my $p (2 .. 50) { print "($p,", $p + 2, ") " if $sieve[$p] && $sieve[$p + 2] }
print "\n";
