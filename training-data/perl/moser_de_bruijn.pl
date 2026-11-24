use strict;
use warnings;

# Moser-de Bruijn sequence: binary digits of n read in base 4.
sub moser {
    my ($n) = @_;
    my ($result, $place) = (0, 1);
    while ($n) {
        $result += $place if $n & 1;
        $n >>= 1;
        $place *= 4;
    }
    return $result;
}

print join(" ", map { moser($_) } 0 .. 11), "\n";
