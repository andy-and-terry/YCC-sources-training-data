use strict;
use warnings;

# Disarium numbers: digits raised to their 1-based positions sum to n.
sub is_disarium {
    my $n = shift;
    my @d = split //, $n;
    my $sum = 0;
    $sum += $d[$_]**($_ + 1) for 0 .. $#d;
    return $sum == $n;
}

print join(" ", grep { is_disarium($_) } 1 .. 999), "\n";
