#!/usr/bin/perl
use strict;
use warnings;

my $bytes = pack("A3 n C", "abcdef", 258, 65);
print length($bytes), " bytes\n";

my ($str, $short, $byte) = unpack("A3 n C", $bytes);
print "$str $short $byte\n";

print unpack("H*", "AB"), "\n";
print pack("H*", "48656c6c6f"), "\n";

my $bits = unpack("B8", chr(37));
print "$bits\n";
print oct("0b$bits"), "\n";

my @nums = unpack("C*", "Perl");
print "@nums\n";
print pack("C*", map { $_ + 1 } @nums), "\n";

printf "%s\n", join ",", unpack("(A2)*", "aabbccd");
