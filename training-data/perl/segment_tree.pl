use strict;
use warnings;

package SegmentTree;

sub new {
    my ($class, @data) = @_;
    my $n = scalar @data;
    my $self = bless { n => $n, tree => [(0) x (4 * $n)], data => [@data] }, $class;
    $self->_build(1, 0, $n - 1) if $n;
    return $self;
}

sub _build {
    my ($self, $node, $lo, $hi) = @_;
    if ($lo == $hi) {
        $self->{tree}[$node] = $self->{data}[$lo];
        return;
    }
    my $mid = int(($lo + $hi) / 2);
    $self->_build(2 * $node, $lo, $mid);
    $self->_build(2 * $node + 1, $mid + 1, $hi);
    $self->{tree}[$node] = $self->{tree}[2 * $node] + $self->{tree}[2 * $node + 1];
}

sub query {
    my ($self, $ql, $qr) = @_;
    return $self->_query(1, 0, $self->{n} - 1, $ql, $qr);
}

sub _query {
    my ($self, $node, $lo, $hi, $ql, $qr) = @_;
    return 0 if $qr < $lo || $hi < $ql;
    return $self->{tree}[$node] if $ql <= $lo && $hi <= $qr;
    my $mid = int(($lo + $hi) / 2);
    return $self->_query(2 * $node, $lo, $mid, $ql, $qr)
         + $self->_query(2 * $node + 1, $mid + 1, $hi, $ql, $qr);
}

sub update {
    my ($self, $index, $value) = @_;
    $self->_update(1, 0, $self->{n} - 1, $index, $value);
}

sub _update {
    my ($self, $node, $lo, $hi, $index, $value) = @_;
    if ($lo == $hi) {
        $self->{tree}[$node] = $value;
        return;
    }
    my $mid = int(($lo + $hi) / 2);
    if ($index <= $mid) {
        $self->_update(2 * $node, $lo, $mid, $index, $value);
    } else {
        $self->_update(2 * $node + 1, $mid + 1, $hi, $index, $value);
    }
    $self->{tree}[$node] = $self->{tree}[2 * $node] + $self->{tree}[2 * $node + 1];
}

package main;

my $tree = SegmentTree->new(1, 3, 5, 7, 9, 11);
print $tree->query(1, 3), "\n";
$tree->update(1, 10);
print $tree->query(1, 3), "\n";
