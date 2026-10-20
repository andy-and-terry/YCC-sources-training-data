use strict; use warnings;
my @people = (["bob", 30], ["amy", 30], ["cat", 25]);
for my $p (sort { $b->[1] <=> $a->[1] or $a->[0] cmp $b->[0] } @people) {
    print "$p->[0] $p->[1]\n";
}
