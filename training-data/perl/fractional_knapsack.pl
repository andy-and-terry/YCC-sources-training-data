use strict;
use warnings;

sub fractional_knapsack {
    my ($cap, @items) = @_;
    my ($total, @taken) = (0);
    for my $it (sort { $b->{value} / $b->{weight} <=> $a->{value} / $a->{weight} } @items) {
        last if $cap <= 0;
        my $w = $it->{weight} < $cap ? $it->{weight} : $cap;
        $cap -= $w;
        $total += $it->{value} * $w / $it->{weight};
        push @taken, sprintf '%s x%.2f', $it->{name}, $w / $it->{weight};
    }
    return ($total, @taken);
}

my ($value, @taken) = fractional_knapsack(50,
    { name => 'gold',   weight => 10, value => 60 },
    { name => 'silver', weight => 20, value => 100 },
    { name => 'bronze', weight => 30, value => 120 },
);
print "value $value: @taken\n";
