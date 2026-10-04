use strict; use warnings;

print "-" x 20, "\n";
my @row = (0) x 5;
print "@row\n";
my @pairs = map { "$_=" . ($_ ** 2) } 1 .. 4;
print join(", ", @pairs), "\n";
print "ab" x 3, "\n";
my $line = join "|", ("x") x 4;
print "$line\n";
