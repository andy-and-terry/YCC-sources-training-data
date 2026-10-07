use strict;
use warnings;

package Deque;

sub new {
    my $class = shift;
    return bless { items => [] }, $class;
}

sub push_back {
    my ($self, $value) = @_;
    push @{$self->{items}}, $value;
}

sub push_front {
    my ($self, $value) = @_;
    unshift @{$self->{items}}, $value;
}

sub pop_back {
    my $self = shift;
    return pop @{$self->{items}};
}

sub pop_front {
    my $self = shift;
    return shift @{$self->{items}};
}

sub to_array {
    my $self = shift;
    return @{$self->{items}};
}

package main;

my $dq = Deque->new();
$dq->push_back(2);
$dq->push_back(3);
$dq->push_front(1);
$dq->push_front(0);
print join(" ", $dq->to_array()), "\n";
print "pop_back: ", $dq->pop_back(), "\n";
print "pop_front: ", $dq->pop_front(), "\n";
print join(" ", $dq->to_array()), "\n";
