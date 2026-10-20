use strict;
use warnings;
use List::Util qw(sum sum0 min max first reduce shuffle uniq any all none pairs);

my @n = (4, 8, 15, 16, 23, 42);
print sum(@n), " ", min(@n), " ", max(@n), " ", sum0(), "\n";
print first { $_ > 10 } @n; print "\n";
print reduce { $a * $b } 1 .. 6; print "\n";
print join(",", uniq(1, 1, 2, 3, 3)), " ", (any { $_ == 15 } @n) ? "any" : "none", " ", (all { $_ > 0 } @n) ? "all" : "notall", "\n";
print join(";", map { "$_->[0]=$_->[1]" } pairs(a => 1, b => 2)), "\n";
