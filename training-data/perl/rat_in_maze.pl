use strict;
use warnings;

my %MOVES = (D => [1, 0], L => [0, -1], R => [0, 1], U => [-1, 0]);

sub solve_maze {
    my @maze = @_;
    my $n = @maze;
    my (@paths, %seen);
    my $dfs;
    $dfs = sub {
        my ($r, $c, $path) = @_;
        return push @paths, $path if $r == $n - 1 && $c == $n - 1;
        $seen{"$r,$c"} = 1;
        for my $dir (sort keys %MOVES) {
            my ($nr, $nc) = ($r + $MOVES{$dir}[0], $c + $MOVES{$dir}[1]);
            next if $nr < 0 || $nc < 0 || $nr >= $n || $nc >= $n;
            $dfs->($nr, $nc, $path . $dir) if $maze[$nr][$nc] && !$seen{"$nr,$nc"};
        }
        delete $seen{"$r,$c"};
    };
    $dfs->(0, 0, '') if $maze[0][0];
    undef $dfs;
    return @paths;
}

print join(' ', solve_maze([1, 0, 0, 0], [1, 1, 0, 1], [1, 1, 0, 0], [0, 1, 1, 1])), "\n";
