use strict;
use warnings;

sub cube_from_odds {
    my ($n) = @_;
    my $start = $n * $n - $n + 1;
    my $sum = 0;
    $sum += $start + 2 * $_ for 0 .. $n - 1;
    return $sum;
}

for my $n (1 .. 5) {
    printf "%d %d %s\n", $n, cube_from_odds($n), cube_from_odds($n) == $n**3 ? "true" : "false";
}
