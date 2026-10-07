use strict;
use warnings;

sub fibonacci_search {
    my ($a, $x) = @_;
    my $n = @$a;
    my ($f2, $f1) = (0, 1);
    my $f = $f2 + $f1;
    ($f2, $f1, $f) = ($f1, $f, $f1 + $f) while $f < $n;
    my $offset = -1;
    while ($f > 1) {
        my $i = $offset + $f2 < $n - 1 ? $offset + $f2 : $n - 1;
        if ($a->[$i] < $x)    { ($f, $f1, $f2) = ($f1, $f2, $f1 - $f2); $offset = $i }
        elsif ($a->[$i] > $x) { ($f, $f1, $f2) = ($f2, $f1 - $f2, 2 * $f2 - $f1) }
        else                  { return $i }
    }
    return $f1 && $offset + 1 < $n && $a->[$offset + 1] == $x ? $offset + 1 : -1;
}

my @a = (10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100);
print join(' ', map { fibonacci_search(\@a, $_) } @a, 11, 101), "\n";
