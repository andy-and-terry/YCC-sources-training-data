use strict;
use warnings;

sub lah {
    my ($n, $k) = @_;
    my $c = 1;
    $c = $c * ($n - 1 - $_) / ($_ + 1) for 0 .. $k - 2;
    my $f = 1;
    $f *= $_ for $k + 1 .. $n;
    return $c * $f;
}

for my $n (1 .. 5) {
    print join(' ', map { lah($n, $_) } 1 .. $n), "\n";
}
