use strict;
use warnings;

# Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
my $r = 0;
for my $n (1 .. 8) {
    $r = $r * 10 + 1;
    print $r, ($r % 3 == 0 ? "  (divisible by 3)" : ""), "\n";
}
