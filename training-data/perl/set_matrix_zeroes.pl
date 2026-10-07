use strict;
use warnings;

sub set_zeroes {
    my @m = map { [@$_] } @_;
    my (%rows, %cols);
    for my $r (0 .. $#m) {
        for my $c (0 .. $#{ $m[$r] }) {
            $rows{$r} = $cols{$c} = 1 if $m[$r][$c] == 0;
        }
    }
    for my $r (0 .. $#m) {
        $m[$r][$_] = 0 for grep { $rows{$r} || $cols{$_} } 0 .. $#{ $m[$r] };
    }
    return @m;
}

print "@$_\n" for set_zeroes([0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]);
