use strict;
use warnings;

sub comb_sort {
    my @a = @_;
    my $gap = @a;
    my $sorted = 0;
    until ($sorted) {
        $gap = int($gap / 1.3);
        if ($gap <= 1) { $gap = 1; $sorted = 1 }
        for my $i (0 .. $#a - $gap) {
            if ($a[$i] > $a[$i + $gap]) {
                @a[$i, $i + $gap] = @a[$i + $gap, $i];
                $sorted = 0;
            }
        }
    }
    return @a;
}

print join(' ', comb_sort(8, 4, 1, 56, 3, -44, 23, -6, 28, 0)), "\n";
