use strict;
use warnings;

sub is_pangram {
    my %seen = map { $_ => 1 } (lc shift) =~ /[a-z]/g;
    return keys(%seen) == 26 ? 1 : 0;
}

print is_pangram("The quick brown fox jumps over the lazy dog"), "\n";
print is_pangram("Hello world"), "\n";
