use strict;
use warnings;
use List::Util qw(sum);

sub equilibrium_index {
    my @n = @_;
    my $total = sum(@n);
    my $left = 0;
    for my $i (0 .. $#n) {
        return $i if $left == $total - $left - $n[$i];
        $left += $n[$i];
    }
    return -1;
}

print equilibrium_index(1, 7, 3, 6, 5, 6), "\n";    # 3
