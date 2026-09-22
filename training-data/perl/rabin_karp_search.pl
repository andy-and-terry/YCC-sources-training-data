use strict;
use warnings;

my $BASE = 256;
my $MOD = 1_000_000_007;

sub rabin_karp_search {
    my ($text, $pattern) = @_;
    my $n = length($text);
    my $m = length($pattern);
    return -1 if $m > $n;

    my $high_order = 1;
    $high_order = ($high_order * $BASE) % $MOD for 1 .. $m - 1;

    my ($pattern_hash, $window_hash) = (0, 0);
    for my $i (0 .. $m - 1) {
        $pattern_hash = ($pattern_hash * $BASE + ord(substr($pattern, $i, 1))) % $MOD;
        $window_hash = ($window_hash * $BASE + ord(substr($text, $i, 1))) % $MOD;
    }

    for my $i (0 .. $n - $m) {
        if ($window_hash == $pattern_hash && substr($text, $i, $m) eq $pattern) {
            return $i;
        }
        if ($i < $n - $m) {
            $window_hash = ($window_hash - ord(substr($text, $i, 1)) * $high_order) % $MOD;
            $window_hash = ($window_hash * $BASE + ord(substr($text, $i + $m, 1))) % $MOD;
            $window_hash = ($window_hash + $MOD) % $MOD;
        }
    }
    return -1;
}

print rabin_karp_search("abxabcabcaby", "abcaby"), "\n";
print rabin_karp_search("hello world", "world"), "\n";
print rabin_karp_search("hello world", "xyz"), "\n";
