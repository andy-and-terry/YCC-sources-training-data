use strict;
use warnings;

sub factorize {
    my ($n) = @_;
    my @factors;
    for (my $p = 2; $p * $p <= $n; $p++) {
        while ($n % $p == 0) {
            push @factors, $p;
            $n /= $p;
        }
    }
    push @factors, $n if $n > 1;
    return @factors;
}

for my $n (360, 97, 1001) {
    print "$n = ", join(" * ", factorize($n)), "\n";
}
