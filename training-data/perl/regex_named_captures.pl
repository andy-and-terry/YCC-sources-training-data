use strict; use warnings;
my $line = "2024-03-15 ERROR disk full";
if ($line =~ /^(?<date>\d{4}-\d\d-\d\d)\s+(?<level>[A-Z]+)\s+(?<msg>.+)$/) {
    print "$+{level} on $+{date}: $+{msg}\n";
}
(my $copy = $line) =~ s/\d/#/g;
print "$copy\n";
