# Squarefree numbers up to 100; expect 61.
use strict; use warnings;
sub squarefree {
    my $n = shift;
    for (my $d = 2; $d * $d <= $n; $d++) { return 0 if $n % ($d * $d) == 0 }
    return 1;
}
my $c = grep { squarefree($_) } 1 .. 100;
print "$c\n";
