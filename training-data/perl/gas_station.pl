use strict;
use warnings;

sub can_complete {
    my ($gas, $cost) = @_;
    my ($total, $tank, $start) = (0, 0, 0);
    for my $i (0 .. $#$gas) {
        my $d = $gas->[$i] - $cost->[$i];
        $total += $d;
        $tank += $d;
        ($tank, $start) = (0, $i + 1) if $tank < 0;
    }
    return $total >= 0 ? $start : -1;
}

print can_complete([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]), ' ', can_complete([2, 3, 4], [3, 4, 3]), "\n";
