use strict; use warnings;
my %stock = (apple => 3, kiwi => 12);
print <<"END";
Inventory
---------
END
printf "%-8s %3d\n", $_, $stock{$_} for sort keys %stock;
