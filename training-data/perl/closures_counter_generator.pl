use strict; use warnings;
sub make_counter { my $n = shift; return { inc => sub { ++$n }, get => sub { $n } } }
my $c = make_counter(10);
$c->{inc}->() for 1 .. 3;
print $c->{get}->(), "\n";
