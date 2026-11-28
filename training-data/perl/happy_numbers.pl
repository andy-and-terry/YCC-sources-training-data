use strict;
use warnings;

sub is_happy {
    my ($n) = @_;
    my %seen;
    while ($n != 1 && !$seen{$n}++) {
        my $s = 0;
        $s += $_ ** 2 for split //, $n;
        $n = $s;
    }
    return $n == 1;
}

my @found;
for (my $n = 1; @found < 8; $n++) {
    push @found, $n if is_happy($n);
}
print "@found\n";    # 1 7 10 13 19 23 28 31
