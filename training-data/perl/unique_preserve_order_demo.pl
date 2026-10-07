use strict; use warnings;

my @items = qw(b a b c a d c);
my %seen;
my @uniq = grep { !$seen{$_}++ } @items;
print "@uniq\n";
my %count;
$count{$_}++ for @items;
print join(", ", map { "$_:$count{$_}" } sort keys %count), "\n";
my @dups = grep { $count{$_} > 1 } sort keys %count;
print "dups: @dups\n";
