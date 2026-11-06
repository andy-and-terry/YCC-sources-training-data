use strict;
use warnings;

# Count contiguous subarrays whose sum equals k (prefix sums + hash).
sub count_subarrays {
    my ($k, @nums) = @_;
    my %seen = (0 => 1);
    my ($total, $count) = (0, 0);
    for my $x (@nums) {
        $total += $x;
        $count += $seen{$total - $k} // 0;
        $seen{$total}++;
    }
    return $count;
}

print count_subarrays(2, 1, 1, 1), "\n";
