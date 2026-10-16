use strict;
use warnings;

my @items = qw(a b c);

print "default: @items\n";
{
    local $" = "-";
    print "list separator: @items\n";
}
{
    local $, = ",";
    local $\ = "!\n";
    print "x", "y", "z";
}
{
    local $; = "|";
    my %h;
    $h{1, 2} = "multi";
    my ($k) = keys %h;
    print "multidim key: $k\n";
}
print "done\n";
