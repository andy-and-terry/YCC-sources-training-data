use strict;
use warnings;

sub is_valid {
    my $s = shift;
    my @stack;
    my %pairs = (')' => '(', ']' => '[', '}' => '{');
    for my $c (split //, $s) {
        if ($c eq '(' || $c eq '[' || $c eq '{') {
            push @stack, $c;
        } elsif (exists $pairs{$c}) {
            return 0 if !@stack || pop(@stack) ne $pairs{$c};
        }
    }
    return @stack == 0;
}

print is_valid("{[()]}") ? "1" : "0", "\n";
print is_valid("{[(])}") ? "1" : "0", "\n";
