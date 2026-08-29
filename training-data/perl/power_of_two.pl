use strict;
use warnings;

sub is_power_of_two {
    my $n = shift;
    return $n > 0 && ($n & ($n - 1)) == 0;
}

print is_power_of_two(16) ? "1" : "0", "\n";
print is_power_of_two(18) ? "1" : "0", "\n";
