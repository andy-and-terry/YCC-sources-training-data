use strict;
use warnings;

# pack/unpack convert between Perl values and binary records.
my $record = pack("A5 n C", "Perl", 5000, 42);
my ($name, $port, $flag) = unpack("A5 n C", $record);
print "name=$name port=$port flag=$flag length=", length($record), "\n";

print join(",", unpack("C*", "ABC")), "\n";
print unpack("H*", "Hi!"), "\n";
print unpack("B8", chr(5)), "\n";
