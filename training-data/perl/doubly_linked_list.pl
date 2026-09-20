use strict;
use warnings;

package DListNode;

sub new {
    my ($class, $value) = @_;
    return bless { value => $value, prev => undef, next => undef }, $class;
}

package DoublyLinkedList;

sub new {
    my ($class) = @_;
    return bless { head => undef, tail => undef }, $class;
}

sub add_last {
    my ($self, $value) = @_;
    my $node = DListNode->new($value);
    if (!defined $self->{head}) {
        $self->{head} = $node;
        $self->{tail} = $node;
    } else {
        $node->{prev} = $self->{tail};
        $self->{tail}{next} = $node;
        $self->{tail} = $node;
    }
}

sub remove_first {
    my ($self) = @_;
    return unless defined $self->{head};
    $self->{head} = $self->{head}{next};
    if (defined $self->{head}) {
        $self->{head}{prev} = undef;
    } else {
        $self->{tail} = undef;
    }
}

sub to_array_forward {
    my ($self) = @_;
    my @out;
    my $node = $self->{head};
    while (defined $node) {
        push @out, $node->{value};
        $node = $node->{next};
    }
    return @out;
}

sub to_array_backward {
    my ($self) = @_;
    my @out;
    my $node = $self->{tail};
    while (defined $node) {
        push @out, $node->{value};
        $node = $node->{prev};
    }
    return @out;
}

package main;

my $list = DoublyLinkedList->new();
$list->add_last($_) for (1, 2, 3, 4);
print join(",", $list->to_array_forward()), "\n";
$list->remove_first();
print join(",", $list->to_array_backward()), "\n";
