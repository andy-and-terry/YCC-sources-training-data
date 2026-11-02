use strict; use warnings;
my %h = (a => 1, b => 2, c => 3);
my @vals = @h{qw(a c)};
print "@vals\n";
print join(",", grep { $h{$_} > 1 } sort keys %h), "\n";
