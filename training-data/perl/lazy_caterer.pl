#!/usr/bin/perl
# Lazy caterer sequence: max pieces from n cuts
use strict;
use warnings;

sub term { my ($n) = @_; return int((($n * ($n + 1))/2) + 1); }

print join(" ", map { term($_) } 0 .. 9), "\n";
