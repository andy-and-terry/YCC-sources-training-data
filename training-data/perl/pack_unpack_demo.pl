use strict;
use warnings;

# fixed-width binary record: 2-byte id, 4-byte length, 8-char name
my $packed = pack("n N A8", 513, 70000, "widget");
print "packed length: ", length($packed), "\n";

my ($id, $len, $name) = unpack("n N A8", $packed);
print "id=$id len=$len name='$name'\n";

print "hex: ", unpack("H*", pack("n", 0xBEEF)), "\n";
print "bits: ", unpack("B8", chr(177)), "\n";
print "chars: ", join(",", unpack("C*", "ABC")), "\n";

my @fields = unpack("A3 A3 A*", "foobarbazqux");
print join("|", @fields), "\n";

my $checksum = unpack("%32C*", "hello world") % 65535;
print "checksum: $checksum\n";
