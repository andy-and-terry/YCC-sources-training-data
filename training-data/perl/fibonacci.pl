use strict;
use warnings;

sub fibonacci {
    my ($n) = @_;
    my @result;
    my ($a, $b) = (0, 1);
    for (1 .. $n) {
        push @result, $a;
        ($a, $b) = ($b, $a + $b);
    }
    return @result;
}

print join(" ", fibonacci(11)), "\n";
