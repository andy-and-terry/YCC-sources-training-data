use strict;
use warnings;
use List::Util qw(max);

sub modes {
    my %counts;
    $counts{$_}++ for @_;
    my $top = max values %counts;
    return sort { $a <=> $b } grep { $counts{$_} == $top } keys %counts;
}

print join(",", modes(1, 2, 2, 3, 3, 4)), "\n";
