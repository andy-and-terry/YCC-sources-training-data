use strict;
use warnings;

package UnionFind;

sub new {
    my ($class, $n) = @_;
    my @parent = (0 .. $n - 1);
    return bless { parent => \@parent }, $class;
}

sub find {
    my ($self, $x) = @_;
    return $x if $self->{parent}[$x] == $x;
    return $self->find($self->{parent}[$x]);
}

sub union {
    my ($self, $x, $y) = @_;
    my $root_x = $self->find($x);
    my $root_y = $self->find($y);
    $self->{parent}[$root_x] = $root_y if $root_x != $root_y;
}

package main;

my $uf = UnionFind->new(5);
$uf->union(0, 1);
$uf->union(1, 2);
print $uf->find(0) == $uf->find(2) ? "1" : "0", "\n";
print $uf->find(0) == $uf->find(3) ? "1" : "0", "\n";
