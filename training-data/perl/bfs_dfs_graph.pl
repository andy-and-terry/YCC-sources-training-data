use strict;
use warnings;

my %graph = (
    a => [qw(b c)],
    b => [qw(a d)],
    c => [qw(a d)],
    d => [qw(b c e)],
    e => [qw(d)],
);

sub bfs {
    my ($start) = @_;
    my %visited = ($start => 1);
    my @queue   = ($start);
    my @order;
    while (@queue) {
        my $node = shift @queue;
        push @order, $node;
        for my $neighbor (@{ $graph{$node} }) {
            unless ($visited{$neighbor}) {
                $visited{$neighbor} = 1;
                push @queue, $neighbor;
            }
        }
    }
    return @order;
}

sub dfs {
    my ($node, $visited, $order) = @_;
    return if $visited->{$node};
    $visited->{$node} = 1;
    push @$order, $node;
    dfs($_, $visited, $order) for @{ $graph{$node} };
}

print "BFS: ", join(" ", bfs("a")), "\n";

my (%visited, @order);
dfs("a", \%visited, \@order);
print "DFS: ", join(" ", @order), "\n";
