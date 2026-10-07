use strict;
use warnings;

sub interpolation_search {
    my ($a, $x) = @_;
    my ($lo, $hi) = (0, $#$a);
    while ($lo <= $hi && $x >= $a->[$lo] && $x <= $a->[$hi]) {
        return ($a->[$lo] == $x ? $lo : -1) if $a->[$hi] == $a->[$lo];
        my $pos = $lo + int(($x - $a->[$lo]) * ($hi - $lo) / ($a->[$hi] - $a->[$lo]));
        return $pos if $a->[$pos] == $x;
        if ($a->[$pos] < $x) { $lo = $pos + 1 } else { $hi = $pos - 1 }
    }
    return -1;
}

my @a = map { $_ * 10 + 5 } 0 .. 99;
print join(' ', map { interpolation_search(\@a, $_) } 5, 505, 995, 500, 1000), "\n";
my @same = (7) x 5;
print interpolation_search(\@same, 7), ' ', interpolation_search(\@same, 8), "\n";
