use strict;
use warnings;
use List::Util qw(max min);

my @m = ([9, 8, 7], [5, 3, 2], [6, 6, 7]);
my @col_min = map { my $c = $_; min map { $_->[$c] } @m } 0 .. $#{ $m[0] };

for my $r (0 .. $#m) {
    my $row_max = max @{ $m[$r] };
    for my $c (0 .. $#{ $m[$r] }) {
        my $v = $m[$r][$c];
        print "saddle at ($r,$c)\n" if $v == $row_max && $v == $col_min[$c];
    }
}
