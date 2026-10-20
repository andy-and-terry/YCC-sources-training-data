use strict;
use warnings;

package Vec2;
use overload '+' => \&add, '-' => sub { Vec2->new($_[0]{x} - $_[1]{x}, $_[0]{y} - $_[1]{y}) },
    '*' => sub { ref $_[1] ? $_[0]{x} * $_[1]{x} + $_[0]{y} * $_[1]{y} : Vec2->new($_[0]{x} * $_[1], $_[0]{y} * $_[1]) },
    '""' => sub { "($_[0]{x}, $_[0]{y})" }, '==' => sub { $_[0]{x} == $_[1]{x} && $_[0]{y} == $_[1]{y} };
sub new { my ($c, $x, $y) = @_; bless { x => $x, y => $y }, $c }
sub add { Vec2->new($_[0]{x} + $_[1]{x}, $_[0]{y} + $_[1]{y}) }

package main;
my ($a, $b) = (Vec2->new(1, 2), Vec2->new(3, 4));
print $a + $b, " ", $b - $a, " ", $a * 3, " ", $a * $b, " ", ($a == $a ? "eq" : "ne"), "\n";
