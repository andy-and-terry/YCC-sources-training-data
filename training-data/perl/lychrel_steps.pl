use strict;
use warnings;

# Reverse-and-add until a palindrome; count the steps.
sub steps {
    my $n = shift;
    for my $count (0 .. 49) {
        return $count if $count > 0 && $n eq reverse $n;
        $n += scalar reverse $n;
    }
    return -1;
}

print join(" ", map { steps($_) } 56, 57, 59, 79, 89), "\n";
