#!/usr/bin/perl
use strict;
use warnings;

print "-" x 20, "\n";
print join(", ", ("ab") x 3), "\n";

my @zeros = (0) x 5;
print "@zeros\n";

my @grid = map { [ (0) x 3 ] } 1 .. 2;
$grid[0][1] = 7;
print join(" ", @$_), "\n" for @grid;

my $title = "Report";
my $pad = int((30 - length $title) / 2);
print " " x $pad, $title, "\n";
print "=" x 30, "\n";

my @fields = ('id', 'name', 'score');
print join("\t", @fields), "\n";
print join("|", map { sprintf "%-5s", $_ } @fields), "|\n";
