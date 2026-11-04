use strict; use warnings;
use List::Util qw(reduce);

sub gcd { my ($a, $b) = @_; ($a, $b) = ($b, $a % $b) while $b; return abs $a }

sub gcd_all { return reduce { gcd($a, $b) } 0, @_ }

print gcd_all(12, 18, 24), "\n";
print gcd_all(7, 13), "\n";
