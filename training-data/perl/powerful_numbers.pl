use strict;
use warnings;

sub is_powerful {
    my ($n) = @_;
    for (my $p = 2; $p * $p <= $n; $p++) {
        next if $n % $p;
        return 0 if $n % ($p * $p);
        $n /= $p while $n % $p == 0;
    }
    return $n == 1;
}

print join(" ", grep { is_powerful($_) } 1 .. 100), "\n";
