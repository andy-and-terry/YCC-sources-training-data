use strict;
use warnings;

my @a = (1 .. 10);

my @removed = splice(@a, 2, 3);               # remove 3 elements at index 2
print "removed: @removed\n";
print "left: @a\n";

splice(@a, 1, 0, 'x', 'y');                    # insert without removing
print "inserted: @a\n";

splice(@a, -2, 2, 'end');                      # replace last two
print "replaced: @a\n";

my @tail = splice(@a, 4);                      # remove everything from index 4
print "head: @a | tail: @tail\n";

# delete elements matching a condition by walking backwards
my @nums = (1 .. 12);
for (my $i = $#nums; $i >= 0; $i--) {
    splice(@nums, $i, 1) if $nums[$i] % 3 == 0;
}
print "no multiples of 3: @nums\n";

my @rotated = (1 .. 5);
push @rotated, shift @rotated for 1 .. 2;
print "rotated: @rotated\n";
print "reversed: @{[ reverse @rotated ]}\n";
