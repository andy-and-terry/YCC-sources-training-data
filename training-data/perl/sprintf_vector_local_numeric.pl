use strict;
use warnings;

print 10 / 3, " ", int(10 / 3), " ", 10 % 3, " ", 2 ** 10, " ", abs(-5), " ", sqrt(144), "\n";
print 0.1 + 0.2 == 0.3 ? "eq" : "ne", " ", abs(0.1 + 0.2 - 0.3) < 1e-9 ? "close" : "far", "\n";
print "10" + "20", " ", "3" * 1, " ", "5" . "5", " ", "a" lt "b" ? "lt" : "ge", " ", 1_000_000, "\n";
print 9**20, " ", 255 == 0xff ? "hex" : "", " ", 1e3, " ", int(3.99), " ", sprintf("%.0f", 2.5), sprintf("%.0f", 3.5), "\n";
print join(",", map { $_ <=> 5 } (3, 5, 7)), "\n";
