use strict;
use warnings;

my @words = qw(pear fig banana kiwi apple);
my @sorted = map  { $_->[1] }
             sort { $a->[0] <=> $b->[0] or $a->[1] cmp $b->[1] }
             map  { [length($_), $_] } @words;
print "@sorted\n";
