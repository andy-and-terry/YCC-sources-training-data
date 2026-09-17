use strict;
use warnings;

package FenwickTree;

sub new {
    my ($class, $size) = @_;
    return bless { size => $size, tree => [(0) x ($size + 1)] }, $class;
}

sub update {
    my ($self, $index, $delta) = @_;
    my $i = $index + 1;
    while ($i <= $self->{size}) {
        $self->{tree}[$i] += $delta;
        $i += $i & (-$i);
    }
}

sub prefix_sum {
    my ($self, $index) = @_;
    my $sum = 0;
    my $i = $index + 1;
    while ($i > 0) {
        $sum += $self->{tree}[$i];
        $i -= $i & (-$i);
    }
    return $sum;
}

sub range_sum {
    my ($self, $left, $right) = @_;
    my $lower = $left > 0 ? $self->prefix_sum($left - 1) : 0;
    return $self->prefix_sum($right) - $lower;
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
