use strict;
use warnings;

sub walk {
    my ($node, $depth) = @_;
    $depth //= 0;
    for my $k (sort keys %$node) {
        print "  " x $depth, $k, "\n";
        walk($node->{$k}, $depth + 1) if ref $node->{$k} eq 'HASH';
    }
}
walk({ src => { lib => { 'a.pm' => 1 }, 'main.pl' => 1 }, README => 1 });
sub flatten { map { ref $_ ? flatten(@$_) : $_ } @_ }
print join(",", flatten(1, [2, [3, [4, 5]], 6])), "\n";
sub hanoi { my ($n, $f, $t, $v, $c) = @_; return 0 if !$n; return hanoi($n - 1, $f, $v, $t) + 1 + hanoi($n - 1, $v, $t, $f) }
print hanoi(5, 'A', 'C', 'B'), "\n";
