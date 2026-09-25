use strict;
use warnings;

sub intersect_unique {
    my ($x, $y) = @_;
    my %in_y = map { $_ => 1 } @$y;
    my %seen;
    return grep { $in_y{$_} && !$seen{$_}++ } @$x;
}

sub intersect_multi {    # keeps duplicates as many times as both contain them
    my ($x, $y) = @_;
    my %count;
    $count{$_}++ for @$y;
    return grep { $count{$_} && $count{$_}-- } @$x;
}

sub intersect_sorted {
    my ($x, $y) = @_;
    my ($i, $j, @out) = (0, 0);
    while ($i < @$x && $j < @$y) {
        if    ($x->[$i] < $y->[$j]) { $i++ }
        elsif ($x->[$i] > $y->[$j]) { $j++ }
        else                        { push @out, $x->[$i]; $i++; $j++ }
    }
    return @out;
}

my @a = (4, 9, 5, 9, 4);
my @b = (9, 4, 9, 8, 4);
print join(' ', intersect_unique(\@a, \@b)), ' | ', join(' ', intersect_multi(\@a, \@b)), ' | ',
    join(' ', intersect_sorted([1, 2, 2, 3, 5], [2, 2, 5, 7])), "\n";
