use strict;
use warnings;

print ord("A"), " ", ord("a"), " ", ord("0"), "\n";
print chr(72), chr(105), "\n";

my $s = "Hello";
print join(" ", map { ord } split //, $s), "\n";

my $shifted = join "", map { chr(ord($_) + 1) } split //, "HAL";
print "$shifted\n";

for my $c ("a" .. "e") {
    printf "%s=%d(0x%02x) ", $c, ord $c, ord $c;
}
print "\n";

print "next letter: ", ++(my $z = "az"), "\n";
print "unicode: ", sprintf("U+%04X", ord("\x{263A}")), "\n";
