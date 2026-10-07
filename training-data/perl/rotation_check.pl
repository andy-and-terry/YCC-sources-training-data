use strict;
use warnings;

sub is_rotation {
    my ($a, $b) = @_;
    return (length $a == length $b && index($a . $a, $b) >= 0) ? 1 : 0;
}

print is_rotation('waterbottle', 'erbottlewat'), ' ', is_rotation('abc', 'acb'), "\n";
