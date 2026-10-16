use strict;
use warnings;
use sort 'stable';

my @people = (
    [ "Ann", 30 ], [ "Bob", 25 ], [ "Cid", 30 ],
    [ "Dee", 25 ], [ "Eve", 30 ],
);

my @by_age = sort { $a->[1] <=> $b->[1] } @people;
print join(" ", map { "$_->[0]($_->[1])" } @by_age), "\n";

my @desc = sort { $b->[1] <=> $a->[1] or $a->[0] cmp $b->[0] } @people;
print join(" ", map { "$_->[0]($_->[1])" } @desc), "\n";

my @rev = reverse sort { $a <=> $b } (3, 1, 2);
print "@rev\n";
