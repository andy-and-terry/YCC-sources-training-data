#!/usr/bin/perl
# Pronic numbers n(n+1)
use strict;
use warnings;

sub term { my ($n) = @_; return int($n * ($n + 1)); }

print join(" ", map { term($_) } 0 .. 9), "\n";
