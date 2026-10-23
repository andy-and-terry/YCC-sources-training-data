use strict;
use warnings;

sub lucky {
    my ($limit) = @_;
    my @nums = grep { $_ % 2 == 1 } 1 .. $limit - 1;
    my $i = 1;
    while ($i < @nums && $nums[$i] <= @nums) {
        my $step = $nums[$i];
        @nums = @nums[grep { ($_ + 1) % $step != 0 } 0 .. $#nums];
        $i++;
    }
    return @nums;
}

print join(" ", lucky(100)), "\n";
