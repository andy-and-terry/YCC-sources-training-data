use strict;
use warnings;

sub is_prime {
    my $n = shift;
    return 0 if $n < 2;
    for (my $d = 2; $d * $d <= $n; $d++) {
        return 0 if $n % $d == 0;
    }
    return 1;
}

# Pernicious numbers: the popcount is prime.
sub popcount { my $bits = sprintf("%b", shift); return ($bits =~ tr/1//); }

print join(" ", grep { is_prime(popcount($_)) } 1 .. 20), "\n";
