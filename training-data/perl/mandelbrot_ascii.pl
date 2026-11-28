use strict; use warnings;
sub escape {
    my ($cr, $ci) = @_;
    my ($zr, $zi) = (0, 0);
    for my $n (0 .. 29) {
        return $n if $zr * $zr + $zi * $zi >= 4;
        ($zr, $zi) = ($zr * $zr - $zi * $zi + $cr, 2 * $zr * $zi + $ci);
    }
    return 30;
}
for my $yi (-5 .. 5) {
    print join('', map { escape($_ / 20, $yi / 5) == 30 ? '#' : '.' } -40 .. 12), "\n";
}
