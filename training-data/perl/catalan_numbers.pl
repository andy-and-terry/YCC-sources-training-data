use strict;
use warnings;

my @catalan;
$catalan[0] = 1;
$catalan[1] = 1;
for my $n (2 .. 7) {
    $catalan[$n] = 0;
    for my $i (0 .. $n - 1) {
        $catalan[$n] += $catalan[$i] * $catalan[$n - 1 - $i];
    }
}
print "@catalan\n";
