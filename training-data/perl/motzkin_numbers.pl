use strict;
use warnings;

# Motzkin numbers via recurrence.
sub motzkin {
    my ($n) = @_;
    my @m = (1, 1);
    for my $i (2 .. $n) {
        push @m, int((($i * 2 + 1) * $m[$i - 1] + 3 * ($i - 1) * $m[$i - 2]) / ($i + 2));
    }
    return $m[$n];
}

print join(" ", map { motzkin($_) } 0 .. 9), "\n";
