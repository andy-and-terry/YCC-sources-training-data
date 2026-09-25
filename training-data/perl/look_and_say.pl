use strict;
use warnings;

my $s = '1';
for (1 .. 8) {
    print "$s\n";
    $s =~ s/((\d)\2*)/length($1) . $2/ge;
}
