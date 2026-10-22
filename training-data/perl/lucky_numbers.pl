use strict;
use warnings;

sub lucky {
    my ($limit) = @_;
    my @nums = grep { $_ % 2 } 1 .. $limit;
    my $i = 1;
    while ($i < @nums && $nums[$i] <= @nums) {
        my $step = $nums[$i];
        @nums = map { $nums[$_] } grep { ($_ + 1) % $step } 0 .. $#nums;
        $i++;
    }
    return @nums;
}

print join(" ", lucky(50)), "\n";
