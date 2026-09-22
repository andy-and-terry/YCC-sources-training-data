use strict;
use warnings;

package DoublyLinkedList;

sub new {
    my ($class) = @_;
    return bless { head => undef, tail => undef, size => 0 }, $class;
}

sub push_back {
    my ($self, $value) = @_;
    my $node = { value => $value, prev => $self->{tail}, next => undef };
    if ($self->{tail}) {
        $self->{tail}{next} = $node;
    } else {
        $self->{head} = $node;
    }
    $self->{tail} = $node;
    $self->{size}++;
}

sub push_front {
    my ($self, $value) = @_;
    my $node = { value => $value, prev => undef, next => $self->{head} };
    if ($self->{head}) {
        $self->{head}{prev} = $node;
    } else {
        $self->{tail} = $node;
    }
    $self->{head} = $node;
    $self->{size}++;
}

sub to_array_forward {
    my ($self) = @_;
    my @out;
    my $node = $self->{head};
    while ($node) {
        push @out, $node->{value};
        $node = $node->{next};
    }
    return @out;
}

sub to_array_backward {
    my ($self) = @_;
    my @out;
    my $node = $self->{tail};
    while ($node) {
        push @out, $node->{value};
        $node = $node->{prev};
    }
    return @out;
}

package main;

my $list = DoublyLinkedList->new;
$list->push_back($_) for (1, 2, 3);
$list->push_front(0);

print join(" ", $list->to_array_forward), "\n";
print join(" ", $list->to_array_backward), "\n";
print "size: $list->{size}\n";
