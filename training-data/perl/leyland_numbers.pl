use strict;
use warnings;

# Leyland numbers: x**y + y**x for x >= y >= 2.
my @vals;
for my $x (2 .. 4) {
    for my $y (2 .. $x) {
        push @vals, $x**$y + $y**$x;
    }
}
print "@vals\n";
