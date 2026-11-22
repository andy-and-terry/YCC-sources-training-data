use strict; use warnings;
# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
print join(" ", map { $_ * ($_ + 1) / 2 + 1 } 0 .. 9), "\n";
