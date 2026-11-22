use strict; use warnings;
# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
sub fact { my $n = shift; my $f = 1; $f *= $_ for 2 .. $n; $f }
sub comb { my ($n, $k) = @_; fact($n) / (fact($k) * fact($n - $k)) }
my $n = 5;
print join(" ", map { comb($n - 1, $_ - 1) * fact($n) / fact($_) } 1 .. $n), "\n";
