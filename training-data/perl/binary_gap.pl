use strict;
use warnings;
use List::Util qw(max);

sub binary_gap {
    (my $b = sprintf '%b', shift) =~ s/0+$//;
    return max(0, map { length } split /1/, $b);
}

printf "%d %b %d\n", $_, $_, binary_gap($_) for 9, 529, 20, 15, 1041;
