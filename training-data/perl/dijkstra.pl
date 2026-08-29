use strict;
use warnings;

sub dijkstra {
    my ($graph, $source) = @_;
    my %dist;
    $dist{$_} = 1e9 for keys %$graph;
    $dist{$source} = 0;
    my %visited;

    for (1 .. scalar keys %$graph) {
        my ($best_node, $best_dist);
        for my $node (keys %dist) {
            next if $visited{$node};
            if (!defined $best_dist || $dist{$node} < $best_dist) {
                $best_node = $node;
                $best_dist = $dist{$node};
            }
        }
        last unless defined $best_node;
        $visited{$best_node} = 1;
        for my $edge (@{$graph->{$best_node} || []}) {
            my ($neighbor, $weight) = @$edge;
            my $new_dist = $best_dist + $weight;
            $dist{$neighbor} = $new_dist if $new_dist < $dist{$neighbor};
        }
    }
    return \%dist;
}

my %graph = (
    a => [['b', 1], ['c', 4]],
    b => [['c', 2], ['d', 5]],
    c => [['d', 1]],
    d => [],
);
my $dist = dijkstra(\%graph, 'a');
for my $node (sort keys %$dist) {
    print "$node: $dist->{$node}\n";
}
