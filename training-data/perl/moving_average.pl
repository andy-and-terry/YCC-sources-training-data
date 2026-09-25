use strict;
use warnings;

sub make_moving_average {
    my $size = shift;
    my (@window, $sum);
    $sum = 0;
    return sub {
        my $v = shift;
        push @window, $v;
        $sum += $v;
        $sum -= shift @window if @window > $size;
        return $sum / @window;
    };
}

my $ma = make_moving_average(3);
print join(' ', map { sprintf '%.2f', $ma->($_) } 1, 10, 3, 5, 8, 2), "\n";
