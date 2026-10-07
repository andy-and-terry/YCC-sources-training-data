use strict;
use warnings;

my %KEYS = (2 => 'abc', 3 => 'def', 4 => 'ghi', 5 => 'jkl', 6 => 'mno', 7 => 'pqrs', 8 => 'tuv', 9 => 'wxyz');

sub combos {
    my ($digits) = @_;
    return () unless length $digits;
    my @out = ('');
    for my $d (split //, $digits) {
        my $letters = $KEYS{$d} // die "no letters for $d\n";
        @out = map { my $p = $_; map { "$p$_" } split //, $letters } @out;
    }
    return @out;
}

print join(' ', combos('23')), "\n";
print scalar(combos('79')), " combos for 79\n";
# glob can do the same cartesian product
print join(' ', glob '{a,b,c}{d,e,f}'), "\n";
