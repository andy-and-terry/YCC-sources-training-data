use strict;
use warnings;

# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
sub is_hamming {
    my ($n) = @_;
    for my $p (2, 3, 5) {
        $n /= $p while $n % $p == 0;
    }
    return $n == 1;
}

my @found;
for (my $n = 1; @found < 20; $n++) {
    push @found, $n if is_hamming($n);
}
print "@found\n";
