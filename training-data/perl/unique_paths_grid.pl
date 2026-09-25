use strict;
use warnings;

sub unique_paths {
    my ($m, $n) = @_;
    my @row = (1) x $n;
    for (2 .. $m) { $row[$_] += $row[$_ - 1] for 1 .. $n - 1 }
    return $row[-1];
}

sub unique_paths_obstacles {
    my @grid = @_;
    my @row = (1, (0) x $#{ $grid[0] });
    for my $cells (@grid) {
        for my $c (0 .. $#$cells) {
            if ($cells->[$c]) { $row[$c] = 0 }
            elsif ($c)        { $row[$c] += $row[$c - 1] }
        }
    }
    return $row[-1];
}

print unique_paths(3, 7), ' ', unique_paths(10, 10), "\n";
print unique_paths_obstacles([0, 0, 0], [0, 1, 0], [0, 0, 0]), "\n";
