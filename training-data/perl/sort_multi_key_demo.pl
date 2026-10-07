use strict; use warnings;

my @people = (
    { name => 'Zoe',  age => 30 },
    { name => 'Adam', age => 25 },
    { name => 'Bob',  age => 30 },
);
for my $p (sort { $b->{age} <=> $a->{age} or $a->{name} cmp $b->{name} } @people) {
    print "$p->{name} ($p->{age})\n";
}
my @by_len = sort { length($a) <=> length($b) || $a cmp $b } qw(pear fig apple kiwi);
print "@by_len\n";
