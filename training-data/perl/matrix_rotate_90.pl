use strict;
use warnings;

sub rotate_clockwise {
    my $m = shift;
    my $rows = @$m;
    my $cols = @{ $m->[0] };
    return [ map { my $c = $_; [ map { $m->[$_][$c] } reverse 0 .. $rows - 1 ] } 0 .. $cols - 1 ];
}

print "@$_\n" for @{ rotate_clockwise([ [1, 2, 3], [4, 5, 6], [7, 8, 9] ]) };
