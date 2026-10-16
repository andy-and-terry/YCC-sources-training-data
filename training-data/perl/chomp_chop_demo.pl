use strict;
use warnings;

my $line = "hello\n";
my $removed = chomp($line);
print "chomp removed $removed char, now '$line'\n";

$removed = chomp($line);
print "second chomp removed $removed chars\n";

my $word = "perl!";
my $last = chop($word);
print "chop removed '$last', now '$word'\n";

my @lines = ("a\n", "b\n", "c");
chomp(@lines);
print join("|", @lines), "\n";

{
    local $/ = ";";
    my $rec = "field;";
    chomp($rec);
    print "custom separator chomp: $rec\n";
}
