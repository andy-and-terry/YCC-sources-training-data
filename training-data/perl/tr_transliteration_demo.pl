use strict;
use warnings;

my $text = "Hello, World! 123";

(my $upper = $text) =~ tr/a-z/A-Z/;
print "$upper\n";

my $vowels = ($text =~ tr/aeiouAEIOU//);
print "vowels: $vowels\n";

my $digits = ($text =~ tr/0-9//);
print "digits: $digits\n";

(my $stripped = $text) =~ tr/a-zA-Z//cd;      # delete everything but letters
print "letters only: $stripped\n";

(my $squeezed = "aaabbbccc") =~ tr/a-z//s;     # squeeze repeats
print "squeezed: $squeezed\n";

(my $rot13 = "Hello") =~ tr/A-Za-z/N-ZA-Mn-za-m/;
print "rot13: $rot13\n";

my $copy = $text =~ tr/a-z/A-Z/r;              # non-destructive
print "$copy / $text\n";
