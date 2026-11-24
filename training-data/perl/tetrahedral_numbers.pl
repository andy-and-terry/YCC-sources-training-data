use strict;
use warnings;

# Tetrahedral numbers: n(n+1)(n+2)/6.
print join(" ", map { $_ * ($_ + 1) * ($_ + 2) / 6 } 1 .. 10), "\n";
