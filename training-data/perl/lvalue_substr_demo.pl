use strict;
use warnings;

my $s = "Hello, World";

substr($s, 0, 5) = "Howdy";
print "$s\n";

substr($s, -5) =~ s/World/Perl!/;
print "$s\n";

# 4-argument form replaces and returns the old text
my $old = substr($s, 0, 5, "Hi");
print "$old -> $s\n";

my $ref = \substr($s, 0, 2);
$$ref = "Yo";
print "$s\n";
