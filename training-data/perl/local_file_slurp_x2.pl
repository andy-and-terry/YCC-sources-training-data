use strict; use warnings;
my $text = do { local $/; open my $fh, '<', $0 or die $!; <$fh> };
print length($text) > 0 ? "read ok\n" : "empty\n";
