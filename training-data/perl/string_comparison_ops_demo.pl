use strict;
use warnings;

my @pairs = (["apple", "banana"], ["10", "9"], ["abc", "abc"]);

for my $p (@pairs) {
    my ($x, $y) = @$p;
    print "'$x' cmp '$y' = ", ($x cmp $y), "\n";
    print "  lt: ", ($x lt $y ? "yes" : "no"), "\n";
    print "  eq: ", ($x eq $y ? "yes" : "no"), "\n";
}
print "numeric 10 <=> 9 = ", (10 <=> 9), "\n";
print "string '10' cmp '9' = ", ("10" cmp "9"), "\n";
print "'1.0' == 1: ", ("1.0" == 1 ? "true" : "false"), "\n";
print "'1.0' eq '1': ", ("1.0" eq "1" ? "true" : "false"), "\n";
