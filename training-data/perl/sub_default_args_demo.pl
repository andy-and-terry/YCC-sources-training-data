use strict;
use warnings;

sub greet {
    my ($name, $greeting) = @_;
    $greeting //= "Hello";
    $name = "world" unless defined $name;
    return "$greeting, $name!";
}

print greet(), "\n";
print greet("Perl"), "\n";
print greet("Perl", "Howdy"), "\n";

sub scale {
    my $factor = @_ > 1 ? $_[1] : 2;
    return $_[0] * $factor;
}
print scale(5), " ", scale(5, 3), "\n";

sub count_args { return scalar @_ }
print count_args(1, (2, 3), [4, 5]), "\n";
