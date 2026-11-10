use strict; use warnings;
sub cake { my $n = shift; ($n**3 + 5 * $n + 6) / 6 }
print join(" ", map { cake($_) } 0 .. 9), "\n"; # 1 2 4 8 15 26 42 64 93 130
