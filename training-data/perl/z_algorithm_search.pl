use strict;
use warnings;

sub z_array {
    my ($s) = @_;
    my $n = length($s);
    my @z = (0) x $n;
    my ($l, $r) = (0, 0);
    for (my $i = 1; $i < $n; $i++) {
        if ($i < $r) {
            my $candidate = $r - $i;
            my $mirror = $z[$i - $l];
            $z[$i] = $mirror < $candidate ? $mirror : $candidate;
        }
        while ($i + $z[$i] < $n && substr($s, $z[$i], 1) eq substr($s, $i + $z[$i], 1)) {
            $z[$i]++;
        }
        if ($i + $z[$i] > $r) {
            ($l, $r) = ($i, $i + $z[$i]);
        }
    }
    return @z;
}

sub z_search {
    my ($text, $pattern) = @_;
    my $combined = $pattern . "\x01" . $text;
    my @z = z_array($combined);
    my $plen = length($pattern);
    my @matches;
    for my $i ($plen + 1 .. $#z) {
        push @matches, $i - $plen - 1 if $z[$i] >= $plen;
    }
    return @matches;
}

my @positions = z_search("abxabcabcaby", "abc");
print join(" ", @positions), "\n";
