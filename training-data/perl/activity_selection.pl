use strict;
use warnings;

sub activity_selection {
    my (@activities) = @_;
    my @sorted = sort { $a->[1] <=> $b->[1] } @activities;
    my @selected = ($sorted[0]);
    my $last_end = $sorted[0][1];
    for my $i (1 .. $#sorted) {
        my ($start, $end) = @{ $sorted[$i] };
        if ($start >= $last_end) {
            push @selected, $sorted[$i];
            $last_end = $end;
        }
    }
    return @selected;
}

my @activities = ([1, 4], [3, 5], [0, 6], [5, 7], [3, 9], [5, 9], [6, 10], [8, 11], [8, 12], [2, 14], [12, 16]);
my @chosen = activity_selection(@activities);
print join(", ", map { "[$_->[0],$_->[1]]" } @chosen), "\n";
