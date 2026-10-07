use strict;
use warnings;
use List::Util qw(sum0);

sub can_partition {
    my @nums = @_;
    my $total = sum0(@nums);
    return if $total % 2;
    my $target = $total / 2;
    my %from = (0 => -1);    # reachable sum => index of the item that reached it
    for my $i (0 .. $#nums) {
        for my $s (sort { $b <=> $a } keys %from) {
            my $ns = $s + $nums[$i];
            $from{$ns} //= $i if $ns <= $target && $from{$s} != $i;
        }
    }
    return unless exists $from{$target};
    my @subset;
    for (my $s = $target; $s > 0; $s -= $nums[ $from{$s} ]) { push @subset, $nums[ $from{$s} ] }
    return \@subset;
}

for my $a ([1, 5, 11, 5], [1, 2, 3, 5], [3, 1, 1, 2, 2, 1]) {
    my $r = can_partition(@$a);
    printf "[%s] -> %s\n", "@$a", $r ? "[@$r]" : 'no';
}
