use strict;
use warnings;
use Math::BigInt;

sub binom {
    my ($n, $k) = @_;
    return 0 if $k < 0 || $k > $n;
    $k = $n - $k if $k > $n - $k;
    my $r = 1;
    $r = $r * ($n - $k + $_) / $_ for 1 .. $k;    # stays integral at every step
    return $r;
}

sub binom_big {
    my ($n, $k) = @_;
    return Math::BigInt->new($n)->bnok($k);
}

my @row = map { binom(10, $_) } 0 .. 10;
print "C(10, k): @row\n";
print 'C(52, 5) = ', binom(52, 5), "\n";
print 'C(100, 50) = ', binom_big(100, 50), "\n";
