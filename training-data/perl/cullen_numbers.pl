use strict;
use warnings;

# Cullen numbers: n * 2^n + 1
print join(" ", map { $_ * 2**$_ + 1 } 0 .. 9), "\n";
