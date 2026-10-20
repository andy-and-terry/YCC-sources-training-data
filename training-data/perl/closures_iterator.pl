use strict; use warnings;
sub make_iter { my @items = @_; my $i = 0; return sub { return $i < @items ? $items[$i++] : undef; }; }
my $it = make_iter(qw(a b c));
while (defined(my $x = $it->())) { print "$x\n"; }
