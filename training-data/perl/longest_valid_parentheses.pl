use strict;
use warnings;

sub longest_valid {
    my @stack = (-1);
    my $best = 0;
    my @c = split //, shift;
    for my $i (0 .. $#c) {
        if ($c[$i] eq '(') { push @stack, $i; next }
        pop @stack;
        if (@stack) { my $len = $i - $stack[-1]; $best = $len if $len > $best }
        else        { push @stack, $i }
    }
    return $best;
}

printf "%-10s %d\n", "'$_'", longest_valid($_) for '(()', ')()())', '', '()(()', '((()))()';
