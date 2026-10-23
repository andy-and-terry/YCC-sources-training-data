use strict;
use warnings;

sub van_eck {
    my ($count) = @_;
    my @seq = (0);
    my %last_seen;
    for my $i (0 .. $count - 2) {
        my $cur = $seq[$i];
        my $next = exists $last_seen{$cur} ? $i - $last_seen{$cur} : 0;
        $last_seen{$cur} = $i;
        push @seq, $next;
    }
    return @seq;
}

print join(" ", van_eck(20)), "\n";
