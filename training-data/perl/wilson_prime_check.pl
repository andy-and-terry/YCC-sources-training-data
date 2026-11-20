# Wilson's theorem primality.
use strict; use warnings;
sub wilson { my $n = shift; return 0 if $n < 2; my $f = 1; $f = $f * $_ % $n for 2 .. $n - 1; $f == $n - 1 }
print join(" ", grep { wilson($_) } 2 .. 19), "\n";
