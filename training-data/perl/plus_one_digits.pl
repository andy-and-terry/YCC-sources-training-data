use strict;
use warnings;

sub plus_one {
    my @d = @_;
    for (my $i = $#d; $i >= 0; $i--) {
        if ($d[$i] < 9) { $d[$i]++; return @d }
        $d[$i] = 0;
    }
    return (1, @d);
}

print join(",", plus_one(1, 2, 9)), "\n";    # 1,3,0
print join(",", plus_one(9, 9)), "\n";       # 1,0,0
