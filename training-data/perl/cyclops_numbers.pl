use strict;
use warnings;

# Cyclops numbers: odd digit count, middle digit zero, no other zeros.
# Count those in 1..99999 (expected 6642).
sub is_cyclops {
    my $s = shift;
    my $len = length $s;
    my $zeros = () = $s =~ /0/g;
    return $len % 2 == 1 && substr($s, int($len / 2), 1) eq '0' && $zeros == 1;
}

print scalar(grep { is_cyclops($_) } 1 .. 99999), "\n";
