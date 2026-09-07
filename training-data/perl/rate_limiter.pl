use strict;
use warnings;

sub make_rate_limiter {
    my ($capacity, $refill_per_tick) = @_;
    my $tokens = $capacity;
    return sub {
        $tokens += $refill_per_tick;
        $tokens = $capacity if $tokens > $capacity;
        if ($tokens >= 1) {
            $tokens -= 1;
            return 1;
        }
        return 0;
    };
}

my $allow = make_rate_limiter(3, 0);
for my $tick (1 .. 6) {
    print "tick $tick: ", ($allow->() ? "allowed" : "denied"), "\n";
}

