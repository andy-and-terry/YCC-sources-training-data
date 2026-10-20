use strict;
use warnings;

my @a = (1 .. 8);
my @removed = splice(@a, 2, 3);
splice(@a, 1, 0, 'x', 'y');
print "@a | @removed\n";
print "last idx $#a, count ${\ scalar @a}\n";
my @rev = reverse @a; my @sl = @a[1 .. 3]; my @neg = @a[-2, -1];
print "@rev[0,1] @sl @neg\n";
my @grepped = grep { /\d/ } @a; my ($first) = grep { /x/ } @a;
print scalar(@grepped), " $first\n";
print join(",", map { $_ * 2 } grep { !($_ % 2) } 1 .. 10), "\n";
print "exists\n" if exists $a[2];
my @copy = (@a, 'z'); unshift @copy, 'start'; my $p = pop @copy; shift @copy;
print scalar(@copy), $p, "\n";
