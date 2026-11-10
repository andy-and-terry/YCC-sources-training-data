use strict; use warnings;
sub sigma { my $n = shift; my $s = 0; $n % $_ or $s += $_ for 1 .. $n; $s }
print join(" ", grep { sigma(sigma($_)) == 2 * $_ } 1 .. 99), "\n"; # 2 4 16 64
