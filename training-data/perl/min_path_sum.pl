use strict;
use warnings;

sub min_path_sum {
    my @g = @_;
    my ($rows, $cols) = (scalar @g, scalar @{ $g[0] });
    my @dp;
    for my $r (0 .. $rows - 1) {
        for my $c (0 .. $cols - 1) {
            my @prev = (($r ? $dp[$r - 1][$c] : ()), ($c ? $dp[$r][$c - 1] : ()));
            my $best = @prev ? (sort { $a <=> $b } @prev)[0] : 0;
            $dp[$r][$c] = $g[$r][$c] + $best;
        }
    }
    my ($r, $c) = ($rows - 1, $cols - 1);
    my @path = ("($r,$c)");
    while ($r || $c) {
        if (!$r || ($c && $dp[$r][$c - 1] < $dp[$r - 1][$c])) { $c-- } else { $r-- }
        unshift @path, "($r,$c)";
    }
    return ($dp[-1][-1], @path);
}

my ($cost, @path) = min_path_sum([1, 3, 1], [1, 5, 1], [4, 2, 1]);
print "cost $cost path @path\n";
