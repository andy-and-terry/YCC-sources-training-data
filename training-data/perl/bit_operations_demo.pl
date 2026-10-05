use strict;
use warnings;

my ($a, $b) = (12, 10);
printf "and: %d, or: %d, xor: %d\n", $a & $b, $a | $b, $a ^ $b;
printf "shl: %d, shr: %d\n", $a << 2, $a >> 1;
printf "not (8 bit): %d\n", ~$a & 0xFF;
printf "binary: %b, hex: %x, octal: %o\n", $a, 255, 8;

sub popcount { my $n = shift; my $c = 0; while ($n) { $c += $n & 1; $n >>= 1 } $c }
print "popcount(255) = ", popcount(255), "\n";
print "is power of two: ", (64 & 63) == 0 ? "yes" : "no", "\n";
print "from binary: ", oct("0b1101"), "\n";
