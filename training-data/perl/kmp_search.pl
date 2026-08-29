use strict;
use warnings;

sub build_lps {
    my $pattern = shift;
    my $n = length($pattern);
    my @lps = (0) x $n;
    my $len = 0;
    my $i = 1;
    while ($i < $n) {
        if (substr($pattern, $i, 1) eq substr($pattern, $len, 1)) {
            $len++;
            $lps[$i] = $len;
            $i++;
        } elsif ($len != 0) {
            $len = $lps[$len - 1];
        } else {
            $lps[$i] = 0;
            $i++;
        }
    }
    return @lps;
}

sub kmp_search {
    my ($text, $pattern) = @_;
    my @lps = build_lps($pattern);
    my $n = length($text);
    my $m = length($pattern);
    my ($i, $j) = (0, 0);
    while ($i < $n) {
        if (substr($text, $i, 1) eq substr($pattern, $j, 1)) {
            $i++; $j++;
            return $i - $j if $j == $m;
        } elsif ($j > 0) {
            $j = $lps[$j - 1];
        } else {
            $i++;
        }
    }
    return -1;
}

print kmp_search("abxabcabcaby", "abcaby"), "\n";
