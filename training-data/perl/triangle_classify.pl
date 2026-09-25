use strict;
use warnings;

sub classify {
    my @s = sort { $a <=> $b } @_;
    return 'invalid' if $s[0] <= 0 || $s[0] + $s[1] <= $s[2];
    my %u = map { $_ => 1 } @_;
    return (undef, 'equilateral', 'isosceles', 'scalene')[ scalar keys %u ];
}

print join(' ', map { classify(@$_) } [3, 3, 3], [3, 4, 4], [3, 4, 5], [1, 1, 3]), "\n";
