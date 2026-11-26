# Primorials up to 1e6, including 1; expect 8.
use strict; use warnings;
sub is_prime { my $n = shift; return 0 if $n < 2; for (my $d = 2; $d * $d <= $n; $d++) { return 0 unless $n % $d } 1 }
my @v = (1);
my $acc = 1;
for (my $p = 2; ; $p++) {
    next unless is_prime($p);
    $acc *= $p;
    last if $acc > 1_000_000;
    push @v, $acc;
}
print scalar(@v), "\n@v\n";
