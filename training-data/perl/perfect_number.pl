use strict;
use warnings;

sub divisor_sum {
    my $n = shift;
    return 0 if $n < 2;
    my $sum = 1;
    for (my $i = 2; $i * $i <= $n; $i++) {
        next if $n % $i;
        $sum += $i;
        $sum += $n / $i if $i != $n / $i;
    }
    return $sum;
}

sub classify { (qw(perfect abundant deficient))[ divisor_sum($_[0]) <=> $_[0] ] }

print 'perfect < 10000: ', join(', ', grep { divisor_sum($_) == $_ } 2 .. 9999), "\n";
print "$_ is ", classify($_), "\n" for 12, 28, 35;
