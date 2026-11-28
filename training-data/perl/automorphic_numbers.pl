use strict;
use warnings;

sub is_automorphic {
    my ($n) = @_;
    my $sq = $n * $n;
    return substr($sq, -length($n)) eq $n;
}

print join(" ", grep { is_automorphic($_) } 0 .. 999), "\n";    # 0 1 5 6 25 76 376 625
