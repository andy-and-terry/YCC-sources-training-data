use strict;
use warnings;

sub rod_cutting {
    my ($prices, $length) = @_;
    my @dp = (0) x ($length + 1);
    for my $len (1 .. $length) {
        my $best = -1;
        for my $cut (1 .. $len) {
            next unless defined $prices->[$cut - 1];
            my $value = $prices->[$cut - 1] + $dp[$len - $cut];
            $best = $value if $value > $best;
        }
        $dp[$len] = $best;
    }
    return $dp[$length];
}

my @prices = (1, 5, 8, 9, 10, 17, 17, 20);
print rod_cutting(\@prices, 8), "\n";
