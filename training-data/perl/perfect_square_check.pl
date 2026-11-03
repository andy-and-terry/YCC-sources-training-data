use strict;
use warnings;

sub is_perfect_square {
    my ($n) = @_;
    return 0 if $n < 0;
    my $r = int(sqrt($n) + 0.5);
    return $r * $r == $n;
}

print join(" ", grep { is_perfect_square($_) } 0 .. 29), "\n";
