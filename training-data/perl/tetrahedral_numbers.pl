#!/usr/bin/perl
# Tetrahedral numbers n(n+1)(n+2)/6
use strict;
use warnings;

sub term { my ($n) = @_; return int((($n * ($n + 1)) * ($n + 2))/6); }

print join(" ", map { term($_) } 0 .. 9), "\n";
