use strict;
use warnings;

sub step {
    my @g = @_;
    my ($h, $w) = (scalar @g, scalar @{ $g[0] });
    my @next;
    for my $r (0 .. $h - 1) {
        for my $c (0 .. $w - 1) {
            my $n = 0;
            for my $dr (-1 .. 1) {
                for my $dc (-1 .. 1) {
                    next unless $dr || $dc;
                    $n += $g[ ($r + $dr) % $h ][ ($c + $dc) % $w ];    # toroidal wrap
                }
            }
            $next[$r][$c] = ($n == 3 || ($n == 2 && $g[$r][$c])) ? 1 : 0;
        }
    }
    return @next;
}

my @g = map { [map { $_ eq '#' ? 1 : 0 } split //] } split /\n/, <<'GRID';
.#......
..#.....
###.....
........
........
........
GRID
for my $gen (0 .. 4) {
    print "gen $gen\n", map { join('', map { $_ ? '#' : '.' } @$_) . "\n" } @g;
    @g = step(@g);
}
