use strict; use warnings;
my @a = (1 .. 6);
my @r = splice(@a, 1, 2, 'x', 'y', 'z');
print "@a | @r\n";
print join(",", reverse @a), " ", scalar(@a), "\n";
