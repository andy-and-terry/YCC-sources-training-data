use strict;
use warnings;

sub climb {
    my ($n, @steps) = @_;
    @steps = (1, 2) unless @steps;
    my @ways = (1);
    for my $i (1 .. $n) {
        $ways[$i] = 0;
        $ways[$i] += $ways[ $i - $_ ] for grep { $_ <= $i } @steps;
    }
    return $ways[$n];
}

print join(' ', map { climb($_) } 1 .. 10), "\n";
print 'n=10 with steps {1,3,5}: ', climb(10, 1, 3, 5), "\n";
