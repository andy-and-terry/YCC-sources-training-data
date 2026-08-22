use strict;
use warnings;

sub is_prime {
    my ($n) = @_;
    return 0 if $n < 2;
    for my $i (2 .. int(sqrt($n))) {
        return 0 if $n % $i == 0;
    }
    return 1;
}

print join(" ", grep { is_prime($_) } (2 .. 20)), "\n";
