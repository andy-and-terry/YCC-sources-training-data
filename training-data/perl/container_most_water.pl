use strict;
use warnings;
use List::Util qw(min max);

sub max_area {
    my @h = @_;
    my ($lo, $hi, $best) = (0, $#h, 0);
    while ($lo < $hi) {
        $best = max($best, min($h[$lo], $h[$hi]) * ($hi - $lo));
        if ($h[$lo] < $h[$hi]) { $lo++ } else { $hi-- }
    }
    return $best;
}

print max_area(1, 8, 6, 2, 5, 4, 8, 3, 7), "\n";    # 49
