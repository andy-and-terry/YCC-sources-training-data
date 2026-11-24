use strict;
use warnings;

# Hexagonal numbers: n(2n-1).
print join(" ", map { $_ * (2 * $_ - 1) } 1 .. 10), "\n";
