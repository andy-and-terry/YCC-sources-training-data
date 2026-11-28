use strict;
use warnings;

sub popcount {
    my $n = shift;
    my $c = 0;
    while ($n) {
        $n &= $n - 1;
        $c++;
    }
    return $c;
}

print popcount(0b10110111), " ", unpack("%32b*", pack("N", 0b10110111)), "\n";
