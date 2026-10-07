use strict;
use warnings;

sub gen {
    my ($n) = @_;
    my @out;
    my $go;
    $go = sub {
        my ($s, $open, $close) = @_;
        return push @out, $s if length $s == 2 * $n;
        $go->("$s(", $open + 1, $close) if $open < $n;
        $go->("$s)", $open, $close + 1) if $close < $open;
    };
    $go->('', 0, 0);
    undef $go;
    return @out;
}

print join(' ', gen(3)), "\n";
print 'counts: ', join(' ', map { scalar gen($_) } 1 .. 8), "\n";
