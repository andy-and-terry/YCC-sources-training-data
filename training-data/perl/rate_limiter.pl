use strict;
use warnings;

sub make_rate_limiter {
    my ($capacity, $refill_per_tick) = @_;
    my $tokens = $capacity;
    my $refill = sub {
        $tokens += $refill_per_tick;
        $tokens = $capacity if $tokens > $capacity;
    };
    my $allow = sub {
        return 0 if $tokens < 1;
        $tokens -= 1;
        return 1;
    };
    return ($refill, $allow);
}

my ($refill, $allow) = make_rate_limiter(3, 1);
my @requests_per_tick = (2, 2, 1, 0, 3);
for my $tick (1 .. @requests_per_tick) {
    $refill->();
    my @results;
    push @results, ($allow->() ? "allowed" : "denied") for 1 .. $requests_per_tick[$tick - 1];
    print "tick $tick: ", join(",", @results), "\n";
}
