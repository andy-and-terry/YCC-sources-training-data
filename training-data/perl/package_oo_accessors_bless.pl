use strict; use warnings;
package Point;
sub new { my ($c, %a) = @_; return bless { x => $a{x} // 0, y => $a{y} // 0 }, $c }
sub x { $_[0]{x} }
sub y { $_[0]{y} }
sub to_s { my $s = shift; "(" . $s->x . ", " . $s->y . ")" }
package main;
print Point->new(x => 3, y => 4)->to_s, "\n";
