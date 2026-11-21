use strict;
use warnings;
use List::Util qw(sum);

# Munchausen numbers: sum of digit**digit equals n (0**0 counted as 0).
sub is_munchausen {
    my $n = shift;
    return sum(map { $_ == 0 ? 0 : $_**$_ } split //, $n) == $n;
}

print join(" ", grep { is_munchausen($_) } 1 .. 4999), "\n";
