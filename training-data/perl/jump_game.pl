use strict;
use warnings;

sub can_jump {
    my $reach = 0;
    for my $i (0 .. $#_) {
        return 0 if $i > $reach;
        $reach = $i + $_[$i] if $i + $_[$i] > $reach;
    }
    return 1;
}

sub min_jumps {
    my ($jumps, $end, $far) = (0, 0, 0);
    for my $i (0 .. $#_ - 1) {
        $far = $i + $_[$i] if $i + $_[$i] > $far;
        if ($i == $end) {
            return -1 if $far <= $i;
            ($jumps, $end) = ($jumps + 1, $far);
        }
    }
    return $jumps;
}

for my $a ([2, 3, 1, 1, 4], [3, 2, 1, 0, 4], [2, 3, 0, 1, 4], [0]) {
    printf "%-12s can=%d min=%d\n", "@$a", can_jump(@$a), min_jumps(@$a);
}
