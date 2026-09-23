use strict;
use warnings;

package Point;

for my $field (qw(x y)) {
    no strict 'refs';
    *{"Point::$field"} = sub {
        my $self = shift;
        $self->{$field} = shift if @_;
        return $self->{$field};
    };
}

sub new {
    my ($class, %args) = @_;
    return bless { %args }, $class;
}

package main;

my $point = Point->new(x => 3, y => 4);
print "x: ", $point->x, ", y: ", $point->y, "\n";
$point->x(10);
print "updated x: ", $point->x, "\n";
