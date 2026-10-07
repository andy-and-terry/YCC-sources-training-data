use strict;
use warnings;

sub oranges_rotting {
    my @g = map { [@$_] } @_;
    my ($fresh, @queue) = (0);
    for my $r (0 .. $#g) {
        for my $c (0 .. $#{ $g[$r] }) {
            push @queue, [$r, $c, 0] if $g[$r][$c] == 2;
            $fresh++ if $g[$r][$c] == 1;
        }
    }
    my $minutes = 0;
    while (my $p = shift @queue) {
        my ($r, $c, $t) = @$p;
        $minutes = $t;
        for ([1, 0], [-1, 0], [0, 1], [0, -1]) {
            my ($nr, $nc) = ($r + $_->[0], $c + $_->[1]);
            next if $nr < 0 || $nc < 0 || $nr > $#g || $nc > $#{ $g[$nr] } || $g[$nr][$nc] != 1;
            $g[$nr][$nc] = 2;
            $fresh--;
            push @queue, [$nr, $nc, $t + 1];
        }
    }
    return $fresh ? -1 : $minutes;
}

print join(' ', oranges_rotting([2, 1, 1], [1, 1, 0], [0, 1, 1]), oranges_rotting([2, 1, 1], [0, 1, 1], [1, 0, 1]), oranges_rotting([0, 2])), "\n";
