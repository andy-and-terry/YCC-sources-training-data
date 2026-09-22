use strict;
use warnings;

package SegmentTree;

sub new {
    my ($class, @values) = @_;
    my $n = scalar @values;
    my $self = bless { n => $n, tree => [(0) x (4 * ($n || 1))] }, $class;
    $self->_build(\@values, 1, 0, $n - 1) if $n > 0;
    return $self;
}

sub _build {
    my ($self, $values, $node, $lo, $hi) = @_;
    if ($lo == $hi) {
        $self->{tree}[$node] = $values->[$lo];
        return;
    }
    my $mid = int(($lo + $hi) / 2);
    $self->_build($values, 2 * $node, $lo, $mid);
    $self->_build($values, 2 * $node + 1, $mid + 1, $hi);
    $self->{tree}[$node] = $self->{tree}[2 * $node] + $self->{tree}[2 * $node + 1];
}

sub update {
    my ($self, $index, $value) = @_;
    $self->_update($index, $value, 1, 0, $self->{n} - 1);
}

sub _update {
    my ($self, $index, $value, $node, $lo, $hi) = @_;
    if ($lo == $hi) {
        $self->{tree}[$node] = $value;
        return;
    }
    my $mid = int(($lo + $hi) / 2);
    if ($index <= $mid) {
        $self->_update($index, $value, 2 * $node, $lo, $mid);
    } else {
        $self->_update($index, $value, 2 * $node + 1, $mid + 1, $hi);
    }
    $self->{tree}[$node] = $self->{tree}[2 * $node] + $self->{tree}[2 * $node + 1];
}

sub query {
    my ($self, $left, $right) = @_;
    return $self->_query(1, 0, $self->{n} - 1, $left, $right);
}

sub _query {
    my ($self, $node, $lo, $hi, $left, $right) = @_;
    return 0 if $right < $lo || $hi < $left;
    return $self->{tree}[$node] if $left <= $lo && $hi <= $right;
    my $mid = int(($lo + $hi) / 2);
    return $self->_query(2 * $node, $lo, $mid, $left, $right)
         + $self->_query(2 * $node + 1, $mid + 1, $hi, $left, $right);
}

package main;

my @values = (1, 3, 5, 7, 9, 11);
my $tree = SegmentTree->new(@values);
print $tree->query(1, 3), "\n";
$tree->update(1, 10);
print $tree->query(1, 3), "\n";
print $tree->query(0, 5), "\n";
