use strict;
use warnings;

sub alternating_digit_sum {
    my ($n) = @_;
    my ($total, $sign) = (0, 1);
    for my $d (reverse split //, $n) {
        $total += $sign * $d;
        $sign = -$sign;
    }
    return $total;
}

print "$_ ", alternating_digit_sum($_), "\n" for (1234, 99999, 1000);
