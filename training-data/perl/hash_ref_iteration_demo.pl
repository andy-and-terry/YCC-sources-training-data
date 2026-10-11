use strict;
use warnings;

my $stock = { apple => 10, pear => 0, plum => 4 };

for my $k (sort keys %$stock) {
    print "$k: $stock->{$k}\n";
}

while (my ($k, $v) = each %$stock) {
    $stock->{$k} = $v + 1;
}
print join(", ", map { "$_=$stock->{$_}" } sort keys %{$stock}), "\n";

my @in_stock = grep { $stock->{$_} > 1 } sort keys %$stock;
print "in stock: @in_stock\n";

print "count: ", scalar(keys %$stock), "\n";
my @vals = @{$stock}{qw(apple plum)};
print "slice: @vals\n";
my %sub; @sub{qw(apple pear)} = @$stock{qw(apple pear)};
print join(",", map {"$_=$sub{$_}"} sort keys %sub), "\n";
