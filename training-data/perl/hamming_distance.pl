use strict;
use warnings;

sub hamming_str {
    my ($a, $b) = @_;
    die "length mismatch\n" if length $a != length $b;
    return ($a ^ $b) =~ tr/\0//c;    # count non-NUL bytes of the xor
}

sub hamming_int { my $x = $_[0] ^ $_[1]; my $n = 0; $x &= $x - 1, $n++ while $x; $n }

sub total_pairwise {
    my @nums = @_;
    my $total = 0;
    for my $bit (0 .. 31) {
        my $ones = grep { ($_ >> $bit) & 1 } @nums;
        $total += $ones * (@nums - $ones);
    }
    return $total;
}

print hamming_str('karolin', 'kathrin'), ' ', hamming_str('1011101', '1001001'), ' ', hamming_int(1, 4), "\n";
print 'pairwise total for (4,14,2): ', total_pairwise(4, 14, 2), "\n";
