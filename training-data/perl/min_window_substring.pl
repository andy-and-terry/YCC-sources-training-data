use strict;
use warnings;

sub min_window {
    my ($s, $t) = @_;
    my %need;
    $need{$_}++ for split //, $t;
    my $missing = length $t;
    my ($best_l, $best_len, $l) = (0, 0 + 'inf', 0);
    my @c = split //, $s;
    for my $r (0 .. $#c) {
        $missing-- if ($need{ $c[$r] } // 0) > 0;
        $need{ $c[$r] }--;
        while ($missing == 0) {
            ($best_l, $best_len) = ($l, $r - $l + 1) if $r - $l + 1 < $best_len;
            $missing++ if ++$need{ $c[$l++] } > 0;
        }
    }
    return $best_len == 'inf' ? '' : substr $s, $best_l, $best_len;
}

printf "'%s' '%s' '%s'\n", min_window('ADOBECODEBANC', 'ABC'), min_window('a', 'aa'), min_window('aa', 'aa');
