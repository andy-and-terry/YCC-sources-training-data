use strict;
use warnings;

my $word = "pERL";
print lc($word), "\n";
print uc($word), "\n";
print ucfirst(lc($word)), "\n";
print lcfirst($word), "\n";

my $title = join " ", map { ucfirst lc } split / /, "the PERL programming LANGUAGE";
print "$title\n";

print "\Uupper\E and \LLOWER\E and \uone \lTWO\n";
