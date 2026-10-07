use strict;
use warnings;

sub phi {
    my $n = shift;
    my $r = $n;
    for (my $p = 2; $p * $p <= $n; $p++) {
        next if $n % $p;
        $n /= $p while $n % $p == 0;
        $r -= $r / $p;
    }
    $r -= $r / $n if $n > 1;
    return $r;
}

sub phi_sieve {
    my $n = shift;
    my @phi = (0 .. $n);
    for my $p (2 .. $n) {
        next unless $phi[$p] == $p;
        $phi[$_] -= $phi[$_] / $p for map { $_ * $p } 1 .. int($n / $p);
    }
    return @phi;
}

print join(' ', map { phi($_) } 1 .. 20), "\n";
my @s = phi_sieve(20);
print join(' ', @s[1 .. 20]), "\n";
print 'phi(1000000007) = ', phi(1000000007), "\n";
