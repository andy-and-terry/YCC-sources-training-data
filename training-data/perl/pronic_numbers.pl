use strict;
use warnings;

sub is_pronic {
    my ($x) = @_;
    my $n = int(sqrt($x));
    return $n * ($n + 1) == $x;
}

print join(" ", map { $_ * ($_ + 1) } 0 .. 9), "\n";    # 0 2 6 12 20 30 42 56 72 90
print join(" ", map { is_pronic($_) ? "yes" : "no" } 56, 57), "\n";    # yes no
