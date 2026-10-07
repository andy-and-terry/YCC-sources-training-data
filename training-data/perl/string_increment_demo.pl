#!/usr/bin/perl
use strict;
use warnings;

my $id = "aa9";
print "$id\n";
$id++;
print "$id\n";

my $z = "Az";
$z++;
print "$z\n";

my $zz = "zz";
$zz++;
print "$zz\n";

my @labels;
my $label = "a";
push @labels, $label++ for 1 .. 5;
print "@labels\n";

print join(",", 'a' .. 'e'), "\n";
print join(",", 'aa' .. 'ad'), "\n";
print join(",", '08' .. '11'), "\n";
