use strict;
use warnings;
use List::Util qw(max);

sub chebyshev {
    my ($a, $b) = @_;
    return max(map { abs($a->[$_] - $b->[$_]) } 0 .. $#$a);
}

print chebyshev([1, 2], [4, 6]), "\n";
