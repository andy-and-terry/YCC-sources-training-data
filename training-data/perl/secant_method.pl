use strict;
use warnings;

sub secant {
    my ($f, $x0, $x1) = @_;
    for (1 .. 50) {
        my ($f0, $f1) = ($f->($x0), $f->($x1));
        last if $f1 == $f0;
        ($x0, $x1) = ($x1, $x1 - $f1 * ($x1 - $x0) / ($f1 - $f0));
        last if abs($x1 - $x0) < 1e-12;
    }
    return $x1;
}

printf "%.10f\n", secant(sub { $_[0] ** 2 - 2 }, 1, 2);
