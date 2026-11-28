use strict;
use warnings;
use List::Util qw(sum);

sub sigma { my $n = shift; return sum(grep { $n % $_ == 0 } 1 .. $n) }

print join(' ', grep { sigma($_) < 2 * $_ } 1 .. 20), "\n";
