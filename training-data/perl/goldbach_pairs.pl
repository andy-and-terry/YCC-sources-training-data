use strict;
use warnings;

sub is_prime {
    my $n = shift;
    return 0 if $n < 2;
    for (my $d = 2; $d * $d <= $n; $d++) { return 0 if $n % $d == 0 }
    return 1;
}

my $n = 28;
for my $p (2 .. $n / 2) {
    print "$p + ", $n - $p, "\n" if is_prime($p) && is_prime($n - $p);
}
