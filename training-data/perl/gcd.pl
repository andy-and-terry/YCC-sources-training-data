use strict;
use warnings;

sub gcd {
    my ($a, $b) = @_;
    while ($b != 0) {
        ($a, $b) = ($b, $a % $b);
    }
    return $a;
}

print gcd(48, 18), "\n";
print gcd(100, 75), "\n";
