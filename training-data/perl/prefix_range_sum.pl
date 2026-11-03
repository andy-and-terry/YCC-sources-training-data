use strict;
use warnings;

package RangeSum;
sub new {
    my ($class, @values) = @_;
    my @prefix = (0);
    push @prefix, $prefix[-1] + $_ for @values;
    return bless { prefix => \@prefix }, $class;
}
sub query {
    my ($self, $lo, $hi) = @_;
    return $self->{prefix}[$hi] - $self->{prefix}[$lo];
}

package main;
print RangeSum->new(3, 1, 4, 1, 5, 9, 2, 6)->query(2, 5), "\n";
