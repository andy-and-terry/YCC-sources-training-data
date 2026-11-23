use strict;
use warnings;

# n(2n^2+1)/3
sub term {
    my ($n) = @_;
    return int(($n * (((2 * $n) * $n) + 1)) / 3);
}

printf "%2d -> %d\n", $_, term($_) for 1 .. 15;
