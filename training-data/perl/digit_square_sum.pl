use strict;
use warnings;
use List::Util qw(sum);

sub digit_square_sum {
    my ($n) = @_;
    return sum(map { $_ * $_ } split //, abs $n);
}

print digit_square_sum(123), "\n";
print digit_square_sum(-99), "\n";
