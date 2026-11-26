# Goldbach partitions of 100; expect 6.
use strict; use warnings;
sub is_prime { my $n = shift; return 0 if $n < 2; for (my $d = 2; $d * $d <= $n; $d++) { return 0 unless $n % $d } 1 }
my @pairs = map { "$_+" . (100 - $_) } grep { is_prime($_) && is_prime(100 - $_) } 2 .. 50;
print scalar(@pairs), "\n@pairs\n";
