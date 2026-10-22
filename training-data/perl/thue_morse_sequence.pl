use strict;
use warnings;

# Thue-Morse: t(n) is the parity of the number of 1 bits in n
my $out = '';
for my $n (0 .. 31) {
    my $ones = sprintf('%b', $n) =~ tr/1//;
    $out .= $ones % 2;
}
print "$out\n";
