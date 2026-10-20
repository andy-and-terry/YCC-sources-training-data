use strict;
use warnings;

sub make_counter { my $n = shift; return { inc => sub { ++$n }, dec => sub { --$n }, get => sub { $n } } }
my $c = make_counter(5);
$c->{inc}->() for 1 .. 3;
$c->{dec}->();
print $c->{get}->(), "\n";
my @subs = map { my $i = $_; sub { $i * $_[0] } } 1 .. 3;
print join(",", map { $_->(10) } @subs), "\n";
sub fib_gen { my ($a, $b) = (0, 1); sub { my $r = $a; ($a, $b) = ($b, $a + $b); $r } }
my $f = fib_gen();
print join(" ", map { $f->() } 1 .. 10), "\n";
