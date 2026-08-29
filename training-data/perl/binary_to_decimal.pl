use strict;
use warnings;

sub binary_to_decimal {
    my $s = shift;
    return oct("0b$s");
}

print binary_to_decimal("1011"), "\n";
