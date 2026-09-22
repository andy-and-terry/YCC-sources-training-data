use strict;
use warnings;

# GoF Builder pattern: the builder accumulates parts through a fluent
# interface and only assembles the final immutable Pizza on build().

package Pizza;

sub new {
    my ($class, %args) = @_;
    return bless {
        size     => $args{size},
        toppings => $args{toppings} || [],
    }, $class;
}

sub describe {
    my ($self) = @_;
    my $toppings = @{ $self->{toppings} } ? join(", ", @{ $self->{toppings} }) : "none";
    return "$self->{size} pizza with toppings: $toppings";
}

package PizzaBuilder;

sub new {
    my ($class) = @_;
    return bless { size => 'medium', toppings => [] }, $class;
}

sub size {
    my ($self, $size) = @_;
    $self->{size} = $size;
    return $self;
}

sub add_topping {
    my ($self, $topping) = @_;
    push @{ $self->{toppings} }, $topping;
    return $self;
}

sub build {
    my ($self) = @_;
    return Pizza->new(size => $self->{size}, toppings => [ @{ $self->{toppings} } ]);
}

package main;

my $pizza = PizzaBuilder->new
    ->size('large')
    ->add_topping('mozzarella')
    ->add_topping('basil')
    ->build;

print $pizza->describe, "\n";
