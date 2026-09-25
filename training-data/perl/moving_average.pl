use strict;
use warnings;

sub make_sma {
    my $size = shift;
    my (@window, $sum);
    return sub {
        my $x = shift;
        push @window, $x;
        $sum += $x;
        $sum -= shift @window if @window > $size;
        return $sum / @window;
    };
}

sub make_ema {
    my $alpha = shift;
    my $ema;
    return sub { $ema = defined $ema ? $alpha * $_[0] + (1 - $alpha) * $ema : $_[0] };
}

my ($sma, $ema) = (make_sma(3), make_ema(0.5));
printf "%5.1f  sma=%7.3f  ema=%7.3f\n", $_, $sma->($_), $ema->($_) for 10, 11, 12, 13, 12, 11, 15, 18, 17, 16;
