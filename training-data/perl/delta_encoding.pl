use strict;
use warnings;

my @xs = (10, 12, 15, 15, 20);
my @d = ($xs[0], map { $xs[$_] - $xs[$_ - 1] } 1 .. $#xs);
print "@d\n";
my $acc = 0;
print join(" ", map { $acc += $_ } @d), "\n";
