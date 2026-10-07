use strict;
use warnings;

sub collatz_length {
    my ($n) = @_;
    my $steps = 0;
    while ($n != 1) {
        $n = $n % 2 ? 3 * $n + 1 : $n / 2;
        $steps++;
    }
    return $steps;
}

print "27 takes ", collatz_length(27), " steps\n";
my ($best, $best_len) = (1, 0);
for my $i (1 .. 1000) {
    my $len = collatz_length($i);
    ($best, $best_len) = ($i, $len) if $len > $best_len;
}
print "longest under 1000: $best ($best_len steps)\n";
