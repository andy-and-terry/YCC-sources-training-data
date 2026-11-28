use strict;
use warnings;

sub affine {
    my ($s, $a, $b, $decrypt) = @_;
    my ($inv) = grep { $a * $_ % 26 == 1 } 1 .. 25;
    $s =~ s{([A-Z])}{
        my $x = ord($1) - 65;
        my $y = $decrypt ? ($inv * ($x - $b)) % 26 : ($a * $x + $b) % 26;
        chr($y + 65)
    }ge;
    return $s;
}

my $c = affine("AFFINE", 5, 8);
print "$c ", affine($c, 5, 8, 1), "\n";
