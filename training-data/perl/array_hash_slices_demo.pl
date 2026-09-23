use strict;
use warnings;

my @numbers = (10, 20, 30, 40, 50, 60);
my @middle = @numbers[2 .. 4];
print "slice: @middle\n";

@numbers[0, 1] = (100, 200);
print "updated: @numbers\n";

my %capitals = (France => "Paris", Japan => "Tokyo", Peru => "Lima", Chad => "N'Djamena");
my @wanted = @capitals{qw(France Japan)};
print "capitals: @wanted\n";

my @countries = ("France", "Japan", "Mars");
my @found = @capitals{@countries};
print join(", ", map { defined $_ ? $_ : "unknown" } @found), "\n";
