use strict; use warnings;

sub to_base {
    my ($n, $base) = @_;
    my @digits = (0..9, 'a'..'z');
    return '0' if $n == 0;
    my $out = '';
    while ($n > 0) {
        $out = $digits[$n % $base] . $out;
        $n = int($n / $base);
    }
    return $out;
}

printf "255 in base %d = %s\n", $_, to_base(255, $_) for 2, 8, 16, 36;
print oct("0b1010"), " ", hex("ff"), " ", oct("377"), "\n";
