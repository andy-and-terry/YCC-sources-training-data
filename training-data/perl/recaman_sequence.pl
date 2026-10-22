use strict;
use warnings;

sub recaman {
    my ($count) = @_;
    my @seq = (0);
    my %seen = (0 => 1);
    for my $n (1 .. $count - 1) {
        my $next = $seq[-1] - $n;
        $next = $seq[-1] + $n if $next < 0 || $seen{$next};
        push @seq, $next;
        $seen{$next} = 1;
    }
    return @seq;
}

print join(" ", recaman(20)), "\n";
