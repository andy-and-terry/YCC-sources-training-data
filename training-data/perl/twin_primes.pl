use strict;
use warnings;

my $n = 50;
my @composite;
for my $i (2 .. int(sqrt $n)) {
    next if $composite[$i];
    for (my $j = $i * $i; $j <= $n; $j += $i) { $composite[$j] = 1 }
}
for my $p (3 .. $n - 2) {
    print "($p, ", $p + 2, ") " unless $composite[$p] || $composite[$p + 2];
}
print "\n";
