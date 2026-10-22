use strict;
use warnings;

# Farey sequence F_n via the next-term recurrence.
sub farey {
    my ($n) = @_;
    my ($a, $b, $c, $d) = (0, 1, 1, $n);
    my @out = ("0/1");
    while ($c <= $n) {
        my $k = int(($n + $b) / $d);
        ($a, $b, $c, $d) = ($c, $d, $k * $c - $a, $k * $d - $b);
        push @out, "$a/$b";
        last if $a == 1 && $b == 1;
    }
    return @out;
}

print join(" ", farey(5)), "\n";
