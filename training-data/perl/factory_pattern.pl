use strict;
use warnings;

package Circle;

sub new {
    my ($class, $radius) = @_;
    return bless { radius => $radius }, $class;
}

sub area {
    my ($self) = @_;
    return 3.14159 * $self->{radius} ** 2;
}

package Square;

sub new {
    my ($class, $side) = @_;
    return bless { side => $side }, $class;
}

sub area {
    my ($self) = @_;
    return $self->{side} ** 2;
}

package ShapeFactory;

sub create {
    my ($class, $kind, @args) = @_;
    return Circle->new(@args) if $kind eq 'circle';
    return Square->new(@args) if $kind eq 'square';
    die "unknown shape: $kind\n";
}

package main;

for my $spec (['circle', 3], ['square', 4]) {
    my ($kind, @args) = @$spec;
    my $shape = ShapeFactory->create($kind, @args);
    printf "%s area: %.2f\n", $kind, $shape->area;
}
