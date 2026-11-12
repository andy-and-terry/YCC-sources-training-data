use strict; use warnings;
my $f = "/tmp/_perl_demo.txt";
open(my $o, '>', $f) or die $!; print $o "a\nb\nc\n"; close $o;
open(my $i, '<', $f) or die $!;
while (my $l = <$i>) { chomp $l; print "$.: $l\n"; }
close $i; unlink $f;
