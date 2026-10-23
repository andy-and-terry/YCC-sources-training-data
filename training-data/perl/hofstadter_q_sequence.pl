use strict;
use warnings;

# Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2)), Q(1) = Q(2) = 1
sub hofstadter_q {
    my ($count) = @_;
    my @q = (0, 1, 1);
    $q[$_] = $q[$_ - $q[$_ - 1]] + $q[$_ - $q[$_ - 2]] for 3 .. $count;
    return @q[1 .. $count];
}

print join(" ", hofstadter_q(20)), "\n";
