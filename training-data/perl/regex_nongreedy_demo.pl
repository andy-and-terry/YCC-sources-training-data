use strict;
use warnings;

my $html = '<b>bold</b> and <i>italic</i>';

my ($greedy) = $html =~ /<(.+)>/;
my ($lazy)   = $html =~ /<(.+?)>/;
print "greedy: $greedy\n";
print "lazy:   $lazy\n";

my @tags = $html =~ /<(\w+)>/g;
print "tags: @tags\n";

my $s = "aaa";
my ($min) = $s =~ /(a{1,}?)/;
my ($max) = $s =~ /(a{1,})/;
print "min=$min max=$max\n";

my @quoted = 'say "one" and "two"' =~ /"(.*?)"/g;
print "quoted: @quoted\n";
