use strict;
use warnings;

# Fibbinary numbers: no two adjacent 1 bits.
print join(" ", grep { ($_ & ($_ >> 1)) == 0 } 0 .. 49), "\n";
