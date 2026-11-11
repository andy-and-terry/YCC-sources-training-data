use strict;
use warnings;

sub four_sum_count {
    my ($a, $b, $c, $d) = @_;
    my %sums;
    for my $x (@$a) { $sums{$x + $_}++ for @$b }
    my $count = 0;
    for my $x (@$c) { $count += $sums{-($x + $_)} // 0 for @$d }
    return $count;
}

print four_sum_count([1, 2], [-2, -1], [-1, 2], [0, 2]), "\n";    # 2
