use strict;
use warnings;

package Checkout;

sub new {
    my ($class, $strategy) = @_;
    return bless { strategy => $strategy }, $class;
}

sub total {
    my ($self, $amount) = @_;
    return $self->{strategy}->($amount);
}

package main;

my %strategies = (
    no_discount => sub { my $amount = shift; return $amount; },
    percentage  => sub { my $amount = shift; return $amount * 0.9; },
    flat        => sub { my $amount = shift; my $r = $amount - 5; return $r < 0 ? 0 : $r; },
);

for my $name (qw(no_discount percentage flat)) {
    my $checkout = Checkout->new($strategies{$name});
    printf "%s: %.2f\n", $name, $checkout->total(100);
}
