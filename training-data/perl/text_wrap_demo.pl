use strict;
use warnings;
use Text::Wrap qw(wrap $columns);

my $text = "Perl is a highly capable, feature-rich programming language "
         . "with over thirty years of development behind it.";

$columns = 30;
print wrap("", "", $text), "\n\n";

print wrap("* ", "  ", $text), "\n\n";

$columns = 50;
print wrap("> ", "> ", $text), "\n";
