use strict;
use warnings;

my %sales = (north => 120, south => 85, east => 120, west => 200);

print "ascending:\n";
for my $k (sort { $sales{$a} <=> $sales{$b} || $a cmp $b } keys %sales) {
    printf "  %-6s %d\n", $k, $sales{$k};
}

print "descending:\n";
for my $k (sort { $sales{$b} <=> $sales{$a} || $a cmp $b } keys %sales) {
    printf "  %-6s %d\n", $k, $sales{$k};
}

my ($top) = sort { $sales{$b} <=> $sales{$a} } keys %sales;
print "top: $top\n";
my @top2 = (sort { $sales{$b} <=> $sales{$a} || $a cmp $b } keys %sales)[0, 1];
print "top two: @top2\n";
