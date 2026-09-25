use strict;
use warnings;

sub collatz {
    my ($n) = @_;
    my @seq = ($n);
    while ($n != 1) {
        $n = $n % 2 ? 3 * $n + 1 : $n / 2;
        push @seq, $n;
    }
    return @seq;
}

my %cache = (1 => 0);

sub steps {
    my ($n) = @_;
    my @path;
    while (!exists $cache{$n}) {
        push @path, $n;
        $n = $n % 2 ? 3 * $n + 1 : $n / 2;
    }
    my $s = $cache{$n};
    $cache{ pop @path } = ++$s while @path;
    return $cache{ $_[0] };
}

my @seq = collatz(27);
print join(' -> ', @seq[0 .. 9]), " ...\n";
print 'steps for 27: ', $#seq, ' (cached: ', steps(27), ")\n";
my ($best, $len) = (1, 0);
for my $n (1 .. 100_000) {
    my $s = steps($n);
    ($best, $len) = ($n, $s) if $s > $len;
}
print "longest under 100000: $best ($len steps)\n";
