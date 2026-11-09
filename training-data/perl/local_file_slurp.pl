use strict; use warnings;
my $text = do { local $/; open my $fh, '<', $0 or die $!; <$fh> };
my $lines = () = $text =~ /\n/g;
print "lines: $lines\n";
