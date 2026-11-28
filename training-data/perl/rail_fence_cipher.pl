use strict;
use warnings;

sub order {
    my ($n, $k) = @_;
    my $cycle = 2 * ($k - 1);
    my @rail = map { my $r = $_ % $cycle; $r < $k ? $r : $cycle - $r } 0 .. $n - 1;
    return sort { $rail[$a] <=> $rail[$b] || $a <=> $b } 0 .. $n - 1;
}

sub encrypt {
    my ($t, $k) = @_;
    return join '', map { substr($t, $_, 1) } order(length $t, $k);
}

sub decrypt {
    my ($c, $k) = @_;
    my @out;
    my $pos = 0;
    $out[$_] = substr($c, $pos++, 1) for order(length $c, $k);
    return join '', @out;
}

my $c = encrypt("WEAREDISCOVERED", 3);
print "$c ", decrypt($c, 3), "\n";
