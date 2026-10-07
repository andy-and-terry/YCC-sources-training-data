use strict;
use warnings;

package Pizza;

sub new {
    my ($class, %args) = @_;
    return bless { size => $args{size}, toppings => $args{toppings} }, $class;
}

sub describe {
    my ($self) = @_;
    return "$self->{size} pizza with toppings: " . join(", ", @{ $self->{toppings} });
}

package PizzaBuilder;

sub new {
    my ($class) = @_;
    return bless { size => 'medium', toppings => [] }, $class;
}

sub set_size {
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
    return Pizza->new(size => $self->{size}, toppings => $self->{toppings});
}

package main;

my $pizza = PizzaBuilder->new
    ->set_size('large')
    ->add_topping('cheese')
    ->add_topping('pepperoni')
    ->build;

print $pizza->describe, "\n";
