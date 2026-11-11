#!/usr/bin/perl
# Narayana's cows N(n)=N(n-1)+N(n-3)
use strict;
use warnings;

my @v = (1, 1, 1);
push @v, $v[$_ - 1] + $v[$_ - 3] for 3 .. 9;
print "@v\n";
