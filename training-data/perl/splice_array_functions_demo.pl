use strict; use warnings;

my @a = (1 .. 10);
my @removed = splice(@a, 2, 3);
print "removed: @removed; left: @a\n";
splice(@a, 1, 0, 'x', 'y');
print "@a\n";
my @r = reverse @a;
print "@r\n";
my ($first, @rest) = @a;
print "first=$first rest=", scalar(@rest), "\n";
print "last index: $#a\n";
print join(",", grep { !/\D/ } @a), "\n";
