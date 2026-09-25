use strict;
use warnings;

sub newton_sqrt {
    my ($x, $eps) = (@_, 1e-12);
    die "negative input\n" if $x < 0;
    return 0 if $x == 0;
    my $g = $x > 1 ? $x / 2 : 1;
    $g = ($g + $x / $g) / 2 while abs($g * $g - $x) > $eps * $x;
    return $g;
}

sub newton_root {
    my ($f, $df, $x) = @_;
    for (1 .. 50) {
        my $step = $f->($x) / $df->($x);
        $x -= $step;
        last if abs($step) < 1e-15;
    }
    return $x;
}

printf "sqrt(%g) = %.12f (builtin %.12f)\n", $_, newton_sqrt($_), sqrt $_ for 2, 9, 0.25, 1e10;
printf "root of cos(x) - x: %.15f\n", newton_root(sub { cos($_[0]) - $_[0] }, sub { -sin($_[0]) - 1 }, 1);
printf "cube root of 10: %.12f\n", newton_root(sub { $_[0]**3 - 10 }, sub { 3 * $_[0]**2 }, 2);
