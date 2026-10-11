use strict;
use warnings;

my $sentence = "the quick brown fox";

print join(" ", reverse split / /, $sentence), "\n";
print join(" ", map { scalar reverse } split / /, $sentence), "\n";
print scalar reverse($sentence), "\n";

my %len;
$len{$_} = length for split / /, $sentence;
my ($longest) = sort { $len{$b} <=> $len{$a} || $a cmp $b } keys %len;
print "longest word: $longest\n";
