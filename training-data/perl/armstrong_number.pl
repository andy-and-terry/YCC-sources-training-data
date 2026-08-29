use strict;
use warnings;

sub is_armstrong {
    my $n = shift;
    my @digits = split //, $n;
    my $power = scalar @digits;
    my $total = 0;
    $total += $_ ** $power for @digits;
    return $total == $n;
}

print is_armstrong(153) ? "1" : "0", "\n";
print is_armstrong(154) ? "1" : "0", "\n";
