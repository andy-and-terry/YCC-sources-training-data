use strict;
use warnings;

print hex("ff"), " ", hex("0xFF"), "\n";
print oct("755"), " ", oct("0x1f"), " ", oct("0b1010"), "\n";

printf "%x %X %o %b\n", 255, 255, 8, 10;
printf "%#x %#o %#b\n", 255, 8, 5;
printf "%08b\n", 37;

my $bin = sprintf("%b", 100);
print "100 in binary: $bin\n";
print "back to decimal: ", oct("0b$bin"), "\n";

my $rgb = "ff8000";
my ($r, $g, $b) = map { hex } $rgb =~ /(..)(..)(..)/;
print "r=$r g=$g b=$b\n";
