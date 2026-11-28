use strict;
use warnings;

sub is_prime {
    my $n = shift;
    return 0 if $n < 2;
    for (my $i = 2; $i * $i <= $n; $i++) { return 0 if $n % $i == 0 }
    return 1;
}

my @out = grep {
    my $r = reverse $_;
    $r != $_ && is_prime($_) && is_prime($r);
} 2 .. 99;
print "@out\n";
