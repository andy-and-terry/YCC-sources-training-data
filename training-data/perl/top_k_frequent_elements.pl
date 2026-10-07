use strict;
use warnings;

sub top_k_frequent {
    my ($nums, $k) = @_;
    my %freq;
    $freq{$_}++ for @$nums;
    my @sorted = sort { $freq{$b} <=> $freq{$a} } keys %freq;
    return @sorted[0 .. $k - 1];
}

my @nums = (1, 1, 1, 2, 2, 3);
print join(",", top_k_frequent(\@nums, 2)), "\n";
