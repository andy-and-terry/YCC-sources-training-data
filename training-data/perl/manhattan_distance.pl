# Manhattan distance of two vectors.
use strict; use warnings;
sub manhattan { my ($a, $b) = @_; my $s = 0; $s += abs($a->[$_] - $b->[$_]) for 0 .. $#$a; $s }
print manhattan([1, 2], [4, 6]), "\n";
