use strict; use warnings;
sub is_prime { my $n = shift; return 0 if $n < 2; for (my $i = 2; $i * $i <= $n; $i++) { return 0 if $n % $i == 0 } 1 }
my @found;
for (my $p = 2; @found < 10; $p++) {
    push @found, $p if is_prime($p) && is_prime(2 * $p + 1);
}
print "@found\n"; # 2 3 5 11 23 29 41 53 83 89
