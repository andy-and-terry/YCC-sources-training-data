use strict;
use warnings;

sub persistence {
    my ($n) = @_;
    my $steps = 0;
    while ($n >= 10) {
        my $product = 1;
        $product *= $_ for split //, $n;
        $n = $product;
        $steps++;
    }
    return $steps;
}

print "$_ ", persistence($_), "\n" for (39, 77, 999, 10);
