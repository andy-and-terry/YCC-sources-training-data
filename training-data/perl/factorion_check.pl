use strict;
use warnings;

my @fact = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880);

sub is_factorion {
    my ($n) = @_;
    my $sum = 0;
    $sum += $fact[$_] for split //, $n;
    return $sum == $n;
}

print join(" ", grep { is_factorion($_) } 1 .. 49999), "\n";
