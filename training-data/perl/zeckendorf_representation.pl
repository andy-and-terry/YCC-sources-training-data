use strict;
use warnings;

sub zeckendorf {
    my ($n) = @_;
    my @fibs = (1, 2);
    push @fibs, $fibs[-1] + $fibs[-2] while $fibs[-1] <= $n;
    my @parts;
    for my $f (reverse @fibs) {
        if ($f <= $n) {
            push @parts, $f;
            $n -= $f;
        }
    }
    return @parts;
}

print join(" ", zeckendorf(100)), "\n";
