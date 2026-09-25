use strict;
use warnings;

sub flood_fill {
    my ($grid, $r, $c, $new) = @_;
    my $old = $grid->[$r][$c];
    return 0 if $old eq $new;
    my @stack = ([$r, $c]);
    my $filled = 0;
    while (my $p = pop @stack) {
        my ($y, $x) = @$p;
        next if $y < 0 || $x < 0 || $y > $#$grid || $x > $#{ $grid->[$y] } || $grid->[$y][$x] ne $old;
        $grid->[$y][$x] = $new;
        $filled++;
        push @stack, [$y + 1, $x], [$y - 1, $x], [$y, $x + 1], [$y, $x - 1];
    }
    return $filled;
}

my @grid = map { [split //] } split /\n/, <<'GRID';
..###.....
.#...#....
.#...#.##.
..###..#..
.......#..
GRID
my $n = flood_fill(\@grid, 1, 2, 'o');
print join('', @$_), "\n" for @grid;
print "filled $n cells\n";
