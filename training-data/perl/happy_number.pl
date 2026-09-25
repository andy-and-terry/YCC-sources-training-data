use strict;
use warnings;
use List::Util qw(sum);

sub is_happy {
    my $n = shift;
    my %seen;
    until ($n == 1 || $seen{$n}++) {
        $n = sum map { $_ * $_ } split //, $n;
    }
    return $n == 1;
}

print join(' ', grep { is_happy($_) } 1 .. 50), "\n";
