use strict;
use warnings;

# Hash slices, exists vs defined, delete, and nested data access.
my %h = (a => 1, b => undef, c => 3);
my @vals = @h{qw(a c)};
print "@vals\n";
print exists $h{b} ? "b exists\n" : "no b\n";
print defined $h{b} ? "b defined\n" : "b undef\n";
delete @h{qw(a b)};
print join(",", sort keys %h), "\n";

my %deep = (list => [1, 2, 3], map => { k => "v" });
print "$deep{list}[1] $deep{map}{k} ", scalar @{ $deep{list} }, "\n";
