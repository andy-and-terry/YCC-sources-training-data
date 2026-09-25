use strict;
use warnings;

sub islands {
    my @g = map { [@$_] } @_;
    my ($rows, $cols) = (scalar @g, scalar @{ $g[0] });
    my $cell = sub { my ($r, $c) = @_; $r >= 0 && $c >= 0 && $r < $rows && $c < $cols ? $g[$r][$c] : 0 };
    my @result;
    for my $r (0 .. $rows - 1) {
        for my $c (0 .. $cols - 1) {
            next unless $g[$r][$c] == 1;
            my ($area, $perim, @stack) = (0, 0, [$r, $c]);
            $g[$r][$c] = 2;
            while (my $p = pop @stack) {
                my ($y, $x) = @$p;
                $area++;
                for ([1, 0], [-1, 0], [0, 1], [0, -1]) {
                    my ($ny, $nx) = ($y + $_->[0], $x + $_->[1]);
                    my $v = $cell->($ny, $nx);
                    if ($v == 0) { $perim++ }
                    elsif ($v == 1) { $g[$ny][$nx] = 2; push @stack, [$ny, $nx] }
                }
            }
            push @result, [$area, $perim];
        }
    }
    return @result;
}

my @grid = ([0, 1, 0, 0, 1], [1, 1, 1, 0, 1], [0, 1, 0, 0, 0], [1, 1, 0, 1, 1]);
my @isl = islands(@grid);
printf "%d islands: %s\n", scalar @isl, join(', ', map { "area $_->[0]/perimeter $_->[1]" } @isl);
