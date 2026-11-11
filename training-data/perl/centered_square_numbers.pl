#!/usr/bin/perl
# Centered square numbers 2n(n+1)+1
use strict;
use warnings;

sub term { my ($n) = @_; return int(((2 * $n) * ($n + 1)) + 1); }

print join(" ", map { term($_) } 0 .. 9), "\n";
