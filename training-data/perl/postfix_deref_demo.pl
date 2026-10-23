use strict;
use warnings;
use feature qw(say postderef);

my $list = [ 3, 1, 2 ];
my $map  = { b => 2, a => 1, c => 3 };
my $code = sub { "called with @_" };
my $sref = \"scalar value";

# Postfix dereference reads left to right, unlike @{ $ref }.
say scalar $list->@*;          # element count
say "last index: ", $list->$#*;
say join ",", sort { $a <=> $b } $list->@*;
say join ",", sort keys $map->%*;
say $sref->$*;
say $code->(7);

# Slices.
say join ",", $list->@[0, 1];
say join ",", $map->@{qw(a c)};
my %sub = $map->%{qw(a b)};
say join ",", map { "$_=$sub{$_}" } sort keys %sub;

# Works naturally in chains of nested data.
my $data = { users => [ { name => "ada" }, { name => "grace" } ] };
say join ",", map { $_->{name} } $data->{users}->@*;

# And interpolates inside strings with the postderef_qq feature.
use feature 'postderef_qq';
say "items: $list->@*";
