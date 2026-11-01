use strict; use warnings;
print "-" x 20, "\n";
printf "%-8s|%6.2f|%03d\n", "name", 3.14159, 7;
my @row = (1) x 5;
print "@row\n";
print join(" ", map { sprintf "%02x", $_ } 10, 255), "\n";
