use strict;
use warnings;

sub ulam {
    my ($count) = @_;
    my @terms = (1, 2);
    my %members = (1 => 1, 2 => 1);
    my $cand = 2;
    while (@terms < $count) {
        $cand++;
        my $ways = grep { $_ < $cand - $_ && $members{$cand - $_} } @terms;
        if ($ways == 1) {
            push @terms, $cand;
            $members{$cand} = 1;
        }
    }
    return @terms;
}

print join(" ", ulam(15)), "\n";
