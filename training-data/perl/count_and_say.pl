use strict;
use warnings;

sub next_term { my $s = shift; $s =~ s/((\d)\2*)/length($1) . $2/ge; $s }

my $t = '1';
for (1 .. 10) {
    print "$t\n";
    $t = next_term($t);
}
