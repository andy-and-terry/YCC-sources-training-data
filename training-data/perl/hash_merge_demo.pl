use strict;
use warnings;

my %defaults = (host => "localhost", port => 80, debug => 0);
my %user     = (port => 8080, debug => 1);

my %config = (%defaults, %user);
print "$_=$config{$_}\n" for sort keys %config;

my %counts_a = (x => 1, y => 2);
my %counts_b = (y => 10, z => 5);
my %sum = %counts_a;
$sum{$_} += $counts_b{$_} for keys %counts_b;
print join(", ", map { "$_=$sum{$_}" } sort keys %sum), "\n";

my @only_a = grep { !exists $counts_b{$_} } keys %counts_a;
print "only in a: @only_a\n";
