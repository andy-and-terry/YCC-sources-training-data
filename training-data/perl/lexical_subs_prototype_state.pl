use strict;
use warnings;
use feature qw(say state signatures);
no warnings 'experimental::signatures';

sub counter { state $n = 0; return ++$n }
counter() for 1 .. 4;
say counter();
sub add($x, $y = 10, @rest) { $x + $y + @rest }
say add(1), " ", add(1, 2), " ", add(1, 2, 3, 4);
my sub helper($v) { $v * 2 }
say helper(21);
say join ",", map { sprintf "%02d", $_ } 1 .. 3;
use feature 'fc'; say fc("HeLLo") eq fc("hEllO") ? "same" : "diff";
