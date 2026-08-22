use strict;
use warnings;

sub safe_divide {
    my ($a, $b) = @_;
    die "division by zero\n" if $b == 0;
    return $a / $b;
}

for my $pair ([10, 2], [5, 0]) {
    my ($a, $b) = @$pair;
    my $result = eval { safe_divide($a, $b) };
    if ($@) {
        print "error: $@";
    } else {
        print "$a / $b = $result\n";
    }
}
