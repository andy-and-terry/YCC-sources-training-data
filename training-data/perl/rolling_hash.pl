use strict; use warnings;
my ($s, $k, $B, $M) = ("abcabc", 3, 31, 1000003);
my $pw = 1; $pw = $pw * $B % $M for 2 .. $k;
my $h = 0;
$h = ($h * $B + ord(substr($s, $_, 1))) % $M for 0 .. $k - 1;
print "0 $h\n";
for my $i (1 .. length($s) - $k) {
    $h = ($h - ord(substr($s, $i - 1, 1)) * $pw % $M + $M) % $M;
    $h = ($h * $B + ord(substr($s, $i + $k - 1, 1))) % $M;
    print "$i $h\n";
}
