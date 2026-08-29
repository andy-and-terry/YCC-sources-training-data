use strict;
use warnings;

sub my_gcd {
    my ($a, $b) = @_;
    while ($b != 0) {
        ($a, $b) = ($b, $a % $b);
    }
    return abs($a);
}

sub my_lcm {
    my ($a, $b) = @_;
    return abs($a * $b) / my_gcd($a, $b);
}

print my_gcd(48, 18), "\n";
print my_lcm(4, 6), "\n";
