use strict;
use warnings;

sub cycle_sort {
    my @a = @_;
    my $writes = 0;
    for my $start (0 .. $#a - 1) {
        my $item = $a[$start];
        my $pos = $start + grep { $a[$_] < $item } $start + 1 .. $#a;
        next if $pos == $start;
        $pos++ while $a[$pos] == $item;
        ($a[$pos], $item) = ($item, $a[$pos]);
        $writes++;
        while ($pos != $start) {
            $pos = $start + grep { $a[$_] < $item } $start + 1 .. $#a;
            $pos++ while $a[$pos] == $item;
            ($a[$pos], $item) = ($item, $a[$pos]);
            $writes++;
        }
    }
    return (\@a, $writes);
}

my ($sorted, $writes) = cycle_sort(20, 40, 50, 10, 30, 20, 0);
print "@$sorted (writes: $writes)\n";
