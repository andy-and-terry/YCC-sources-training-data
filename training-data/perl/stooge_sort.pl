use strict;
use warnings;

sub stooge_sort {
    my ($a, $lo, $hi) = @_;
    @$a[$lo, $hi] = @$a[$hi, $lo] if $a->[$lo] > $a->[$hi];
    if ($hi - $lo + 1 > 2) {
        my $t = int(($hi - $lo + 1) / 3);
        stooge_sort($a, $lo, $hi - $t);
        stooge_sort($a, $lo + $t, $hi);
        stooge_sort($a, $lo, $hi - $t);
    }
}

my @data = (5, -2, 9, 0, 3, 3, 8, 1);
stooge_sort(\@data, 0, $#data);
print "@data\n";
