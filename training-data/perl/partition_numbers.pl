use strict;
use warnings;

# Integer partitions counted with a coin-style DP.
sub partitions {
    my ($n) = @_;
    my @ways = (1, (0) x $n);
    for my $part (1 .. $n) {
        $ways[$_] += $ways[$_ - $part] for $part .. $n;
    }
    return $ways[$n];
}

print join(" ", map { partitions($_) } 0 .. 9), "\n";
