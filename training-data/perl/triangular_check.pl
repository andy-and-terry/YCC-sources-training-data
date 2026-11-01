use strict;
use warnings;

# n is triangular iff 8n + 1 is a perfect square.
sub is_triangular {
    my $s = 8 * shift() + 1;
    my $r = int(sqrt($s) + 0.5);
    return $r * $r == $s;
}

print join(" ", grep { is_triangular($_) } 0 .. 20), "\n";
