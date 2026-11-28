use strict;
use warnings;

sub jaccard {
    my ($a, $b) = @_;
    my %in_a = map { $_ => 1 } @$a;
    my %in_b = map { $_ => 1 } @$b;
    my %union = (%in_a, %in_b);
    my $inter = grep { $in_b{$_} } keys %in_a;
    return %union ? $inter / keys %union : 1;
}

print jaccard([1, 2, 3, 4], [3, 4, 5]), "\n";
