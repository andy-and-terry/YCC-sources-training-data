use strict;
use warnings;

sub is_sphenic {
    my ($n) = @_;
    my $distinct = 0;
    for (my $p = 2; $p * $p <= $n; $p++) {
        next if $n % $p;
        $n /= $p;
        return 0 if $n % $p == 0;
        $distinct++;
    }
    $distinct++ if $n > 1;
    return $distinct == 3;
}

print join(" ", grep { is_sphenic($_) } 2 .. 79), "\n";
