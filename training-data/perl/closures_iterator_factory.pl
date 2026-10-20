use strict;
use warnings;

# Closures capture lexical variables; each generator keeps its own state.
sub make_counter {
    my ($n, $step) = @_;
    return sub { my $cur = $n; $n += $step; return $cur };
}

my $a = make_counter(0, 2);
my $b = make_counter(100, 5);
print join(" ", $a->(), $a->(), $a->()), "\n";
print join(" ", $b->(), $b->()), "\n";
