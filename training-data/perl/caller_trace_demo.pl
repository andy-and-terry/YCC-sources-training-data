use strict;
use warnings;

sub trace {
    my $depth = 0;
    while (my ($pkg, $file, $line, $sub) = caller($depth)) {
        print "  " x $depth, "$sub called at line $line\n";
        $depth++;
    }
}

sub inner { trace() }
sub middle { inner() }
sub outer { middle() }

outer();

sub whoami { return (caller(0))[3] }
sub whocalled { return (caller(1))[3] // "main" }
sub wrapper { return whocalled() }

print whoami(), "\n";
print wrapper(), "\n";
