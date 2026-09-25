use strict;
use warnings;

sub lps {
    my ($s) = @_;
    my $n = length $s;
    return '' unless $n;
    my @c = split //, $s;
    my @dp;
    for my $i (reverse 0 .. $n - 1) {
        $dp[$i][$i] = 1;
        for my $j ($i + 1 .. $n - 1) {
            $dp[$i][$j] = $c[$i] eq $c[$j]
                ? ($i + 1 <= $j - 1 ? $dp[$i + 1][$j - 1] : 0) + 2
                : ($dp[$i + 1][$j] > $dp[$i][$j - 1] ? $dp[$i + 1][$j] : $dp[$i][$j - 1]);
        }
    }
    my ($l, $r, $i, $j) = ('', '', 0, $n - 1);
    while ($i <= $j) {
        if ($i == $j) { $l .= $c[$i]; last }
        if ($c[$i] eq $c[$j]) { $l .= $c[$i++]; $r = $c[$j--] . $r }
        elsif ($dp[$i + 1][$j] >= $dp[$i][$j - 1]) { $i++ }
        else { $j-- }
    }
    return $l . $r;
}

print "$_ -> ", lps($_), "\n" for qw(bbbab character agbdba cbbd);
