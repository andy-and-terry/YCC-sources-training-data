use strict;
use warnings;

sub extended_gcd {
    my ($a, $b) = @_;
    return ($a, 1, 0) if $b == 0;
    my ($g, $x1, $y1) = extended_gcd($b, $a % $b);
    return ($g, $y1, $x1 - int($a / $b) * $y1);
}

my ($g, $x, $y) = extended_gcd(240, 46);
print "gcd=$g x=$x y=$y\n";
print "check=" . (240 * $x + 46 * $y) . "\n";
