use strict;
use warnings;

my $text = "a\nb\nc\n";
open(my $fh, '<', \$text) or die;
my $content = do { local $/; <$fh> };
print length($content), "\n";
{ local $, = "-"; local $\ = "!\n"; print "x", "y", "z"; }
{ local $" = ":"; my @a = (1, 2, 3); print "@a\n"; }
open($fh, '<', \$text); local $/ = "\n"; my @lines = <$fh>; print scalar(@lines), "\n";
