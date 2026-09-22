use strict;
use warnings;

sub prim_mst {
    my ($graph, $start) = @_;
    my %in_mst = ($start => 1);
    my @mst;
    my $total = 0;
    my @frontier = map { [$start, $_->[0], $_->[1]] } @{ $graph->{$start} };

    while (scalar(keys %in_mst) < scalar(keys %$graph)) {
        my $best_idx;
        my $best_weight;
        for my $i (0 .. $#frontier) {
            my ($u, $v, $w) = @{ $frontier[$i] };
            next if $in_mst{$v};
            if (!defined $best_weight || $w < $best_weight) {
                $best_weight = $w;
                $best_idx = $i;
            }
        }
        last unless defined $best_idx;

        my ($u, $v, $w) = @{ $frontier[$best_idx] };
        splice(@frontier, $best_idx, 1);
        $in_mst{$v} = 1;
        push @mst, [$u, $v, $w];
        $total += $w;
        push @frontier, map { [$v, $_->[0], $_->[1]] } @{ $graph->{$v} };
    }

    return (\@mst, $total);
}

my %graph = (
    a => [['b', 4], ['c', 1]],
    b => [['a', 4], ['c', 2], ['d', 5]],
    c => [['a', 1], ['b', 2], ['d', 8]],
    d => [['b', 5], ['c', 8], ['e', 3]],
    e => [['d', 3]],
);

my ($mst, $total) = prim_mst(\%graph, 'a');
for my $edge (@$mst) {
    print "$edge->[0]-$edge->[1]:$edge->[2]\n";
}
print "total: $total\n";
