use strict;
use warnings;

sub backtrack {
    my ($candidates, $start, $remaining, $current, $results) = @_;
    if ($remaining == 0) {
        push @$results, [@$current];
        return;
    }
    return if $remaining < 0;
    for my $i ($start .. $#$candidates) {
        push @$current, $candidates->[$i];
        backtrack($candidates, $i, $remaining - $candidates->[$i], $current, $results);
        pop @$current;
    }
}

sub combination_sum {
    my ($candidates, $target) = @_;
    my @results;
    backtrack($candidates, 0, $target, [], \@results);
    return @results;
}

for my $combo (combination_sum([2, 3, 6, 7], 7)) {
    print join(",", @$combo), "\n";
}
