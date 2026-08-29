use strict;
use warnings;

package Queue;

sub new {
    my $class = shift;
    return bless { items => [] }, $class;
}

sub enqueue {
    my ($self, $item) = @_;
    push @{$self->{items}}, $item;
}

sub dequeue {
    my $self = shift;
    return shift @{$self->{items}};
}

package main;

my $q = Queue->new();
$q->enqueue(1);
$q->enqueue(2);
$q->enqueue(3);
print $q->dequeue(), "\n";
print $q->dequeue(), "\n";
