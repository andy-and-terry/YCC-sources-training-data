use strict;
use warnings;

package Stack;

sub new {
    my $class = shift;
    return bless { items => [] }, $class;
}

sub push_item {
    my ($self, $item) = @_;
    push @{$self->{items}}, $item;
}

sub pop_item {
    my $self = shift;
    return pop @{$self->{items}};
}

package main;

my $s = Stack->new();
$s->push_item(1);
$s->push_item(2);
$s->push_item(3);
print $s->pop_item(), "\n";
print $s->pop_item(), "\n";
