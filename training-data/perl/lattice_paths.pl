# Lattice paths with a DP row.
use strict; use warnings;
sub lattice { my $n = shift; my @row = (1) x ($n + 1); for (1 .. $n) { $row[$_] += $row[$_ - 1] for 1 .. $n } $row[$n] }
print lattice(3), "\n";
