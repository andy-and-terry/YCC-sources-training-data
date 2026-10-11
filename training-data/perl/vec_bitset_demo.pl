use strict;
use warnings;

my $bits = '';
vec($bits, $_, 1) = 1 for (1, 3, 5, 8, 13);

print "length in bytes: ", length($bits), "\n";
print "bit 3: ", vec($bits, 3, 1), "\n";
print "bit 4: ", vec($bits, 4, 1), "\n";
print "unpacked: ", unpack("b*", $bits), "\n";

my @set = grep { vec($bits, $_, 1) } 0 .. 15;
print "set bits: @set\n";

my $count = unpack("%32b*", $bits);
print "popcount: $count\n";

my $bytes = '';
vec($bytes, 0, 8) = 65;
vec($bytes, 1, 8) = 66;
print "bytes: $bytes\n";
