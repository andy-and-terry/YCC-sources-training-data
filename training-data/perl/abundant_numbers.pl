use strict;
use warnings;

sub divisor_sum {
    my ($n) = @_;
    my $s = 0;
    $n % $_ == 0 and $s += $_ for 1 .. $n - 1;
    return $s;
}

print join(" ", grep { divisor_sum($_) > $_ } 1 .. 59), "\n";
