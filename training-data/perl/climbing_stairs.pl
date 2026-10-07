use strict;
use warnings;

sub climb_stairs {
    my ($n) = @_;
    return $n if $n <= 2;
    my ($a, $b) = (1, 2);
    for my $i (3 .. $n) {
        ($a, $b) = ($b, $a + $b);
    }
    return $b;
}

print climb_stairs(5), "\n";
print climb_stairs(10), "\n";
