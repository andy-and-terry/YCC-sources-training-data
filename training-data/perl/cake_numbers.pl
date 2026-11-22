use strict; use warnings;
# Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
print join(" ", map { ($_**3 + 5 * $_ + 6) / 6 } 0 .. 9), "\n";
