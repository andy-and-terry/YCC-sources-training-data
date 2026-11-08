use strict;
use warnings;

my $file = "/tmp/perl_demo_$$.txt";
open(my $out, '>', $file) or die "open: $!";
print $out "line $_\n" for 1 .. 3;
close $out;
open(my $in, '<', $file) or die "open: $!";
while (my $l = <$in>) { chomp $l; print "got: $l\n"; }
close $in;
unlink $file;
