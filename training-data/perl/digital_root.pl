use strict;
use warnings;
use List::Util qw(sum);

sub digital_root_loop {
    my $n = shift;
    my $persistence = 0;
    while ($n >= 10) { $n = sum(split //, $n); $persistence++ }
    return ($n, $persistence);
}

sub digital_root { my $n = shift; $n == 0 ? 0 : 1 + ($n - 1) % 9 }

for my $n (0, 16, 942, 132189, 493193, 999999999999) {
    my ($r, $p) = digital_root_loop($n);
    printf "%-13s root=%d formula=%d persistence=%d\n", $n, $r, digital_root($n), $p;
}
