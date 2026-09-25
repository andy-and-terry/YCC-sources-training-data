use strict;
use warnings;

sub add_big {
    my ($x, $y) = @_;
    my @a = reverse split //, $x;
    my @b = reverse split //, $y;
    my ($carry, @out) = (0);
    for my $i (0 .. ($#a > $#b ? $#a : $#b)) {
        my $s = ($a[$i] // 0) + ($b[$i] // 0) + $carry;
        push @out, $s % 10;
        $carry = int($s / 10);
    }
    push @out, $carry if $carry;
    return join '', reverse @out;
}

sub mul_small {
    my ($x, $k) = @_;
    my ($carry, @out) = (0);
    for my $d (reverse split //, $x) {
        my $p = $d * $k + $carry;
        push @out, $p % 10;
        $carry = int($p / 10);
    }
    while ($carry) { push @out, $carry % 10; $carry = int($carry / 10) }
    return join '', reverse @out;
}

my $f = '1';
$f = mul_small($f, $_) for 2 .. 25;
print "25! = $f\n";
print add_big('99999999999999999999', '1'), "\n";

use Math::BigInt;
print 'check: ', (Math::BigInt->new('123456789123456789') + Math::BigInt->new('987654321987654321')),
    ' == ', add_big('123456789123456789', '987654321987654321'), "\n";
