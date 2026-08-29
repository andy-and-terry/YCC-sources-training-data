use strict;
use warnings;

sub my_power {
    my ($base, $exp) = @_;
    return 1 if $exp == 0;
    if ($exp % 2 == 0) {
        my $half = my_power($base, $exp / 2);
        return $half * $half;
    }
    return $base * my_power($base, $exp - 1);
}

print my_power(2, 10), "\n";
print my_power(3, 5), "\n";
