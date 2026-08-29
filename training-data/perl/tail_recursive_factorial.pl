use strict;
use warnings;

sub factorial {
    my $n = shift;
    my $result = 1;
    $result *= $_ for 1 .. $n;
    return $result;
}

print factorial(10), "\n";
