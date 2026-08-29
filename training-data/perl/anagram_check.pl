use strict;
use warnings;

sub normalize_str {
    my $s = lc shift;
    $s =~ s/\s//g;
    return join('', sort split //, $s);
}

sub is_anagram {
    my ($a, $b) = @_;
    return normalize_str($a) eq normalize_str($b);
}

print is_anagram("listen", "silent") ? "1" : "0", "\n";
print is_anagram("hello", "world") ? "1" : "0", "\n";
