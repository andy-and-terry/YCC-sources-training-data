use strict;
use warnings;

package Vector2D;

use overload
    '+'  => \&add,
    '-'  => \&subtract,
    '""' => \&stringify,
    '==' => \&equals;

sub new {
    my ($class, $x, $y) = @_;
    return bless { x => $x, y => $y }, $class;
}

sub add {
    my ($self, $other) = @_;
    return Vector2D->new($self->{x} + $other->{x}, $self->{y} + $other->{y});
}

sub subtract {
    my ($self, $other, $swapped) = @_;
    my ($a, $b) = $swapped ? ($other, $self) : ($self, $other);
    return Vector2D->new($a->{x} - $b->{x}, $a->{y} - $b->{y});
}

sub equals {
    my ($self, $other) = @_;
    return $self->{x} == $other->{x} && $self->{y} == $other->{y};
}

sub stringify {
    my ($self) = @_;
    return "($self->{x}, $self->{y})";
}

package main;

my $v1 = Vector2D->new(1, 2);
my $v2 = Vector2D->new(3, 4);

print "v1 + v2 = ", $v1 + $v2, "\n";
print "v2 - v1 = ", $v2 - $v1, "\n";
print(($v1 == Vector2D->new(1, 2)) ? "v1 equals (1, 2)\n" : "v1 differs\n");
