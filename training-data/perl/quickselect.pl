use strict;
use warnings;

sub quickselect {
    my ($arr_ref, $k) = @_;
    my @arr = @$arr_ref;
    return _select(\@arr, 0, $#arr, $k);
}

sub _select {
    my ($arr, $lo, $hi, $k) = @_;
    if ($lo == $hi) {
        return $arr->[$lo];
    }
    my $pivot_index = _partition($arr, $lo, $hi);
    if ($k == $pivot_index) {
        return $arr->[$k];
    } elsif ($k < $pivot_index) {
        return _select($arr, $lo, $pivot_index - 1, $k);
    } else {
        return _select($arr, $pivot_index + 1, $hi, $k);
    }
}

sub _partition {
    my ($arr, $lo, $hi) = @_;
    my $pivot = $arr->[$hi];
    my $i = $lo;
    for my $j ($lo .. $hi - 1) {
        if ($arr->[$j] <= $pivot) {
            @{$arr}[$i, $j] = @{$arr}[$j, $i];
            $i++;
        }
    }
    @{$arr}[$i, $hi] = @{$arr}[$hi, $i];
    return $i;
}

my @numbers = (7, 10, 4, 3, 20, 15);
print quickselect(\@numbers, 0), "\n";
print quickselect(\@numbers, 2), "\n";
print quickselect(\@numbers, 5), "\n";
