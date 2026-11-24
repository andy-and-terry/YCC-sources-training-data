use strict;
use warnings;

# Aliquot sequence: replace n by the sum of its proper divisors.
sub aliquot_sum {
    my ($n) = @_;
    my $s = 0;
    for my $d (1 .. int($n / 2)) { $s += $d if $n % $d == 0 }
    return $s;
}

my @seq = (12);
push @seq, aliquot_sum($seq[-1]) while $seq[-1] > 1 && @seq < 20;
print "@seq\n";
