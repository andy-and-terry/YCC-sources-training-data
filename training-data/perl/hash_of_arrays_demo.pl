use strict; use warnings;

my %groups;
for my $w (qw(apple avocado banana blueberry cherry apricot)) {
    push @{ $groups{ substr($w, 0, 1) } }, $w;
}
for my $k (sort keys %groups) {
    printf "%s: %s (%d)\n", $k, join(",", @{ $groups{$k} }), scalar @{ $groups{$k} };
}
print "exists b\n" if exists $groups{b};
delete $groups{c};
print join(" ", sort keys %groups), "\n";
