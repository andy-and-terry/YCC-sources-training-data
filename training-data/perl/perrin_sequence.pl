#!/usr/bin/perl
# Perrin sequence P(n)=P(n-2)+P(n-3)
use strict;
use warnings;

my @v = (3, 0, 2);
push @v, $v[$_ - 2] + $v[$_ - 3] for 3 .. 9;
print "@v\n";
