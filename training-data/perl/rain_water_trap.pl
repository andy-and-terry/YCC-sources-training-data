use strict;
use warnings;

sub trap {
    my @h = @_;
    my ($l, $r, $lmax, $rmax, $water) = (0, $#h, 0, 0, 0);
    while ($l < $r) {
        if ($h[$l] < $h[$r]) {
            $lmax = $h[$l] if $h[$l] > $lmax;
            $water += $lmax - $h[$l++];
        } else {
            $rmax = $h[$r] if $h[$r] > $rmax;
            $water += $rmax - $h[$r--];
        }
    }
    return $water;
}

printf "[%s] -> %d\n", "@$_", trap(@$_) for [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1], [4, 2, 0, 3, 2, 5], [1, 2, 3];
