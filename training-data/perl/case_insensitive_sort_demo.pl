use strict;
use warnings;

my @names = qw(banana Apple cherry apple Banana date);

print "default: @{[ sort @names ]}\n";
print "case-insensitive: @{[ sort { lc $a cmp lc $b } @names ]}\n";
print "ci then original: @{[ sort { lc $a cmp lc $b or $a cmp $b } @names ]}\n";
print "by length: @{[ sort { length $a <=> length $b or $a cmp $b } @names ]}\n";
print "reverse: @{[ sort { $b cmp $a } @names ]}\n";
