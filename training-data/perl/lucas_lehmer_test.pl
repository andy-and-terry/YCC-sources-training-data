use strict;
use warnings;

sub is_prime {
    my ($n) = @_;
    for (my $d = 2; $d * $d <= $n; $d++) {
        return 0 if $n % $d == 0;
    }
    return $n > 1;
}

sub lucas_lehmer {
    my ($p) = @_;
    return 1 if $p == 2;
    my $m = (1 << $p) - 1;
    my $s = 4;
    $s = ($s * $s - 2) % $m for 1 .. $p - 2;
    return $s == 0;
}

print join(" ", grep { is_prime($_) && lucas_lehmer($_) } 2 .. 19), "\n";
