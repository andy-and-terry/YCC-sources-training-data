use strict;
use warnings;

sub aliquot_sum {
    my $n = shift;
    return 0 if $n == 1;
    my $sum = 1;
    for (my $i = 2; $i * $i <= $n; $i++) {
        next if $n % $i;
        $sum += $i;
        $sum += $n / $i if $i != $n / $i;
    }
    return $sum;
}

sub classify {
    my $n = shift;
    return qw(perfect abundant deficient)[ (aliquot_sum($n) <=> $n) ];
}

print "$_ ", classify($_), "\n" for 6, 12, 28, 13, 8128;
