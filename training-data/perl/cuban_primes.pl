use strict;
use warnings;

sub is_prime {
    my $n = shift;
    return 0 if $n < 2;
    for (my $i = 2; $i * $i <= $n; $i++) { return 0 if $n % $i == 0 }
    return 1;
}

my @out;
for (my $y = 1; @out < 8; $y++) {
    my $p = 3 * $y * $y + 3 * $y + 1;
    push @out, $p if is_prime($p);
}
print "@out\n";
