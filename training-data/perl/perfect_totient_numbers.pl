use strict;
use warnings;

# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
sub gcd { my ($a, $b) = @_; ($a, $b) = ($b, $a % $b) while $b; return $a }

sub phi {
    my $n = shift;
    return scalar grep { gcd($_, $n) == 1 } 1 .. $n;
}

sub is_perfect_totient {
    my $n = shift;
    my ($total, $m) = (0, $n);
    while ($m > 1) { $m = phi($m); $total += $m }
    return $total == $n;
}

print join(" ", grep { is_perfect_totient($_) } 2 .. 199), "\n";
