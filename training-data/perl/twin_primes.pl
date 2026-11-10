use strict; use warnings;
my $limit = 80;
my @composite;
for my $i (2 .. int(sqrt $limit)) {
    next if $composite[$i];
    for (my $j = $i * $i; $j <= $limit; $j += $i) { $composite[$j] = 1 }
}
my @pairs = map { "($_," . ($_ + 2) . ")" }
            grep { !$composite[$_] && !$composite[$_ + 2] } 3 .. $limit - 2;
print "@pairs\n"; # (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
