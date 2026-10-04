#!/usr/bin/perl
use strict;
use warnings;

my @fruits = qw(apple banana cherry);

for my $i (0 .. $#fruits) {
    print "$i: $fruits[$i]\n";
}

while (my ($i, $f) = each @fruits) {
    print "each $i => $f\n";
}

my %ages = (ann => 30, bob => 25);
for my $name (sort keys %ages) {
    print "$name is $ages{$name}\n";
}

my %inverse = reverse %ages;
print "$_ => $inverse{$_}\n" for sort { $a <=> $b } keys %inverse;

my @pairs = map { [ $_, $fruits[$_] ] } 0 .. $#fruits;
print join(";", map { "$_->[0]=$_->[1]" } @pairs), "\n";
