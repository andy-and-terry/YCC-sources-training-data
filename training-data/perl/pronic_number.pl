use strict;
use warnings;

sub is_pronic {
    my ($n) = @_;
    my $k = int(sqrt($n));
    return $k * ($k + 1) == $n;
}

print join(" ", grep { is_pronic($_) } 0 .. 99), "\n";
