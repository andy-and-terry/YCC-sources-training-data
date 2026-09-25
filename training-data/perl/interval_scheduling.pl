use strict;
use warnings;

sub max_non_overlapping {
    my @chosen;
    my $end = -9**9**9;
    for my $iv (sort { $a->[1] <=> $b->[1] } @_) {
        next if $iv->[0] < $end;
        push @chosen, $iv;
        $end = $iv->[1];
    }
    return @chosen;
}

sub min_rooms {
    my @events = sort { $a->[0] <=> $b->[0] || $a->[1] <=> $b->[1] } map { ([$_->[0], 1], [$_->[1], -1]) } @_;
    my ($cur, $best) = (0, 0);
    for (@events) { $cur += $_->[1]; $best = $cur if $cur > $best }
    return $best;
}

my @iv = ([1, 4], [3, 5], [0, 6], [5, 7], [3, 9], [5, 9], [6, 10], [8, 11], [8, 12], [2, 14], [12, 16]);
print 'chosen: ', join(' ', map { "[$_->[0],$_->[1]]" } max_non_overlapping(@iv)), "\n";
print 'rooms needed: ', min_rooms(@iv), "\n";
