use strict;
use warnings;

# n-th s-gonal number: ((s - 2) n^2 - (s - 4) n) / 2
sub polygonal {
    my ($s, $n) = @_;
    return (($s - 2) * $n * $n - ($s - 4) * $n) / 2;
}

my @kinds = (["triangular", 3], ["pentagonal", 5], ["hexagonal", 6]);
for my $k (@kinds) {
    my ($name, $s) = @$k;
    print "$name: ", join(" ", map { polygonal($s, $_) } 1 .. 10), "\n";
}
