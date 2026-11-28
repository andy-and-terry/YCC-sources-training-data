use strict;
use warnings;
use List::Util qw(sum);

sub manhattan {
    my ($a, $b) = @_;
    return sum(map { abs($a->[$_] - $b->[$_]) } 0 .. $#$a);
}

print manhattan([1, 2], [4, 6]), "\n";
