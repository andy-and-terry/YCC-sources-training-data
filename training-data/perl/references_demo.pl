use strict;
use warnings;

my @numbers  = (1, 2, 3);
my $array_ref = \@numbers;
push @$array_ref, 4;
print "array via ref: @$array_ref\n";
print "first element: ${$array_ref}[0] / $array_ref->[0]\n";

my %ages = (alice => 30, bob => 25);
my $hash_ref = \%ages;
$hash_ref->{carol} = 40;
print "alice is $hash_ref->{alice}\n";

# array of hash refs
my @people = (
    { name => "Alice", age => 30 },
    { name => "Bob",   age => 25 },
);
for my $person (@people) {
    print "$person->{name} is $person->{age}\n";
}

# reference to a reference
my $ref_to_ref = \$array_ref;
print "deref twice: @{$$ref_to_ref}\n";

# anonymous nested structure
my $tree = { value => 1, children => [ { value => 2, children => [] }, { value => 3, children => [] } ] };
my @child_values = map { $_->{value} } @{ $tree->{children} };
print "children of root: @child_values\n";
