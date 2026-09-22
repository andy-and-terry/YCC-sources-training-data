use strict;
use warnings;

my @words = ("banana", "kiwi", "apple", "fig", "cherry");

my @by_length = sort { length($a) <=> length($b) || $a cmp $b } @words;
print join(",", @by_length), "\n";

my @people = (
    { name => "Alice", age => 30 },
    { name => "Bob", age => 25 },
    { name => "Carol", age => 25 },
);

my @by_age_then_name = sort { $a->{age} <=> $b->{age} || $a->{name} cmp $b->{name} } @people;
print join(",", map { "$_->{name}:$_->{age}" } @by_age_then_name), "\n";

my @schwartzian = map { $_->[0] }
                   sort { $a->[1] <=> $b->[1] }
                   map { [$_, length($_)] } @words;
print join(",", @schwartzian), "\n";
