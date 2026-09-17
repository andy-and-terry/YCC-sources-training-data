use strict;
use warnings;

package FenwickTree;

sub new {
    my ($class, $size) = @_;
    return bless { size => $size, tree => [(0) x ($size + 1)] }, $class;
}

sub update {
    my ($self, $index, $delta) = @_;
    for (my $i = $index + 1; $i <= $self->{size}; $i += $i & (-$i)) {
        $self->{tree}[$i] += $delta;
    }
}

sub prefix_sum {
    my ($self, $index) = @_;
    my $sum = 0;
    for (my $i = $index + 1; $i > 0; $i -= $i & (-$i)) {
        $sum += $self->{tree}[$i];
    }
    return $sum;
}

sub range_sum {
    my ($self, $left, $right) = @_;
    return $self->prefix_sum($right) - ($left > 0 ? $self->prefix_sum($left - 1) : 0);
}

package main;

my @values = (3, 2, -1, 6, 5, 4, -3, 3, 7, 2);
my $fenwick = FenwickTree->new(scalar @values);
for my $i (0 .. $#values) {
    $fenwick->update($i, $values[$i]);
}
print $fenwick->range_sum(0, 9), "\n";
print $fenwick->range_sum(2, 5), "\n";
$fenwick->update(2, 10);
print $fenwick->range_sum(2, 5), "\n";
