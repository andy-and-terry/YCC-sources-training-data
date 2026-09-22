use strict;
use warnings;

sub bellman_ford {
    my ($edges, $vertices, $source) = @_;
    my %dist = map { $_ => 1e18 } @$vertices;
    $dist{$source} = 0;

    for my $i (1 .. scalar(@$vertices) - 1) {
        for my $edge (@$edges) {
            my ($u, $v, $w) = @$edge;
            if ($dist{$u} + $w < $dist{$v}) {
                $dist{$v} = $dist{$u} + $w;
            }
        }
    }

    for my $edge (@$edges) {
        my ($u, $v, $w) = @$edge;
        if ($dist{$u} + $w < $dist{$v}) {
            die "graph contains a negative-weight cycle";
        }
    }

    return \%dist;
}

my @vertices = qw(a b c d e);
my @edges = (
    ['a', 'b', -1], ['a', 'c', 4], ['b', 'c', 3],
    ['b', 'd', 2],  ['b', 'e', 2], ['d', 'b', 1],
    ['d', 'c', 5],  ['e', 'd', -3],
);

my $dist = bellman_ford(\@edges, \@vertices, 'a');
for my $v (@vertices) {
    print "$v: $dist->{$v}\n";
}
