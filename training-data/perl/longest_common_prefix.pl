use strict;
use warnings;

sub lcp_scan {
    return '' unless @_;
    my $p = shift;
    for my $s (@_) {
        chop $p while index($s, $p) != 0;
    }
    return $p;
}

sub lcp_sorted {
    return '' unless @_;
    my ($first, $last) = (sort @_)[0, -1];
    my $i = 0;
    $i++ while $i < length $first && substr($first, $i, 1) eq substr($last, $i, 1);
    return substr $first, 0, $i;
}

sub lcp_xor {    # bitwise string xor: leading NULs mark the shared prefix
    my $p = shift // return '';
    for my $s (@_) {
        my $n = (($p ^ $s) =~ /^(\0*)/)[0];
        my $len = length $n;
        $len = length $s if $len > length $s;
        $p = substr $p, 0, $len;
    }
    return $p;
}

for my $words (['flower', 'flow', 'flight'], ['dog', 'racecar', 'car'], ['interspecies', 'interstellar', 'interstate']) {
    printf "%-40s scan=%-6s sorted=%-6s xor=%s\n", "@$words", map({ "'$_'" } lcp_scan(@$words), lcp_sorted(@$words)), "'" . lcp_xor(@$words) . "'";
}
