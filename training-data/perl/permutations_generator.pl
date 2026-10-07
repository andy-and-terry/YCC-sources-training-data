use strict;
use warnings;

sub permutations {
    my (@list) = @_;
    return ([]) unless @list;
    my @result;
    for my $i (0 .. $#list) {
        my @rest = @list;
        my ($x) = splice(@rest, $i, 1);
        for my $p (permutations(@rest)) {
            push @result, [$x, @$p];
        }
    }
    return @result;
}

for my $p (permutations(1, 2, 3)) {
    print join(",", @$p), "\n";
}
