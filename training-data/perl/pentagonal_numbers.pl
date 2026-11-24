use strict;
use warnings;

# Pentagonal numbers: n(3n-1)/2.
print join(" ", map { $_ * (3 * $_ - 1) / 2 } 1 .. 10), "\n";
