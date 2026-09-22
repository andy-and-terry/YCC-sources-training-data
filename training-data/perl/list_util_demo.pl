use strict;
use warnings;
use List::Util qw(sum0 max min first reduce);

my @numbers = (4, 9, 1, 7, 3);

print "sum: ", sum0(@numbers), "\n";
print "max: ", max(@numbers), "\n";
print "min: ", min(@numbers), "\n";

my $first_even = first { $_ % 2 == 0 } @numbers;
print "first even: $first_even\n";

my $product = reduce { $a * $b } @numbers;
print "product: $product\n";
