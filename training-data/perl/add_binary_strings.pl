use strict;
use warnings;

sub add_binary {
    my ($a, $b) = @_;
    my ($i, $j, $carry, $out) = (length($a) - 1, length($b) - 1, 0, "");
    while ($i >= 0 || $j >= 0 || $carry) {
        my $sum = $carry;
        $sum += substr($a, $i--, 1) if $i >= 0;
        $sum += substr($b, $j--, 1) if $j >= 0;
        $out = ($sum % 2) . $out;
        $carry = int($sum / 2);
    }
    return $out;
}

print add_binary("1010", "1011"), "\n";    # 10101
