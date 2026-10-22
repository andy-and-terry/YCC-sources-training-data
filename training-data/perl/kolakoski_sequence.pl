use strict;
use warnings;

sub kolakoski {
    my ($count) = @_;
    my @seq = (1, 2, 2);
    my $i = 2;
    while (@seq < $count) {
        my $value = 3 - $seq[-1];
        push @seq, ($value) x $seq[$i];
        $i++;
    }
    return @seq[0 .. $count - 1];
}

print join(" ", kolakoski(20)), "\n";
