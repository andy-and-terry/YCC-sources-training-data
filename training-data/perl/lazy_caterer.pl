use strict; use warnings;
sub pieces { my $c = shift; ($c * $c + $c + 2) / 2 }
print join(" ", map { pieces($_) } 0 .. 9), "\n"; # 1 2 4 7 11 16 22 29 37 46
