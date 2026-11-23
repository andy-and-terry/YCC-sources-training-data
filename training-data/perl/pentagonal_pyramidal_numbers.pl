use strict;
use warnings;

# n^2(n+1)/2
sub term {
    my ($n) = @_;
    return int((($n * $n) * ($n + 1)) / 2);
}

printf "%2d -> %d\n", $_, term($_) for 1 .. 15;
