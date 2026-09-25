use strict;
use warnings;

sub rob_line {
    my ($take, $skip) = (0, 0);
    ($take, $skip) = ($skip + $_, $take > $skip ? $take : $skip) for @_;
    return $take > $skip ? $take : $skip;
}

sub rob_circle {
    my @h = @_;
    return $h[0] // 0 if @h <= 1;
    my ($a, $b) = (rob_line(@h[0 .. $#h - 1]), rob_line(@h[1 .. $#h]));
    return $a > $b ? $a : $b;
}

print rob_line(2, 7, 9, 3, 1), ' ', rob_line(1, 2, 3, 1), ' ', rob_circle(2, 3, 2), ' ', rob_circle(1, 2, 3, 1), "\n";
