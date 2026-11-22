use strict; use warnings;
# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
my @row = (1);
my @out = (1);
for (1 .. 9) {
    my @next = (0);
    push @next, $next[-1] + $_ for reverse @row;
    @row = @next;
    push @out, $row[-1];
}
print "@out\n";
