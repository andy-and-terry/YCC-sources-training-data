use strict; use warnings;
my %h = (a => 1, b => 2, c => 3, d => 4);
my @v = @h{qw(a c)};
print "@v\n";
delete @h{qw(a b)};
print join(",", sort keys %h), "\n";
print exists $h{c} ? "has c\n" : "no c\n";
