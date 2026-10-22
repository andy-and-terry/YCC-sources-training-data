use strict;
use warnings;

# a(n) = 1 + a(n - a(a(n-1))), 1-based indexing
sub golomb {
    my ($count) = @_;
    my @a = (0, 1);
    $a[$_] = 1 + $a[$_ - $a[$a[$_ - 1]]] for 2 .. $count;
    return @a[1 .. $count];
}

print join(" ", golomb(20)), "\n";
