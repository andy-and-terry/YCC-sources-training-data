use strict;
use warnings;

sub is_harshad {
    my ($n) = @_;
    my $s = 0;
    $s += $_ for split //, $n;
    return $n > 0 && $n % $s == 0;
}

print join(" ", grep { is_harshad($_) } 1 .. 49), "\n";
