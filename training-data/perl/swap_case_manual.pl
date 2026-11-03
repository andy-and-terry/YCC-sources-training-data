use strict;
use warnings;

sub swap_case {
    my ($s) = @_;
    $s =~ tr/a-zA-Z/A-Za-z/;
    return $s;
}

print swap_case("Hello World 42"), "\n";
