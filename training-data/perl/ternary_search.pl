use strict;
use warnings;

sub ternary_search {
    my ($a, $t) = @_;
    my ($lo, $hi) = (0, $#$a);
    while ($lo <= $hi) {
        my $third = int(($hi - $lo) / 3);
        my ($m1, $m2) = ($lo + $third, $hi - $third);
        return $m1 if $a->[$m1] == $t;
        return $m2 if $a->[$m2] == $t;
        if    ($t < $a->[$m1]) { $hi = $m1 - 1 }
        elsif ($t > $a->[$m2]) { $lo = $m2 + 1 }
        else                   { ($lo, $hi) = ($m1 + 1, $m2 - 1) }
    }
    return -1;
}

sub argmax {    # maximum of a unimodal function on [lo, hi]
    my ($f, $lo, $hi) = @_;
    while ($hi - $lo > 1e-9) {
        my ($m1, $m2) = ($lo + ($hi - $lo) / 3, $hi - ($hi - $lo) / 3);
        if ($f->($m1) < $f->($m2)) { $lo = $m1 } else { $hi = $m2 }
    }
    return ($lo + $hi) / 2;
}

my @a = map { 2 * $_ + 1 } 0 .. 8;
print join(' ', map { ternary_search(\@a, $_) } 1, 9, 17, 4), "\n";
printf "argmax of -(x-2)^2+3 on [-10,10]: %.6f\n", argmax(sub { -($_[0] - 2)**2 + 3 }, -10, 10);
