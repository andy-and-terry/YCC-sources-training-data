package Shape::Circle;
use strict;
use warnings;

sub new {
    my ($class, %args) = @_;
    return bless { radius => $args{radius} // 1 }, $class;
}

sub describe {
    my $self = shift;
    return __PACKAGE__ . " radius=" . $self->{radius};
}

package main;

my $c = Shape::Circle->new(radius => 3);
print $c->describe, "\n";
print ref($c), "\n";
print Shape::Circle->can('describe') ? "can describe\n" : "cannot\n";
