use strict;
use warnings;

my $text = "the quick brown fox jumps over the lazy dog";

print "first 'the' at: ", index($text, "the"), "\n";
print "second 'the' at: ", index($text, "the", 1), "\n";
print "last 'o' at: ", rindex($text, "o"), "\n";
print "missing: ", index($text, "cat"), "\n";

print "substr(4,5): ", substr($text, 4, 5), "\n";
print "substr(-8): ", substr($text, -8), "\n";

my $copy = $text;
substr($copy, 4, 5) = "slow";
print "lvalue substr: $copy\n";

substr($copy, 0, 3, "A");
print "4-arg substr: $copy\n";
