use strict;
use warnings;

sub from_list { my $head; $head = { val => $_, next => $head } for reverse @_; $head }
sub to_list   { my ($n, @out) = @_; for (; $n; $n = $n->{next}) { push @out, $n->{val} } @out }

sub merge {
    my ($a, $b) = @_;
    my $dummy = {};
    my $tail = $dummy;
    while ($a && $b) {
        if ($a->{val} <= $b->{val}) { $tail->{next} = $a; $a = $a->{next} }
        else                        { $tail->{next} = $b; $b = $b->{next} }
        $tail = $tail->{next};
    }
    $tail->{next} = $a || $b;
    return $dummy->{next};
}

print join(' ', to_list(merge(from_list(1, 2, 4, 9), from_list(1, 3, 4, 5, 10)))), "\n";
print join(' ', to_list(merge(undef, from_list(7)))), "\n";
