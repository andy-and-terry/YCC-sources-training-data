use strict;
use warnings;

my $RUN = 8;

sub insertion_sort {
    my ($a, $lo, $hi) = @_;
    for my $i ($lo + 1 .. $hi) {
        my $x = $a->[$i];
        my $j = $i - 1;
        $a->[$j + 1] = $a->[$j], $j-- while $j >= $lo && $a->[$j] > $x;
        $a->[$j + 1] = $x;
    }
}

sub merge_runs {
    my ($a, $lo, $mid, $hi) = @_;
    my @l = @$a[$lo .. $mid];
    my @r = @$a[$mid + 1 .. $hi];
    my $k = $lo;
    $a->[$k++] = $l[0] <= $r[0] ? shift @l : shift @r while @l && @r;
    $a->[$k++] = $_ for @l, @r;
}

sub tim_sort {
    my @a = @_;
    my $n = @a;
    for (my $lo = 0; $lo < $n; $lo += $RUN) {
        insertion_sort(\@a, $lo, $lo + $RUN - 1 < $n - 1 ? $lo + $RUN - 1 : $n - 1);
    }
    for (my $size = $RUN; $size < $n; $size *= 2) {
        for (my $lo = 0; $lo < $n; $lo += 2 * $size) {
            my $mid = $lo + $size - 1;
            my $hi = $lo + 2 * $size - 1 < $n - 1 ? $lo + 2 * $size - 1 : $n - 1;
            merge_runs(\@a, $lo, $mid, $hi) if $mid < $hi;
        }
    }
    return @a;
}

srand 7;
my @data = map { int rand 100 } 1 .. 30;
my @sorted = tim_sort(@data);
print "@sorted\n", 'matches sort: ', ("@sorted" eq join(' ', sort { $a <=> $b } @data) ? 'yes' : 'no'), "\n";
