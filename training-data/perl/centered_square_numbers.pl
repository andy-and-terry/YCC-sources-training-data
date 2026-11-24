use strict;
use warnings;

# Centered square numbers: n^2 + (n+1)^2.
print join(" ", map { $_**2 + ($_ + 1)**2 } 0 .. 9), "\n";
