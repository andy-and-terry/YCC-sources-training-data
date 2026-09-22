use strict;
use warnings;

sub heapify {
    my ($arr, $n, $i) = @_;
    my $largest = $i;
    my $left    = 2 * $i + 1;
    my $right   = 2 * $i + 2;
    $largest = $left  if $left  < $n && $arr->[$left]  > $arr->[$largest];
    $largest = $right if $right < $n && $arr->[$right] > $arr->[$largest];
    if ($largest != $i) {
        @{$arr}[$i, $largest] = @{$arr}[$largest, $i];
        heapify($arr, $n, $largest);
    }
}

sub heap_sort {
    my ($arr) = @_;
    my $n = scalar @$arr;
    for (my $i = int($n / 2) - 1; $i >= 0; $i--) {
        heapify($arr, $n, $i);
    }
    for (my $i = $n - 1; $i > 0; $i--) {
        @{$arr}[0, $i] = @{$arr}[$i, 0];
        heapify($arr, $i, 0);
    }
}

my @data = (5, 2, 9, 1, 5, 6, 3);
heap_sort(\@data);
print join(" ", @data), "\n";
