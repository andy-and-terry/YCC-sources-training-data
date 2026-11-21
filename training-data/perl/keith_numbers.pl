use strict;
use warnings;
use List::Util qw(sum);

# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
sub is_keith {
    my $n = shift;
    my @seq = split //, $n;
    my $k = @seq;
    push @seq, sum(@seq[-$k .. -1]) while $seq[-1] < $n;
    return $seq[-1] == $n;
}

print join(" ", grep { is_keith($_) } 10 .. 1199), "\n";
