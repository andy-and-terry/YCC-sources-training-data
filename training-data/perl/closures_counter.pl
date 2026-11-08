use strict;
use warnings;

sub make_counter {
    my $n = shift // 0;
    return { inc => sub { ++$n }, get => sub { $n } };
}

my $c = make_counter(5);
$c->{inc}->() for 1 .. 3;
print $c->{get}->(), "\n";
