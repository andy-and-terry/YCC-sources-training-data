use strict;
use warnings;

my %capital = (
    France  => "Paris",
    Italy   => "Rome",
    Spain   => "Madrid",
);

my %country_of = map { $capital{$_} => $_ } keys %capital;
for my $city (sort keys %country_of) {
    print "$city is the capital of $country_of{$city}\n";
}

my %grade = (ann => "A", bob => "B", cy => "A", di => "B", ed => "C");
my %students_by_grade;
push @{ $students_by_grade{ $grade{$_} } }, $_ for sort keys %grade;
for my $g (sort keys %students_by_grade) {
    print "$g: @{ $students_by_grade{$g} }\n";
}
