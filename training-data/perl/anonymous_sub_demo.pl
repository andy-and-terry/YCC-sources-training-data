use strict;
use warnings;

my $square = sub { return $_[0] * $_[0]; };
my @numbers = (1, 2, 3, 4, 5);
my @squares = map { $square->($_) } @numbers;
print "@squares\n";
