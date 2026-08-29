use strict;
use warnings;

sub edit_distance {
    my ($a, $b) = @_;
    my $m = length($a);
    my $n = length($b);
    my @table;
    $table[$_][0] = $_ for 0 .. $m;
    $table[0][$_] = $_ for 0 .. $n;
    for my $i (1 .. $m) {
        for my $j (1 .. $n) {
            my $cost = substr($a, $i - 1, 1) eq substr($b, $j - 1, 1) ? 0 : 1;
            my $min_val = $table[$i - 1][$j] + 1;
            $min_val = $table[$i][$j - 1] + 1 if $table[$i][$j - 1] + 1 < $min_val;
            $min_val = $table[$i - 1][$j - 1] + $cost if $table[$i - 1][$j - 1] + $cost < $min_val;
            $table[$i][$j] = $min_val;
        }
    }
    return $table[$m][$n];
}

print edit_distance("kitten", "sitting"), "\n";
