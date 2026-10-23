use strict;
use warnings;
use Text::Wrap qw(wrap fill $columns $huge);

my $text = "Perl is a highly capable, feature-rich programming language with over "
         . "thirty years of development behind it. It runs on dozens of platforms "
         . "and is widely used for text processing, system administration and glue code.";

$columns = 40;
print "--- wrap at 40 ---\n";
print wrap("", "", $text), "\n";

print "--- with indents ---\n";
print wrap("* ", "  ", $text), "\n";

$columns = 30;
print "--- narrow, long word ---\n";
$huge = 'wrap';
print wrap("", "", "short supercalifragilisticexpialidocious end"), "\n";

$columns = 50;
print "--- fill paragraphs ---\n";
my $paras = "first paragraph line one\nline two of the first\n\n"
          . "second paragraph that is also fairly short but gets joined";
print fill("", "", $paras), "\n";

# manual alternative using a regex
print "--- regex wrap at 25 ---\n";
(my $copy = $text) =~ s/(.{1,25})(?:\s+|$)/$1\n/g;
print $copy;
