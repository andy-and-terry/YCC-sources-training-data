use strict;
use warnings;

my $packed = pack("A3 n C", "abc", 258, 65);
print "length: ", length($packed), "\n";
my ($str, $short, $byte) = unpack("A3 n C", $packed);
print "$str $short $byte\n";

print join(" ", unpack("(A2)*", "aabbcc")), "\n";
print unpack("H*", "Perl"), "\n";
print pack("H*", "5065726c"), "\n";
print unpack("%32C*", "abc") % 65535, "\n";
printf "%s\n", join ",", unpack("C*", "AZ");
printf "%08b\n", unpack("C", pack("C", 77));
