use strict;
use warnings;
use Math::BigInt;

my $MOD = 1_000_000_007;

sub mat_mul {
    my ($a, $b, $mod) = @_;
    my @r;
    for my $i (0, 1) {
        for my $j (0, 1) {
            $r[$i][$j] = $a->[$i][0] * $b->[0][$j] + $a->[$i][1] * $b->[1][$j];
            $r[$i][$j] %= $mod if $mod;
        }
    }
    return \@r;
}

sub fib {
    my ($n, $mod, $one) = @_;
    $one //= 1;
    my ($r, $m) = ([[$one, 0], [0, $one]], [[$one, $one], [$one, 0]]);
    for (; $n > 0; $n >>= 1) {
        $r = mat_mul($r, $m, $mod) if $n & 1;
        $m = mat_mul($m, $m, $mod);
    }
    return $r->[0][1];
}

print join(' ', map { fib($_, $MOD) } 0 .. 14), "\n";
print 'fib(10^18) mod p = ', fib(10**18, $MOD), "\n";
print 'fib(200) exact = ', fib(200, 0, Math::BigInt->new(1)), "\n";
