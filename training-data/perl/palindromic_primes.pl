use strict;
use warnings;

sub is_prime {
    my ($n) = @_;
    return 0 if $n < 2;
    for (my $i = 2; $i * $i <= $n; $i++) {
        return 0 if $n % $i == 0;
    }
    return 1;
}

print join(" ", grep { $_ eq reverse($_) && is_prime($_) } 2 .. 199), "\n";
# 2 3 5 7 11 101 131 151 181 191
