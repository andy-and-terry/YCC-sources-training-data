use strict;
use warnings;
use List::Util qw(min max);

sub insert_interval {
    my ($iv, $new) = @_;
    my @out;
    my $i = 0;
    push @out, $iv->[$i++] while $i < @$iv && $iv->[$i][1] < $new->[0];
    while ($i < @$iv && $iv->[$i][0] <= $new->[1]) {
        $new = [min($new->[0], $iv->[$i][0]), max($new->[1], $iv->[$i][1])];
        $i++;
    }
    push @out, $new, @$iv[$i .. $#$iv];
    return @out;
}

print join(" ", map { "[$_->[0],$_->[1]]" } insert_interval([[1, 3], [6, 9]], [2, 5])), "\n";    # [1,5] [6,9]
