use strict;
use warnings;

sub odd_even_sort {
    my @a = @_;
    my $sorted = 0;
    until ($sorted) {
        $sorted = 1;
        for my $start (1, 0) {
            for (my $i = $start; $i < $#a; $i += 2) {
                next unless $a[$i] > $a[$i + 1];
                @a[$i, $i + 1] = @a[$i + 1, $i];
                $sorted = 0;
            }
        }
    }
    return @a;
}

print join(' ', odd_even_sort(34, 2, 10, -9, 7, 7, 0, 15)), "\n";
