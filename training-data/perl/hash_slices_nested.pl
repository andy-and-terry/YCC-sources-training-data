use strict; use warnings;

my %h = (a => 1, b => 2, c => 3, d => 4);
my @vals = @h{qw(a c)};
my %sub; @sub{qw(b d)} = @h{qw(b d)};
print "@vals\n";
print join(",", map {"$_=$sub{$_}"} sort keys %sub), "\n";
