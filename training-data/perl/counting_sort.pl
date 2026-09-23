use strict;
use warnings;

sub counting_sort {
    my @arr = @_;
    return @arr unless @arr;
    my $max = $arr[0];
    for my $val (@arr) {
        $max = $val if $val > $max;
    }
    my @counts = (0) x ($max + 1);
    $counts[$_]++ for @arr;
    my @result;
    for my $value (0 .. $max) {
        push @result, ($value) x $counts[$value];
    }
    return @result;
}

my @data = (4, 2, 2, 8, 3, 3, 1, 0);
print join(",", counting_sort(@data)), "\n";
