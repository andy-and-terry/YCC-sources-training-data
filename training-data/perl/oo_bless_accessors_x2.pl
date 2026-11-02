package Point;
use strict; use warnings;
sub new { my ($c, %a) = @_; return bless { x => 0, y => 0, %a }, $c }
sub x { $_[0]{x} }
sub dist { my $s = shift; sqrt($s->{x}**2 + $s->{y}**2) }
package main;
print Point->new(x => 3, y => 4)->dist, "\n";
