use strict;
use warnings;

my @rows = (
    ["Widget", 4, 3.5],
    ["Gadget", 10, 12.25],
    ["Thingamajig", 1, 100],
);

printf "%-12s %5s %9s\n", "Item", "Qty", "Total";
print "-" x 28, "\n";
my $grand = 0;
for my $r (@rows) {
    my ($name, $qty, $price) = @$r;
    my $total = $qty * $price;
    $grand += $total;
    printf "%-12s %5d %9.2f\n", $name, $qty, $total;
}
print "-" x 28, "\n";
printf "%-12s %5s %9.2f\n", "Total", "", $grand;
printf "%*s|\n", 8, "right";
printf "%-*s|\n", 8, "left";
printf "%05.1f%%\n", 45.678;
