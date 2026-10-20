use strict;
use warnings;

# Reading and writing through in-memory filehandles.
my $buffer = "";
open(my $out, '>', \$buffer) or die $!;
print $out "line $_\n" for 1 .. 3;
close $out;

open(my $in, '<', \$buffer) or die $!;
while (my $line = <$in>) {
    chomp $line;
    print "$.: $line\n";
}
close $in;
