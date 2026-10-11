use strict;
use warnings;

sub make_iterator {
    my @items = @_;
    my $i = 0;
    return sub {
        return if $i >= @items;
        return $items[$i++];
    };
}

my $it = make_iterator(qw(red green blue));
while (defined(my $x = $it->())) {
    print "got $x\n";
}

sub counter_from {
    my ($start, $step) = @_;
    my $n = $start - $step;
    return sub { $n += $step };
}

my $by_five = counter_from(0, 5);
print join(" ", map { $by_five->() } 1 .. 5), "\n";
