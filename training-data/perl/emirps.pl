# Emirps below 200; expect 15.
use strict; use warnings;
sub is_prime { my $n = shift; return 0 if $n < 2; for (my $d = 2; $d * $d <= $n; $d++) { return 0 unless $n % $d } 1 }
my @e = grep { my $r = reverse $_; $r != $_ && is_prime($_) && is_prime($r) } 2 .. 199;
print scalar(@e), "\n@e\n";
