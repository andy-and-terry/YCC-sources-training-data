use strict;
use warnings;

my @words = qw(pear fig banana kiwi apple);
my @by_len = sort { length($a) <=> length($b) or $a cmp $b } @words;
print "@by_len\n";
my @sorted = map { $_->[1] } sort { $a->[0] <=> $b->[0] } map { [length, $_] } @words;
print "@sorted\n";
my %score = (al => 3, bo => 9, cy => 5);
print join(",", sort { $score{$b} <=> $score{$a} } keys %score), "\n";
print join(",", reverse sort { $a <=> $b } (10, 9, 100, 1)), "\n";
