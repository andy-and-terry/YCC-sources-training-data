use strict;
use warnings;

sub three_sum {
    my ($target, @n) = @_;
    @n = sort { $a <=> $b } @n;
    my @out;
    for my $i (0 .. $#n - 2) {
        next if $i && $n[$i] == $n[$i - 1];
        my ($l, $r) = ($i + 1, $#n);
        while ($l < $r) {
            my $sum = $n[$i] + $n[$l] + $n[$r];
            if    ($sum < $target) { $l++ }
            elsif ($sum > $target) { $r-- }
            else {
                push @out, [@n[$i, $l, $r]];
                $l++ while $l < $r && $n[$l] == $n[$l + 1];
                $r-- while $l < $r && $n[$r] == $n[$r - 1];
                $l++;
                $r--;
            }
        }
    }
    return @out;
}

sub show { join ' ', map { '[' . join(',', @$_) . ']' } @_ }
print show(three_sum(0, -1, 0, 1, 2, -1, -4)), "\n";
print show(three_sum(0, 0, 0, 0, 0)), "\n";
print show(three_sum(10, 1 .. 6)), "\n";
