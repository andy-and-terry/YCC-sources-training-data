use strict;
use warnings;

sub to_gray   { $_[0] ^ ($_[0] >> 1) }
sub from_gray { my $g = shift; my $n = $g; $n ^= $g while $g >>= 1; $n }

sub reflect { my $n = shift; return ('') if $n == 0; my @p = reflect($n - 1); ((map { "0$_" } @p), (map { "1$_" } reverse @p)) }

for my $i (0 .. 7) {
    my $g = to_gray($i);
    printf "%d  %03b  gray=%03b  back=%d\n", $i, $i, $g, from_gray($g);
}
print join(' ', reflect(3)), "\n";
