# Circular primes below 100; expect 13.
use strict; use warnings;
sub is_prime { my $n = shift; return 0 if $n < 2; for (my $d = 2; $d * $d <= $n; $d++) { return 0 unless $n % $d } 1 }
sub circular {
    my $s = shift;
    for my $i (0 .. length($s) - 1) {
        return 0 unless is_prime(substr($s, $i) . substr($s, 0, $i));
    }
    return 1;
}
my $c = grep { circular($_) } 2 .. 99;
print "$c\n";
