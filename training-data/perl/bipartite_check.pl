use strict;
use warnings;

sub is_bipartite {
    my ($graph) = @_;
    my %color;
    for my $start (keys %$graph) {
        next if exists $color{$start};
        $color{$start} = 0;
        my @queue = ($start);
        while (@queue) {
            my $u = shift @queue;
            for my $v (@{$graph->{$u}}) {
                if (!exists $color{$v}) {
                    $color{$v} = 1 - $color{$u};
                    push @queue, $v;
                } elsif ($color{$v} == $color{$u}) {
                    return 0;
                }
            }
        }
    }
    return 1;
}

my $even_cycle = { a => ['b', 'd'], b => ['a', 'c'], c => ['b', 'd'], d => ['a', 'c'] };
my $odd_cycle  = { a => ['b', 'c'], b => ['a', 'c'], c => ['a', 'b'] };

print is_bipartite($even_cycle) ? "true" : "false", "\n";
print is_bipartite($odd_cycle) ? "true" : "false", "\n";
