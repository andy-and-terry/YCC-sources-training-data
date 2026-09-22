use strict;
use warnings;

# tie binds a variable's storage to a class implementing the TIE*
# protocol, so ordinary assignment and reads silently go through
# STORE/FETCH. Here a tied scalar clamps every value written to it into
# a fixed range.

package ClampedScalar;

sub TIESCALAR {
    my ($class, $min, $max) = @_;
    return bless { value => $min, min => $min, max => $max }, $class;
}

sub FETCH {
    my ($self) = @_;
    return $self->{value};
}

sub STORE {
    my ($self, $new_value) = @_;
    $new_value = $self->{min} if $new_value < $self->{min};
    $new_value = $self->{max} if $new_value > $self->{max};
    $self->{value} = $new_value;
}

package main;

tie my $percent, 'ClampedScalar', 0, 100;

$percent = 42;
print "$percent\n";

$percent = 150;
print "$percent\n";

$percent = -10;
print "$percent\n";

$percent += 30;
print "$percent\n";
