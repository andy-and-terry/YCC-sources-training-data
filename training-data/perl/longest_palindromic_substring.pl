use strict;
use warnings;

sub expand_around_center {
    my ($s, $left, $right) = @_;
    while ($left >= 0 && $right < length($s) && substr($s, $left, 1) eq substr($s, $right, 1)) {
        $left--;
        $right++;
    }
    return substr($s, $left + 1, $right - $left - 1);
}

sub longest_palindromic_substring {
    my ($s) = @_;
    my $best = "";
    for my $i (0 .. length($s) - 1) {
        for my $pair ([$i, $i], [$i, $i + 1]) {
            my $candidate = expand_around_center($s, @$pair);
            $best = $candidate if length($candidate) > length($best);
        }
    }
    return $best;
}

print longest_palindromic_substring("babad"), "\n";
print longest_palindromic_substring("cbbd"), "\n";
