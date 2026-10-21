#!/usr/bin/perl
use strict;
use warnings;

# Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
my @t = (0, 0, 1);
push @t, $t[-1] + $t[-2] + $t[-3] while @t < 15;

print "Tribonacci: @t\n";
