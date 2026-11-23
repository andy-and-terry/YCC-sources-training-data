use strict;
use warnings;

# n(n+1)/2+1
sub term {
    my ($n) = @_;
    return int(($n * ($n + 1)) / 2) + 1;
}

printf "%2d -> %d\n", $_, term($_) for 1 .. 15;
