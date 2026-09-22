use strict;
use warnings;

# A graph is bipartite iff it can be 2-colored so that no edge joins two
# nodes of the same color. BFS assigns alternating colors and fails as
# soon as an edge would force two neighbors into the same color.

sub is_bipartite {
    my ($adj) = @_;
    my %color;
    for my $start (keys %$adj) {
        next if exists $color{$start};
        $color{$start} = 0;
        my @queue = ($start);
        while (@queue) {
            my $node = shift @queue;
            for my $neighbor (@{ $adj->{$node} || [] }) {
                if (!exists $color{$neighbor}) {
                    $color{$neighbor} = 1 - $color{$node};
                    push @queue, $neighbor;
                } elsif ($color{$neighbor} == $color{$node}) {
                    return 0;
                }
            }
        }
    }
    return 1;
}

my %bipartite_graph = (
    a => ['b', 'd'],
    b => ['a', 'c'],
    c => ['b', 'd'],
    d => ['a', 'c'],
);

my %odd_cycle_graph = (
    a => ['b', 'c'],
    b => ['a', 'c'],
    c => ['a', 'b'],
);

print is_bipartite(\%bipartite_graph) ? "bipartite\n" : "not bipartite\n";
print is_bipartite(\%odd_cycle_graph) ? "bipartite\n" : "not bipartite\n";
