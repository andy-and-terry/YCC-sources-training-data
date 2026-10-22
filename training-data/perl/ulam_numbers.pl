use strict;
use warnings;

sub ulam {
    my ($count) = @_;
    my @seq = (1, 2);
    my %in = (1 => 1, 2 => 1);
    my $n = 2;
    while (@seq < $count) {
        $n++;
        my $ways = grep { $_ < $n - $_ && $in{$n - $_} } @seq;
        if ($ways == 1) {
            push @seq, $n;
            $in{$n} = 1;
        }
    }
    return @seq;
}

print join(" ", ulam(15)), "\n";
