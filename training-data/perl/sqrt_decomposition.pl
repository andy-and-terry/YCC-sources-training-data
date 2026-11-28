use strict; use warnings;
my @a = (5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5);
my $bs = 4;
my @blk;
$blk[int($_ / $bs)] += $a[$_] for 0 .. $#a;
my ($l, $r, $sum) = (2, 9, 0);
for (my $i = $l; $i <= $r;) {
    if ($i % $bs == 0 && $i + $bs - 1 <= $r) { $sum += $blk[$i / $bs]; $i += $bs }
    else { $sum += $a[$i++] }
}
print "sum[$l..$r] = $sum\n";
