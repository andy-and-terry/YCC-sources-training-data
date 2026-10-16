use strict;
use warnings;

my $n = "1234567.891";
1 while $n =~ s/^(\d+)(\d{3})/$1,$2/;
print "$n\n";

my $m = "9876543";
$m =~ s/(?<=\d)(?=(?:\d{3})+$)/,/g;
print "$m\n";

my @words = "foobar foobaz fooqux" =~ /foo(?=ba)\w+/g;
print "lookahead: @words\n";

my @not = "foobar foobaz fooqux" =~ /\bfoo(?!ba)\w+/g;
print "negative: @not\n";

my ($amount) = 'cost: $45 or 30 euros' =~ /(?<=\$)(\d+)/;
print "after dollar: $amount\n";

print "no 'bar' prefix: ", join(",", grep { /(?<!bar)baz/ } qw(foobaz barbaz)), "\n";
