use strict;
use warnings;

sub is_automorphic {
    my ($n) = @_;
    return ($n * $n) =~ /\Q$n\E$/ ? 1 : 0;
}

print join(" ", grep { is_automorphic($_) } 1 .. 999), "\n";
