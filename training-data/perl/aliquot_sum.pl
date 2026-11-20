# Aliquot sum classification.
use strict; use warnings;
use List::Util qw(sum0);
sub aliquot { my $n = shift; sum0 grep { $n % $_ == 0 } 1 .. $n - 1 }
for my $n (6, 12, 15, 28) {
    my $a = aliquot($n);
    print "$n $a ", ($a == $n ? "perfect" : $a > $n ? "abundant" : "deficient"), "\n";
}
