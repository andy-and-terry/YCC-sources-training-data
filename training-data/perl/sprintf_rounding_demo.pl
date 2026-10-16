use strict;
use warnings;

for my $v (2.5, 3.5, 2.675, -1.5, 0.125) {
    printf "%6.2f  %3.0f  %d\n", $v, $v, int($v);
}

sub round_half_up {
    my ($x, $places) = @_;
    my $f = 10 ** $places;
    return int($x * $f + ($x < 0 ? -0.5 : 0.5)) / $f;
}

print round_half_up(2.5, 0), "\n";
print round_half_up(2.675, 2), "\n";
print round_half_up(-2.5, 0), "\n";
printf "%e\n", 12345.678;
printf "%g %g\n", 0.00001234, 1234567890;
