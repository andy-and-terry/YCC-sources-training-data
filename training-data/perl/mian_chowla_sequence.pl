use strict;
use warnings;

# Greedy sequence whose pairwise sums are all distinct.
my @seq;
my %sums;
my $cand = 1;
while (@seq < 8) {
    my %fresh;
    my $ok = 1;
    for my $x (@seq, $cand) {
        my $s = $x + $cand;
        if ($sums{$s} || $fresh{$s}++) { $ok = 0; last; }
    }
    if ($ok) {
        push @seq, $cand;
        $sums{$_} = 1 for keys %fresh;
    }
    $cand++;
}
print "@seq\n";
