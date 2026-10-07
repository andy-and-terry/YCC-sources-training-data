use strict;
use warnings;
use Math::BigInt;

sub mulmod {    # avoids overflow for moduli up to 2^62 by using doubling
    my ($a, $b, $m) = @_;
    return ($a * $b) % $m if $m < 2**26;
    my $r = 0;
    $a %= $m;
    while ($b > 0) {
        $r = ($r + $a) % $m if $b & 1;
        $a = ($a * 2) % $m;
        $b >>= 1;
    }
    return $r;
}

sub power_mod {
    my ($base, $exp, $m) = @_;
    my $r = 1 % $m;
    $base %= $m;
    while ($exp > 0) {
        $r = mulmod($r, $base, $m) if $exp & 1;
        $base = mulmod($base, $base, $m);
        $exp >>= 1;
    }
    return $r;
}

my $M = 1_000_000_007;
print '2^10 mod 1000 = ', power_mod(2, 10, 1000), "\n";
print "3^200 mod p = ", power_mod(3, 200, $M), ' (BigInt: ', Math::BigInt->new(3)->bmodpow(200, $M), ")\n";
print "Fermat inverse of 12345 mod p: ", power_mod(12345, $M - 2, $M), "\n";
print 'check: ', mulmod(12345, power_mod(12345, $M - 2, $M), $M), "\n";
