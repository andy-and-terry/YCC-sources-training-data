use strict;
use warnings;

my @rows = (['apple', 3], ['kiwi', 12], ['watermelon', 7]);

my $w = 0;
for my $r (@rows) {
    $w = length $r->[0] if length $r->[0] > $w;
}

printf "%-*s | %3d\n", $w, $_->[0], $_->[1] for @rows;
printf "%.*f\n", 2, 3.14159;
printf "%0*d\n", 6, 42;
