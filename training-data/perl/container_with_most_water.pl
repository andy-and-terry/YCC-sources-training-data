use strict;
use warnings;
use List::Util qw(min);

sub max_area {
    my @h = @_;
    my ($l, $r, $best, @at) = (0, $#h, 0);
    while ($l < $r) {
        my $area = ($r - $l) * min($h[$l], $h[$r]);
        ($best, @at) = ($area, $l, $r) if $area > $best;
        $h[$l] < $h[$r] ? $l++ : $r--;
    }
    return ($best, @at);
}

my ($area, $i, $j) = max_area(1, 8, 6, 2, 5, 4, 8, 3, 7);
print "max area $area between $i and $j\n";
