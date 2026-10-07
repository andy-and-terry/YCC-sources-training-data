use strict;
use warnings;

my @files = qw(report_10.txt report_2.txt notes_1.txt report_1.txt notes_20.txt);

# sort by prefix, then by the number embedded in the name
my @sorted =
    map  { $_->[0] }
    sort { $a->[1] cmp $b->[1] or $a->[2] <=> $b->[2] }
    map  { /^(\w+?)_(\d+)\./ ? [$_, $1, $2] : [$_, $_, 0] }
    @files;

print "$_\n" for @sorted;

# sort words by length (cached), longest first, ties alphabetical
my @words = qw(pear fig banana kiwi apple);
my @by_len = map { $_->[1] }
             sort { $b->[0] <=> $a->[0] or $a->[1] cmp $b->[1] }
             map { [length($_), $_] } @words;
print "@by_len\n";
