use strict;
use warnings;

sub is_armstrong {
    my ($n) = @_;
    my @d = split //, $n;
    my $sum = 0;
    $sum += $_ ** @d for @d;
    return $sum == $n;
}

print join(" ", grep { is_armstrong($_) } 1 .. 999), "\n";    # 1..9 153 370 371 407
