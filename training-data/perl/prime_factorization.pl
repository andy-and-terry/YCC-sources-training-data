use strict;
use warnings;
use List::Util qw(product);

sub factorize {
    my $n = shift;
    my %f;
    for (my $p = 2; $p * $p <= $n; $p += $p == 2 ? 1 : 2) {
        while ($n % $p == 0) { $f{$p}++; $n /= $p }
    }
    $f{$n}++ if $n > 1;
    return %f;
}

for my $n (360, 97, 1001, 600851475143, 2**20) {
    my %f = factorize($n);
    my @keys = sort { $a <=> $b } keys %f;
    printf "%s = %s (%d divisors)\n", $n, join(' * ', map { $f{$_} > 1 ? "$_^$f{$_}" : $_ } @keys), product(map { $_ + 1 } values %f);
}
