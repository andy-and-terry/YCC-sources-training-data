use strict;
use warnings;

sub count_primes_below {
    my ($n) = @_;
    return 0 if $n < 3;
    my @composite;
    my $count = 0;
    for my $i (2 .. $n - 1) {
        next if $composite[$i];
        $count++;
        for (my $j = $i * $i; $j < $n; $j += $i) { $composite[$j] = 1 }
    }
    return $count;
}

print count_primes_below(100), "\n";
