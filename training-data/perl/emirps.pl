use strict; use warnings;
sub is_prime { my $n = shift; return 0 if $n < 2; for (my $i = 2; $i * $i <= $n; $i++) { return 0 if $n % $i == 0 } 1 }
my @out;
for (my $n = 2; @out < 10; $n++) {
    my $r = reverse $n;
    push @out, $n if $r != $n && is_prime($n) && is_prime($r);
}
print "@out\n"; # 13 17 31 37 71 73 79 97 107 113
