use strict;
use warnings;

# Derangement counts: D(n) = (n-1) * (D(n-1) + D(n-2)).
sub derangements {
    my ($n) = @_;
    my ($a, $b) = (1, 0);
    return $a if $n == 0;
    for my $i (2 .. $n) {
        ($a, $b) = ($b, ($i - 1) * ($a + $b));
    }
    return $b;
}

print join(" ", map { derangements($_) } 0 .. 7), "\n";
