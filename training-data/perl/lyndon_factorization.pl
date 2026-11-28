use strict; use warnings;
sub duval {
    my @s = split //, shift;
    my (@out, $i);
    $i = 0;
    while ($i < @s) {
        my ($j, $k) = ($i + 1, $i);
        while ($j < @s && $s[$k] le $s[$j]) {
            $k = ($s[$k] lt $s[$j]) ? $i : $k + 1;
            $j++;
        }
        while ($i <= $k) {
            push @out, join('', @s[$i .. $i + $j - $k - 1]);
            $i += $j - $k;
        }
    }
    @out;
}
print join(' ', duval('banana')), "\n";
