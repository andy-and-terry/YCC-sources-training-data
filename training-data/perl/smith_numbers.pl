use strict;
use warnings;

sub digit_sum {
    my ($n) = @_;
    my $s = 0;
    $s += $_ for split //, $n;
    return $s;
}

sub factor_digit_sum {
    my ($n) = @_;
    my $total = 0;
    for (my $d = 2; $n > 1; $d++) {
        while ($n % $d == 0) {
            $total += digit_sum($d);
            $n /= $d;
        }
    }
    return $total;
}

sub is_prime {
    my ($n) = @_;
    for (my $d = 2; $d * $d <= $n; $d++) {
        return 0 if $n % $d == 0;
    }
    return $n > 1;
}

print join(" ", grep { !is_prime($_) && digit_sum($_) == factor_digit_sum($_) } 2 .. 99), "\n";
