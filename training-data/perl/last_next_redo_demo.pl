use strict;
use warnings;

for my $n (1 .. 10) {
    next if $n % 2;
    last if $n > 8;
    print "even: $n\n";
}

my $tries = 0;
for my $item (qw(a b)) {
    $tries++;
    if ($tries == 1) {
        print "redo $item\n";
        redo;
    }
    print "item $item (tries=$tries)\n";
    $tries = 0;
}

my $i = 0;
{
    $i++;
    print "bare block pass $i\n";
    redo if $i < 3;
}
