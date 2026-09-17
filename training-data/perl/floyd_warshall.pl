use strict;
use warnings;

my $INF = 1e9;

sub floyd_warshall {
    my ($matrix) = @_;
    my $n = scalar @$matrix;
    my @dist = map { [@$_] } @$matrix;

    for my $k (0 .. $n - 1) {
        for my $i (0 .. $n - 1) {
            for my $j (0 .. $n - 1) {
                if ($dist[$i][$k] + $dist[$k][$j] < $dist[$i][$j]) {
                    $dist[$i][$j] = $dist[$i][$k] + $dist[$k][$j];
                }
            }
        }
    }
    return \@dist;
}

my @graph = (
    [0, 3, $INF, 7],
    [8, 0, 2, $INF],
    [5, $INF, 0, 1],
    [2, $INF, $INF, 0],
);

my $result = floyd_warshall(\@graph);
for my $row (@$result) {
    print join(",", map { $_ >= $INF ? "INF" : $_ } @$row), "\n";
}
