use strict;
use warnings;

my @pairs = (
    [fruit => 'apple'], [veg => 'kale'], [fruit => 'pear'],
    [veg => 'leek'], [grain => 'rice'], [fruit => 'fig'],
);

my %groups;
push @{ $groups{ $_->[0] } }, $_->[1] for @pairs;   # autovivification

for my $kind (sort keys %groups) {
    my @items = sort @{ $groups{$kind} };
    printf "%-6s (%d): %s\n", $kind, scalar @items, join(", ", @items);
}

my %inverted;
for my $kind (keys %groups) {
    $inverted{$_} = $kind for @{ $groups{$kind} };
}
print "kale is a $inverted{kale}\n";

my %nested;
$nested{a}{b}{c} = 1;
print join(",", keys %{ $nested{a} }), "\n";
print exists $nested{x}{y} ? "yes" : "no", "\n";
print exists $nested{x} ? "x autovivified\n" : "x absent\n";
