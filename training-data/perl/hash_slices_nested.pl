use strict;
use warnings;

my %h = (a => 1, b => 2, c => 3, d => 4);
my @vals = @h{qw(a c)};
print "@vals\n";
my %sub; @sub{qw(a b)} = @h{qw(a b)};
print join(",", map {"$_=$sub{$_}"} sort keys %sub), "\n";
my %nested = (x => { y => [1, 2, 3] });
print $nested{x}{y}[-1], "\n";
