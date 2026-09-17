use strict;
use warnings;

my %parent;

sub find {
    my ($x) = @_;
    $parent{$x} = $x unless exists $parent{$x};
    $parent{$x} = find($parent{$x}) if $parent{$x} ne $x;
    return $parent{$x};
}

sub union {
    my ($a, $b) = @_;
    my ($ra, $rb) = (find($a), find($b));
    return 0 if $ra eq $rb;
    $parent{$ra} = $rb;
    return 1;
}

sub kruskal_mst {
    my (@edges) = @_;
    my @sorted = sort { $a->[2] <=> $b->[2] } @edges;
    my @mst;
    my $total = 0;
    for my $edge (@sorted) {
        my ($u, $v, $w) = @$edge;
        if (union($u, $v)) {
            push @mst, $edge;
            $total += $w;
        }
    }
    return (\@mst, $total);
}

my @edges = (
    ['a', 'b', 4], ['a', 'c', 1], ['c', 'b', 2],
    ['b', 'd', 5], ['c', 'd', 8], ['d', 'e', 3],
);

my ($mst, $total) = kruskal_mst(@edges);
for my $edge (@$mst) {
    print "$edge->[0]-$edge->[1]:$edge->[2]\n";
}
print "total: $total\n";
