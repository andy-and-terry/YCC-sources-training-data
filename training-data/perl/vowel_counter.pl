use strict;
use warnings;

my %counts = map { $_ => 0 } qw(a e i o u);
$counts{$_}++ for grep { exists $counts{$_} } split //, lc "Education is beautiful";
print "$_=$counts{$_} " for sort keys %counts;
print "\n";
