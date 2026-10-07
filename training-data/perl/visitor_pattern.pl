use strict;
use warnings;

package Circle;

sub new {
    my ($class, $radius) = @_;
    return bless { radius => $radius }, $class;
}

sub accept {
    my ($self, $visitor) = @_;
    return $visitor->visit_circle($self);
}

package Square;

sub new {
    my ($class, $side) = @_;
    return bless { side => $side }, $class;
}

sub accept {
    my ($self, $visitor) = @_;
    return $visitor->visit_square($self);
}

package AreaVisitor;

sub new { return bless {}, shift; }

sub visit_circle {
    my ($self, $circle) = @_;
    return 3.14159 * $circle->{radius} ** 2;
}

sub visit_square {
    my ($self, $square) = @_;
    return $square->{side} ** 2;
}

package main;

my @shapes = (Circle->new(2), Square->new(3));
my $visitor = AreaVisitor->new();

for my $shape (@shapes) {
    printf "area: %.2f\n", $shape->accept($visitor);
}
