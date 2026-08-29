use strict;
use warnings;

sub visit {
    my ($node, $graph, $visited, $order) = @_;
    return if $visited->{$node};
    $visited->{$node} = 1;
    visit($_, $graph, $visited, $order) for @{$graph->{$node} || []};
    push @$order, $node;
}

sub topo_sort {
    my $graph = shift;
    my (%visited, @order);
    visit($_, $graph, \%visited, \@order) for keys %$graph;
    return @order;
}

my %graph = (a => ['b', 'c'], b => ['d'], c => ['d'], d => []);
print join(" ", topo_sort(\%graph)), "\n";
