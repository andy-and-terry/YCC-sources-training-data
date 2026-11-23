use strict;
use warnings;

# n(n+1)(n+2)(n+3)/24
sub term {
    my ($n) = @_;
    return int(((($n * ($n + 1)) * ($n + 2)) * ($n + 3)) / 24);
}

printf "%2d -> %d\n", $_, term($_) for 1 .. 15;
