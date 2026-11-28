use strict; use warnings;
my $n = 8;
for my $r (0 .. $n - 1) {
    print ' ' x ($n - $r - 1);
    print((($r & $_) == $_) ? '* ' : '  ') for 0 .. $r;
    print "\n";
}
