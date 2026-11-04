use strict; use warnings;

sub is_toeplitz {
    my @m = @_;
    for my $i (1 .. $#m) {
        for my $j (1 .. $#{ $m[$i] }) {
            return 0 if $m[$i][$j] != $m[$i-1][$j-1];
        }
    }
    return 1;
}

print is_toeplitz([1,2,3],[4,1,2],[5,4,1]), "\n";
print is_toeplitz([1,2],[2,2]), "\n";
