use strict; use warnings;
# Reinterpret binary digits as base-4 digits.
sub moser_de_bruijn {
    my $i = shift;
    my ($value, $power) = (0, 1);
    while ($i > 0) { $value += $power if $i & 1; $power *= 4; $i >>= 1 }
    return $value;
}
print join(" ", map { moser_de_bruijn($_) } 0 .. 9), "\n"; # 0 1 4 5 16 17 20 21 64 65
