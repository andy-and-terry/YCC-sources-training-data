use strict;
use warnings;
use List::Util qw(max);

# Maximum nesting depth of parentheses; -1 if the string is unbalanced.
sub max_depth {
    my ($s) = @_;
    my ($depth, $best) = (0, 0);
    for my $ch (split //, $s) {
        if ($ch eq '(') { $best = max($best, ++$depth) }
        elsif ($ch eq ')') { return -1 if --$depth < 0 }
    }
    return $depth == 0 ? $best : -1;
}

print max_depth('(1+(2*(3)))'), " ", max_depth('(()'), "\n";
