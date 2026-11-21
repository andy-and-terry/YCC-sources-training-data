use strict;
use warnings;

# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
sub is_bouncy {
    my $n = shift;
    my $up = join '', sort split //, $n;
    my $down = join '', reverse sort split //, $n;
    return $n ne $up && $n ne $down;
}

print scalar(grep { is_bouncy($_) } 1 .. 999), "\n";
