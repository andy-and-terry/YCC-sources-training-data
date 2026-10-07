use strict;
use warnings;

sub house_robber {
    my (@houses) = @_;
    my ($prev, $curr) = (0, 0);
    for my $h (@houses) {
        my $next = $curr > $prev + $h ? $curr : $prev + $h;
        $prev = $curr;
        $curr = $next;
    }
    return $curr;
}

print house_robber(2, 7, 9, 3, 1), "\n";
