use strict;
use warnings;

sub merge_two {
    my ($a, $b) = @_;
    my ($i, $j, @out) = (0, 0);
    push @out, $a->[$i] <= $b->[$j] ? $a->[$i++] : $b->[$j++] while $i < @$a && $j < @$b;
    return @out, @$a[$i .. $#$a], @$b[$j .. $#$b];
}

sub merge_k {    # divide and conquer: O(N log k)
    my @lists = @_;
    return () unless @lists;
    while (@lists > 1) {
        my @next;
        push @next, [merge_two(splice(@lists, 0, 2))] while @lists > 1;
        push @next, @lists;
        @lists = @next;
    }
    return @{ $lists[0] };
}

print join(' ', merge_two([1, 4, 7], [2, 3, 8, 9])), "\n";
print join(' ', merge_k([1, 5, 9], [2, 6], [], [0, 3, 4, 10])), "\n";
