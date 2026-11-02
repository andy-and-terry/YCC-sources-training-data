use strict; use warnings;
my @w = qw(pear fig banana kiwi);
my @s = map { $_->[1] } sort { $a->[0] <=> $b->[0] } map { [length, $_] } @w;
print "@s\n";
