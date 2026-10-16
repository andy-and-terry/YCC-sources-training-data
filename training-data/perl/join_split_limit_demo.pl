use strict;
use warnings;

my $record = "alice:x:1000:1000:Alice Smith:/home/alice:/bin/bash";

my @all = split /:/, $record;
print scalar(@all), " fields\n";

my ($user, $pw, @rest) = split /:/, $record, 3;
print "user=$user rest=$rest[0]\n";

my @chars = split //, "abc";
print join(",", @chars), "\n";

my @trailing = split /,/, "a,b,,,";
print scalar(@trailing), " fields without limit\n";
my @kept = split /,/, "a,b,,,", -1;
print scalar(@kept), " fields with -1\n";

print join("-", 1 .. 5), "\n";
