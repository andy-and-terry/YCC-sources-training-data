use strict;
use warnings;

sub is_palindrome {
    my $s = lc shift;
    $s =~ s/[^a-z0-9]//g;
    return $s eq reverse($s);
}

print is_palindrome("A man, a plan, a canal: Panama") ? "1" : "0", "\n";
print is_palindrome("hello") ? "1" : "0", "\n";
