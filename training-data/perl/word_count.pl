use strict;
use warnings;

my $text = "the quick brown fox jumps over the lazy dog the fox runs";
my %counts;
$counts{$_}++ for split(/\s+/, lc($text));

for my $word (sort { $counts{$b} <=> $counts{$a} } keys %counts) {
    print "$word: $counts{$word}\n";
}
