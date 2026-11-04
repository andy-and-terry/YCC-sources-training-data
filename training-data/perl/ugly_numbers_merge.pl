use strict; use warnings;
use List::Util qw(min);

sub ugly {
    my $n = shift;
    my @seq = (1);
    my ($i2, $i3, $i5) = (0, 0, 0);
    while (@seq < $n) {
        my $next = min($seq[$i2]*2, $seq[$i3]*3, $seq[$i5]*5);
        push @seq, $next;
        $i2++ if $next == $seq[$i2]*2;
        $i3++ if $next == $seq[$i3]*3;
        $i5++ if $next == $seq[$i5]*5;
    }
    return $seq[-1];
}

print join(" ", map { ugly($_) } 1..12), "\n";
