use strict;
use warnings;

package Coffee;

sub new { return bless {}, shift; }

sub cost { return 2.0; }

sub description { return "coffee"; }

package MilkDecorator;

sub new {
    my ($class, $wrapped) = @_;
    return bless { wrapped => $wrapped }, $class;
}

sub cost {
    my ($self) = @_;
    return $self->{wrapped}->cost + 0.5;
}

sub description {
    my ($self) = @_;
    return $self->{wrapped}->description . " + milk";
}

package SugarDecorator;

sub new {
    my ($class, $wrapped) = @_;
    return bless { wrapped => $wrapped }, $class;
}

sub cost {
    my ($self) = @_;
    return $self->{wrapped}->cost + 0.25;
}

sub description {
    my ($self) = @_;
    return $self->{wrapped}->description . " + sugar";
}

package main;

my $drink = Coffee->new;
$drink = MilkDecorator->new($drink);
$drink = SugarDecorator->new($drink);

printf "%s: \$%.2f\n", $drink->description, $drink->cost;
