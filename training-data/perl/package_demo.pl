use strict;
use warnings;

package Point;

sub new {
    my ($class, $x, $y) = @_;
    return bless { x => $x, y => $y }, $class;
}

sub add {
    my ($self, $other) = @_;
    return Point->new($self->{x} + $other->{x}, $self->{y} + $other->{y});
}

sub to_string {
    my ($self) = @_;
    return "($self->{x}, $self->{y})";
}

package main;

my $p1 = Point->new(1, 2);
my $p2 = Point->new(3, 4);
my $p3 = $p1->add($p2);
print $p3->to_string, "\n";
