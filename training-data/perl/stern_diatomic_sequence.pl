use strict;
use warnings;

sub stern {
    my ($count) = @_;
    my @s = (0, 1);
    for my $i (2 .. $count - 1) {
        my $h = int($i / 2);
        push @s, $i % 2 == 0 ? $s[$h] : $s[$h] + $s[$h + 1];
    }
    return @s[0 .. $count - 1];
}

print join(" ", stern(20)), "\n";
