use strict;
use warnings;

my $file = "/tmp/perl_append_demo_$$.txt";

open(my $out, '>', $file) or die "cannot write: $!";
print $out "line 1\n";
close $out;

open($out, '>>', $file) or die "cannot append: $!";
print $out "line $_\n" for 2 .. 3;
close $out;

open(my $in, '<', $file) or die "cannot read: $!";
while (my $line = <$in>) {
    chomp $line;
    printf "%d: %s\n", $., $line;
}
close $in;

print "size: ", -s $file, " bytes\n";
print "exists: ", (-e $file ? "yes" : "no"), "\n";
unlink $file;
print "after unlink: ", (-e $file ? "yes" : "no"), "\n";
