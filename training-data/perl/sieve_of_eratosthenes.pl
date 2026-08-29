use strict;
use warnings;

sub sieve {
    my $limit = shift;
    my @is_composite = (0) x ($limit + 1);
    for my $i (2 .. int(sqrt($limit))) {
        next if $is_composite[$i];
        for (my $j = $i * $i; $j <= $limit; $j += $i) {
            $is_composite[$j] = 1;
        }
    }
    return grep { !$is_composite[$_] } 2 .. $limit;
}

print join(" ", sieve(50)), "\n";
