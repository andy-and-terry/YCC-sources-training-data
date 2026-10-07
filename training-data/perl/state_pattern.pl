use strict;
use warnings;

package TrafficLight;

my %next_state = (
    red    => 'green',
    green  => 'yellow',
    yellow => 'red',
);

sub new {
    my ($class) = @_;
    return bless { state => 'red' }, $class;
}

sub next {
    my ($self) = @_;
    $self->{state} = $next_state{$self->{state}};
    return $self->{state};
}

package main;

my $light = TrafficLight->new;
for (1 .. 5) {
    print $light->{state}, "\n";
    $light->next;
}
