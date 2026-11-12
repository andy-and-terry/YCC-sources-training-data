use strict; use warnings;
my %h;
@h{qw(a b c)} = (1, 2, 3);
my @v = @h{qw(c a)};
print "@v\n";
my %sub = map { $_ => $h{$_} } grep { $h{$_} > 1 } keys %h;
print join(",", map {"$_=$sub{$_}"} sort keys %sub), "\n";
