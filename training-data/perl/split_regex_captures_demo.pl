use strict;
use warnings;

my $expr = "12+34-5*6";
my @tokens = split /([+\-*\/])/, $expr;
print join(" ", map { "[$_]" } @tokens), "\n";

my @words = split ' ', "   leading and   multiple   spaces ";
print scalar(@words), " words: @words\n";

my @parts = split /\s*[,;]\s*/, "a , b;c ;  d";
print join("|", @parts), "\n";

my ($key, $value) = split /=/, "name=Ada=Lovelace", 2;
print "$key -> $value\n";

print join(",", split(/(?=[A-Z])/, "camelCaseStringHere")), "\n";
