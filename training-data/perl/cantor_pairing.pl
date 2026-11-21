use strict;
use warnings;

# Cantor pairing function and its inverse.
sub pair { my ($x, $y) = @_; return ($x + $y) * ($x + $y + 1) / 2 + $y }

sub unpair {
    my $z = shift;
    my $w = int((sqrt(8 * $z + 1) - 1) / 2);
    my $y = $z - $w * ($w + 1) / 2;
    return ($w - $y, $y);
}

print pair(3, 4), "\n";
print join(" ", unpair(32)), "\n";
