use strict;
use warnings;

sub parse { my ($f, $r) = split //, shift; (ord($f) - ord('a'), $r - 1) }
sub name  { chr(ord('a') + $_[0]) . ($_[1] + 1) }

sub knight_path {
    my ($from, $to) = @_;
    my @start = parse($from);
    my $goal = join ',', parse($to);
    my %prev = (join(',', @start) => undef);
    my @queue = ([@start]);
    while (my $p = shift @queue) {
        my $key = join ',', @$p;
        if ($key eq $goal) {
            my @path;
            for (my $k = $key; defined $k; $k = $prev{$k}) { unshift @path, name(split /,/, $k) }
            return @path;
        }
        for ([1, 2], [2, 1], [-1, 2], [-2, 1], [1, -2], [2, -1], [-1, -2], [-2, -1]) {
            my ($x, $y) = ($p->[0] + $_->[0], $p->[1] + $_->[1]);
            next if $x < 0 || $y < 0 || $x > 7 || $y > 7 || exists $prev{"$x,$y"};
            $prev{"$x,$y"} = $key;
            push @queue, [$x, $y];
        }
    }
    return;
}

for (['a1', 'b2'], ['a1', 'h8'], ['d4', 'd4'], ['b1', 'c3']) {
    my @p = knight_path(@$_);
    printf "%s -> %s: %d moves (%s)\n", @$_, $#p, join(' ', @p);
}
