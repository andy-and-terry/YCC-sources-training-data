use strict;
use warnings;

my $n = 3;
unless ($n > 5) {
    print "n is not greater than 5\n";
}
else {
    print "n is greater than 5\n";
}

print "postfix unless\n" unless $n == 0;

my $count = 0;
until ($count >= 3) {
    print "until count=$count\n";
    $count++;
}

do {
    print "do-until count=$count\n";
    $count--;
} until $count <= 1;
