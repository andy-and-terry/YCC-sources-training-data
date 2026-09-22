use strict;
use warnings;

package Animal;

sub new {
    my ($class, $name) = @_;
    return bless { name => $name }, $class;
}

sub speak {
    my ($self) = @_;
    return $self->{name} . " makes a sound";
}

package Dog;

use parent -norequire, 'Animal';

sub speak {
    my ($self) = @_;
    return $self->{name} . " barks";
}

package Cat;

our @ISA = ('Animal');

sub speak {
    my ($self) = @_;
    return $self->{name} . " meows";
}

package main;

my @animals = (Dog->new("Rex"), Cat->new("Whiskers"), Animal->new("Thing"));
for my $animal (@animals) {
    print $animal->speak, "\n";
}
