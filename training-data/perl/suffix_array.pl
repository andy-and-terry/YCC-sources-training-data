use strict;
use warnings;

sub build_suffix_array {
    my ($s) = @_;
    my @indices = (0 .. length($s) - 1);
    @indices = sort { substr($s, $a) cmp substr($s, $b) } @indices;
    return @indices;
}

my $text = "banana";
my @sa = build_suffix_array($text);
print "@sa\n";
for my $i (@sa) {
    print substr($text, $i), "\n";
}
