#!/usr/bin/perl
use strict;
use warnings;

my @people = (
    { name => 'Zoe',  dept => 'eng',   age => 30 },
    { name => 'Adam', dept => 'sales', age => 41 },
    { name => 'Bea',  dept => 'eng',   age => 25 },
    { name => 'Cy',   dept => 'sales', age => 41 },
);

my @sorted = sort {
    $a->{dept} cmp $b->{dept}
        or $b->{age} <=> $a->{age}
        or $a->{name} cmp $b->{name}
} @people;

printf "%-6s %-6s %d\n", @{$_}{qw(dept name age)} for @sorted;

# Schwartzian transform: compute the key once per element
my @by_len = map  { $_->[1] }
             sort { $a->[0] <=> $b->[0] or $a->[1] cmp $b->[1] }
             map  { [ length($_), $_ ] } qw(pear fig banana kiwi apple);
print "@by_len\n";
