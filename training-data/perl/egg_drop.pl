use strict;
use warnings;

# Minimum drops needed with $eggs eggs and $floors floors.
# dp over moves: f(m, e) = floors coverable with m moves and e eggs.
sub egg_drop {
    my ($eggs, $floors) = @_;
    my @f = (0) x ($eggs + 1);
    my $moves = 0;
    while ($f[$eggs] < $floors) {
        $moves++;
        $f[$_] = $f[$_] + $f[ $_ - 1 ] + 1 for reverse 1 .. $eggs;
    }
    return $moves;
}

printf "eggs=%d floors=%-6d -> %d drops\n", @$_, egg_drop(@$_) for [1, 10], [2, 10], [2, 100], [3, 100], [4, 5000];
