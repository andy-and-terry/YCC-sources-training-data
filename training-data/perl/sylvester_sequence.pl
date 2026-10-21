use strict;
use warnings;
use Math::BigInt;

# Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
my $s = Math::BigInt->new(2);
for my $i (0 .. 7) {
    print "s($i) = $s\n";
    $s = $s * $s - $s + 1;
}
