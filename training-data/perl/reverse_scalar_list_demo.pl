use strict;
use warnings;

my @list = (1, 2, 3, 4);
my @rev = reverse @list;
print "list reverse: @rev\n";

my $str = reverse "hello";
print "scalar reverse: $str\n";

print "print context: ", reverse("abc"), "\n";
print "forced scalar: ", scalar reverse("abc"), "\n";

my %color = (red => 1, green => 2, blue => 3);
my %by_num = reverse %color;
print "$_ => $by_num{$_}\n" for sort keys %by_num;
