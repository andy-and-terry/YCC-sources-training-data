use strict; use warnings;
sub make_counter { my $n = shift; return sub { return $n++ } }
my $c = make_counter(5);
$c->(); print $c->(), "\n";
