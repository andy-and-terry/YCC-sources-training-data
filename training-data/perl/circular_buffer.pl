use strict;
use warnings;

package CircularBuffer;

sub new {
    my ($class, $capacity) = @_;
    return bless { data => [(0) x $capacity], capacity => $capacity, size => 0, start => 0 }, $class;
}

sub push_value {
    my ($self, $value) = @_;
    my $index = ($self->{start} + $self->{size}) % $self->{capacity};
    $self->{data}[$index] = $value;
    if ($self->{size} < $self->{capacity}) {
        $self->{size}++;
    } else {
        $self->{start} = ($self->{start} + 1) % $self->{capacity};
    }
}

sub to_array {
    my $self = shift;
    my @result;
    for my $i (0 .. $self->{size} - 1) {
        push @result, $self->{data}[($self->{start} + $i) % $self->{capacity}];
    }
    return @result;
}

package main;

my $buf = CircularBuffer->new(3);
$buf->push_value($_) for (1, 2, 3, 4, 5);
print join(" ", $buf->to_array()), "\n";
