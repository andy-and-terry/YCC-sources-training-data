use strict;
use warnings;

sub bubble_sort {
    my @arr = @_;
    for my $i (0 .. $#arr - 1) {
        for my $j (0 .. $#arr - $i - 1) {
            if ($arr[$j] > $arr[$j + 1]) {
                @arr[$j, $j + 1] = @arr[$j + 1, $j];
            }
        }
    }
    return @arr;
}

print join(" ", bubble_sort(5, 2, 9, 1, 5, 6)), "\n";
