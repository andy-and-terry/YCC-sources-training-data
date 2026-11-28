use strict; use warnings;
my $s = 'banana$';
my $n = length $s;
my @rots = sort map { substr($s, $_) . substr($s, 0, $_) } 0 .. $n - 1;
print join('', map { substr($_, -1) } @rots), "\n";
