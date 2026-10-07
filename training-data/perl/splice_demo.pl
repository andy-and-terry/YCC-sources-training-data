use strict;
use warnings;

my @a = (1 .. 10);
my @removed = splice(@a, 2, 3);
print "removed: @removed\n";
print "left: @a\n";

splice(@a, 1, 0, 'x', 'y');
print "inserted: @a\n";

splice(@a, -2);
print "trimmed: @a\n";

splice(@a, 1, 2, 'Z');
print "replaced: @a\n";

my @rev = reverse @a;
print "reversed: @rev\n";
print "last index: $#a, count: ", scalar(@a), "\n";
