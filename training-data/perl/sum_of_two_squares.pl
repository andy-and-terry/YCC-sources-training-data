use strict;
use warnings;

# Positive n expressible as a*a + b*b with a, b >= 0.
sub representable {
    my $n = shift;
    for (my $a = 0; $a * $a <= $n; $a++) {
        my $b = int(sqrt($n - $a * $a) + 0.5);
        return 1 if $a * $a + $b * $b == $n;
    }
    return 0;
}

print join(" ", grep { representable($_) } 1 .. 30), "\n";
