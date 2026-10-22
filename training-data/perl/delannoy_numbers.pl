use strict;
use warnings;

sub central_delannoy {
    my ($count) = @_;
    my @grid;
    for my $m (0 .. $count - 1) {
        for my $n (0 .. $count - 1) {
            $grid[$m][$n] = ($m == 0 || $n == 0)
                ? 1
                : $grid[$m - 1][$n] + $grid[$m][$n - 1] + $grid[$m - 1][$n - 1];
        }
    }
    return map { $grid[$_][$_] } 0 .. $count - 1;
}

print join(" ", central_delannoy(10)), "\n";
