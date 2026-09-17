use strict;
use warnings;

sub bfs {
    my ($graph, $start) = @_;
    my @order;
    my %visited = ($start => 1);
    my @queue = ($start);

    while (@queue) {
        my $node = shift @queue;
        push @order, $node;
        for my $neighbor (@{ $graph->{$node} || [] }) {
            unless ($visited{$neighbor}) {
                $visited{$neighbor} = 1;
                push @queue, $neighbor;
            }
        }
    }
    return @order;
}

my %graph = (
    a => ['b', 'c'],
    b => ['a', 'd', 'e'],
    c => ['a', 'f'],
    d => ['b'],
    e => ['b', 'f'],
    f => ['c', 'e'],
);

print join(",", bfs(\%graph, 'a')), "\n";
