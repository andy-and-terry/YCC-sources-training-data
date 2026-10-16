use strict;
use warnings;

my @zeros = (0) x 5;
print "@zeros\n";

my @pattern = (1, 2) x 3;
print "@pattern\n";

my $line = "-" x 20;
print "$line\n";

my @board = map { [ ('.') x 4 ] } 1 .. 3;
$board[1][2] = '#';
print join("", @$_), "\n" for @board;

my %seen;
@seen{qw(a b c)} = (1) x 3;
print join(",", map { "$_=$seen{$_}" } sort keys %seen), "\n";
