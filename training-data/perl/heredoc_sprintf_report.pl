use strict; use warnings;
my %stock = (apple => 3, pear => 12);
print <<"END";
Inventory report
----------------
END
printf "%-8s %3d\n", $_, $stock{$_} for sort keys %stock;
