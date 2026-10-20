use strict;
use warnings;

my $f = "/tmp/perl_demo_$$.txt";
open(my $out, '>', $f) or die "cannot open: $!";
print $out "line $_\n" for 1 .. 3;
close $out;
open(my $app, '>>', $f) or die; print $app "appended\n"; close $app;
open(my $in, '<', $f) or die;
while (my $l = <$in>) { chomp $l; print "$.: $l\n"; }
close $in;
open($in, '<', $f) or die; my @all = <$in>; close $in;
print scalar(@all), " lines, size ", -s $f, "\n";
unlink $f;
print -e $f ? "exists\n" : "gone\n";
