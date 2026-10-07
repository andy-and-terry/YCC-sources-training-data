use strict;
use warnings;

sub memoize {
    my $f = shift;
    my %cache;
    return sub {
        my $key = join($;, @_);
        $cache{$key} //= $f->(@_);
    };
}

my $calls = 0;
my $fib;
$fib = memoize(sub {
    my $n = shift;
    $calls++;
    return $n < 2 ? $n : $fib->($n - 1) + $fib->($n - 2);
});

print "fib(50) = ", $fib->(50), "\n";
print "calls: $calls\n";
