use strict;
use warnings;

# Woodall numbers: n * 2^n - 1
print join(" ", map { $_ * 2**$_ - 1 } 1 .. 10), "\n";
