use strict;
use warnings;

sub digit_sum {
    my $n = shift;
    my $total = 0;
    while ($n > 0) {
        $total += $n % 10;
        $n = int($n / 10);
    }
    return $total;
}

print digit_sum(12345), "\n";
