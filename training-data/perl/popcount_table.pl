#!/usr/bin/perl
# Population count (number of set bits) for 0..15
use strict;
use warnings;

sub bits { my $n = shift; return unpack("%32b*", pack("N", $n)); }

print join(" ", map { bits($_) } 0 .. 15), "\n";
