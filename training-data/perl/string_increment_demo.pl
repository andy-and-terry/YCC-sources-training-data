use strict; use warnings;

my $id = "aa9";
print ++$id, "\n";
my $z = "Zz";
print ++$z, "\n";
my $v = "a9";
$v++ for 1 .. 3;
print "$v\n";
my @labels = ("A") x 1;
my $c = "A";
push @labels, ++$c for 1 .. 4;
print "@labels\n";
