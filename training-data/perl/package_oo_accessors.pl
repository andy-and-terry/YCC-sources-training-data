use strict; use warnings;
package Counter;
sub new { my ($c, %a) = @_; return bless { n => $a{start} // 0 }, $c }
sub inc { $_[0]{n}++; return $_[0] }
sub value { $_[0]{n} }
package main;
print Counter->new(start => 5)->inc->inc->value, "\n";
