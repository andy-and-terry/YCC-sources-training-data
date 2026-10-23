use strict;
use warnings;

sub kaprekar_steps {
    my ($n) = @_;
    my $steps = 0;
    while ($n != 6174) {
        my @d = sort split //, sprintf("%04d", $n);
        $n = join("", reverse @d) - join("", @d);
        $steps++;
    }
    return $steps;
}

print kaprekar_steps(3524), "\n";
