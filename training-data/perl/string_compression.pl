use strict;
use warnings;

sub compress   { my $s = shift; (my $c = $s) =~ s/((.)\2*)/$2 . length $1/gse; length $c < length $s ? $c : $s }
sub decompress { (my $s = shift) =~ s/(\D)(\d+)/$1 x $2/ge; $s }

for my $s (qw(aabcccccaaa abc wwwwwwwwwwwwbbbx)) {
    my $c = compress($s);
    print "$s -> $c", ($c ne $s ? ' -> ' . decompress($c) : ''), "\n";
}
