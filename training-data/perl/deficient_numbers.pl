# Deficient numbers below 100; expect 76.
use strict; use warnings;
sub proper_sum { my ($n, $t) = (shift, 0); for my $d (1 .. $n - 1) { $t += $d unless $n % $d } $t }
my $c = grep { proper_sum($_) < $_ } 1 .. 99;
print "$c\n";
