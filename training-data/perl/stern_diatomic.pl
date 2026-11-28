use strict;
use warnings;

sub stern {
    my ($count) = @_;
    my @seq = (0, 1);
    for my $i (2 .. $count - 1) {
        my $h = int($i / 2);
        $seq[$i] = $i % 2 == 0 ? $seq[$h] : $seq[$h] + $seq[$h + 1];
    }
    return @seq[0 .. $count - 1];
}

print join(" ", stern(15)), "\n";    # 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
