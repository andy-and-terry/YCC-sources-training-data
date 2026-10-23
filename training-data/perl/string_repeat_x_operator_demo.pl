use strict;
use warnings;

print "-" x 20, "\n";
my @row = (0) x 5;
print "@row\n";
my @pairs = map { [ (".") x 3 ] } 1 .. 2;
print join(" ", @$_), "\n" for @pairs;
