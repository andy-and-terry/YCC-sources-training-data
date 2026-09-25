use strict;
use warnings;

sub jump_search {
    my ($a, $x) = @_;
    my $n = @$a;
    my $step = int(sqrt $n) || 1;
    my ($prev, $cur) = (0, $step);
    while ($cur < $n && $a->[$cur - 1] < $x) {
        ($prev, $cur) = ($cur, $cur + $step);
    }
    $cur = $n if $cur > $n;
    for my $i ($prev .. $cur - 1) {
        return $i if $a->[$i] == $x;
        last if $a->[$i] > $x;
    }
    return -1;
}

my @a = (0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610);
print join(' ', map { jump_search(\@a, $_) } 0, 55, 610, 4, 700), "\n";
