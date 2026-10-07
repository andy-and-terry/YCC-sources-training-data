use strict;
use warnings;

my @DIGITS = (0 .. 9, 'a' .. 'z');

sub to_base {
    my ($n, $b) = @_;
    return '0' if $n == 0;
    my $neg = $n < 0;
    $n = abs $n;
    my $s = '';
    while ($n > 0) {
        $s = $DIGITS[$n % $b] . $s;
        $n = int($n / $b);
    }
    return ($neg ? '-' : '') . $s;
}

sub from_base {
    my ($s, $b) = @_;
    my $neg = $s =~ s/^-//;
    my $n = 0;
    for my $c (split //, lc $s) {
        my $d = $c =~ /\d/ ? $c : ord($c) - ord('a') + 10;
        die "bad digit $c\n" if $d >= $b;
        $n = $n * $b + $d;
    }
    return $neg ? -$n : $n;
}

for ([255, 2], [255, 16], [-42, 7], [123456789, 36]) {
    my ($n, $b) = @$_;
    my $s = to_base($n, $b);
    printf "%d base %d = %s (roundtrip %s)\n", $n, $b, $s, from_base($s, $b) == $n ? 'ok' : 'FAIL';
}
printf "sprintf: %b %o %x\n", 255, 255, 255;
