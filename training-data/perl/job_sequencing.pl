use strict;
use warnings;

# Unit-time jobs with deadlines: greedy by profit, placed in the latest free slot (union-find).
sub schedule {
    my @jobs = sort { $b->{profit} <=> $a->{profit} } @_;
    my $max_d = 0;
    $_->{deadline} > $max_d and $max_d = $_->{deadline} for @jobs;
    my @parent = (0 .. $max_d);
    my $find;
    $find = sub { my $x = shift; $parent[$x] == $x ? $x : ($parent[$x] = $find->($parent[$x])) };
    my (@slots, $profit);
    for my $j (@jobs) {
        my $slot = $find->($j->{deadline});
        next if $slot == 0;
        $slots[$slot] = $j->{id};
        $profit += $j->{profit};
        $parent[$slot] = $slot - 1;
    }
    undef $find;
    return ($profit, grep { defined } @slots);
}

my ($profit, @order) = schedule(
    { id => 'a', deadline => 2, profit => 100 },
    { id => 'b', deadline => 1, profit => 19 },
    { id => 'c', deadline => 2, profit => 27 },
    { id => 'd', deadline => 1, profit => 25 },
    { id => 'e', deadline => 3, profit => 15 },
);
print "profit $profit, order: @order\n";
