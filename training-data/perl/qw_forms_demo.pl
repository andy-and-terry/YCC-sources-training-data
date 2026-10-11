use strict;
use warnings;

my @a = qw(one two three);
my @b = qw/x y z/;
my @c = qw[alpha beta];
my @multi = qw(
    first
    second
    third
);
print scalar(@a), scalar(@b), scalar(@c), scalar(@multi), "\n";

my %is_vowel = map { $_ => 1 } qw(a e i o u);
print join("", grep { $is_vowel{$_} } split //, "education"), "\n";

for my $w (qw(red green)) { print "$w\n" }

my ($first, @others) = qw(head tail1 tail2);
print "$first | @others\n";
print "q: ", q(it's 'quoted'), " qq: ", qq(tab\there "$first"), "\n";
