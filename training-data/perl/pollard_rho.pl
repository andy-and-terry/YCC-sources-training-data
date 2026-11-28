use strict; use warnings;
sub gcd { my ($a, $b) = @_; ($a, $b) = ($b, $a % $b) while $b; $a }

sub rho {
    my $n = shift;
    return 2 if $n % 2 == 0;
    my $f = sub { ($_[0] ** 2 + 1) % $n };
    my ($x, $y, $d) = (2, 2, 1);
    while ($d == 1) {
        $x = $f->($x);
        $y = $f->($f->($y));
        $d = gcd(abs($x - $y), $n);
    }
    $d;
}

my $n = 8051;
my $p = rho($n);
printf "%d = %d * %d\n", $n, $p, $n / $p;
