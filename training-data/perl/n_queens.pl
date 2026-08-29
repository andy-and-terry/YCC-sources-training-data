use strict;
use warnings;

sub is_safe {
    my ($queens, $col) = @_;
    for my $i (0 .. $#$queens) {
        my $dist = @$queens - $i;
        return 0 if $queens->[$i] == $col || abs($queens->[$i] - $col) == $dist;
    }
    return 1;
}

sub solve {
    my ($queens, $n) = @_;
    return 1 if @$queens == $n;
    my $count = 0;
    for my $col (0 .. $n - 1) {
        if (is_safe($queens, $col)) {
            $count += solve([@$queens, $col], $n);
        }
    }
    return $count;
}

print solve([], 6), "\n";
