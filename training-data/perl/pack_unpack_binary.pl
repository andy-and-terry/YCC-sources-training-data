use strict;
use warnings;

my $bin = pack("nNa4C", 258, 16909060, "ab", 255);
print length($bin), " ", join(",", unpack("nNa4C", $bin)), "\n";
print unpack("H*", pack("n", 0xBEEF)), " ", unpack("%32C*", "abc"), "\n";
print join(" ", unpack("(A3)*", "abcdefgh")), "\n";
print unpack("B8", chr(5)), " ", oct("0b101"), " ", hex("ff"), " ", oct("755"), "\n";
my $rec = pack("A10 A5", "Ada", "NO"); print "[$rec]\n";
