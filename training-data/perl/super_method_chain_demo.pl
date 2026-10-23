use strict;
use warnings;

package Animal;

sub new {
    my ($class, %args) = @_;
    my $self = bless { name => $args{name} || 'unknown' }, $class;
    $self->init(%args);
    return $self;
}

sub init { my ($self, %args) = @_; $self->{sound} = 'generic noise'; }

sub describe {
    my $self = shift;
    return sprintf "%s the %s says %s", $self->{name}, lc ref $self, $self->{sound};
}

package Dog;
our @ISA = ('Animal');

# SUPER:: calls the next implementation up the @ISA chain
sub init {
    my ($self, %args) = @_;
    $self->SUPER::init(%args);
    $self->{sound} = 'woof';
    $self->{tricks} = $args{tricks} || [];
}

sub describe {
    my $self = shift;
    my $base = $self->SUPER::describe();
    return $base . " and knows " . scalar(@{ $self->{tricks} }) . " tricks";
}

package Puppy;
our @ISA = ('Dog');

sub describe {
    my $self = shift;
    return $self->SUPER::describe() . " (still learning)";
}

package main;

print Animal->new(name => 'Thing')->describe, "\n";
print Dog->new(name => 'Rex', tricks => ['sit', 'roll'])->describe, "\n";
print Puppy->new(name => 'Bit', tricks => ['sit'])->describe, "\n";
print "Puppy isa Animal: ", (Puppy->isa('Animal') ? 'yes' : 'no'), "\n";
