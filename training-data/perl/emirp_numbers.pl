use strict;
use warnings;

sub is_prime {
    my ($n) = @_;
    return 0 if $n < 2;
    for (my $i = 2; $i * $i <= $n; $i++) {
        return 0 if $n % $i == 0;
    }
    return 1;
}

my @emirps = grep {
    my $r = reverse $_;
    $r != $_ && is_prime($_) && is_prime($r);
} 2 .. 199;
print "@emirps\n";    # 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
