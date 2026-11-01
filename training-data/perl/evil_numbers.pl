use strict;
use warnings;

# Evil numbers have an even number of 1 bits.
my @evil = grep { (sprintf("%b", $_) =~ tr/1//) % 2 == 0 } 0 .. 20;
print "@evil\n";
