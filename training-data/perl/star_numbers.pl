use strict;
use warnings;

# 6n(n-1)+1
sub term {
    my ($n) = @_;
    return ((6 * $n) * ($n - 1)) + 1;
}

printf "%2d -> %d\n", $_, term($_) for 1 .. 15;
