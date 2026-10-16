use strict;
use warnings;

my @grid = ([1, 2, 3], [4, -1, 6], [7, 8, 9]);

ROW:
for my $r (0 .. $#grid) {
    for my $c (0 .. $#{ $grid[$r] }) {
        if ($grid[$r][$c] < 0) {
            print "negative at ($r,$c), skipping row $r\n";
            next ROW;
        }
        print "visit ($r,$c) = $grid[$r][$c]\n";
    }
}

OUTER:
for my $x (1 .. 5) {
    for my $y (1 .. 5) {
        if ($x * $y == 12) {
            print "found $x * $y = 12\n";
            last OUTER;
        }
    }
}
