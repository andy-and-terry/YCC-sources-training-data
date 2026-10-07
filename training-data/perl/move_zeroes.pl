use strict;
use warnings;

sub move_zeroes {    # in place, stable, O(n)
    my $a = shift;
    my $w = 0;
    for my $x (@$a) { $a->[$w++] = $x if $x != 0 }
    $a->[$_] = 0 for $w .. $#$a;
}

my @a = (0, 1, 0, 3, 12, 0, 7);
move_zeroes(\@a);
print "@a\n";
# idiomatic alternative
my @b = (0, 1, 0, 3, 12);
@b = ((grep { $_ } @b), (grep { !$_ } @b));
print "@b\n";
