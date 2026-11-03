use strict;
use warnings;

my $sum = 0;
my @tri = map { $sum += $_ } 1 .. 10;
print "@tri\n";
