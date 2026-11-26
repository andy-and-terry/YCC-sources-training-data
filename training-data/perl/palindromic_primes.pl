# Palindromic primes below 200; expect 10.
use strict; use warnings;
sub is_prime { my $n = shift; return 0 if $n < 2; for (my $d = 2; $d * $d <= $n; $d++) { return 0 unless $n % $d } 1 }
my @found = grep { $_ eq reverse($_) && is_prime($_) } 2 .. 199;
print "@found\n", scalar(@found), "\n";
