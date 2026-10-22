use strict;
use warnings;

sub proper_divisor_sum {
    my ($n) = @_;
    my $total = 0;
    for my $d (1 .. $n - 1) {
        $total += $d if $n % $d == 0;
    }
    return $total;
}

sub aliquot {
    my ($start) = @_;
    my @seq = ($start);
    push @seq, proper_divisor_sum($seq[-1]) while $seq[-1] != 0;
    return @seq;
}

print join(" ", aliquot(12)), "\n";
