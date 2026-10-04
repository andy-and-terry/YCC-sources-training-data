#!/usr/bin/perl
use strict;
use warnings;

my $data = "alpha 3\nbeta 5\n\n# comment\ngamma 2\nbad line here\n";
open(my $fh, '<', \$data) or die "cannot open in-memory file: $!";

my $total = 0;
while (my $line = <$fh>) {
    chomp $line;
    next if $line =~ /^\s*$/;
    next if $line =~ /^#/;
    if ($line =~ /^(\w+)\s+(\d+)$/) {
        print "$.: $1 => $2\n";
        $total += $2;
    } else {
        warn "line $.: skipping malformed input\n";
    }
}
close $fh;
print "total: $total\n";
