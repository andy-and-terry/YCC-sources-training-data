#!/usr/bin/perl
# Square of the sum minus sum of squares for 1..10 (expect 2640)
use strict;
use warnings;
use List::Util qw(sum);

my @xs = 1 .. 10;
my $total = sum(@xs);
my $squares = sum(map { $_ * $_ } @xs);
print $total * $total - $squares, "\n";
